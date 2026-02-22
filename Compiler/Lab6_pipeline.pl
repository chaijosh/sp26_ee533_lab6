#!/usr/bin/perl -w
use lib "/usr/local/netfpga/lib/Perl5";
use strict;

# ==============================================================================
# REGISTER MAP (Aligned with reg_defines_lab6_test_2.h)
# ==============================================================================
my $PIPELINE_DATAPATH_BASE_ADDR           = 0x2001100;

# Software Registers (Write to Control CPU)
my $PIPELINE_DATAPATH_IMEM_INTERACT_REG   = 0x2001100; # Reg 0: [0]=Debug, [1]=SoftReset
my $PIPELINE_DATAPATH_IMEM_WRITE_REG      = 0x2001104; # Reg 1: IMEM Write Enable
my $PIPELINE_DATAPATH_IMEM_RW_ADDRESS_REG = 0x2001108; # Reg 2: IMEM Address
my $PIPELINE_DATAPATH_IMEM_WDATA_REG      = 0x200110c; # Reg 3: IMEM Data In
my $PIPELINE_DATAPATH_DMEM_INTERACT_REG   = 0x2001110; # Reg 4: DMEM Interact (Capture Enable)
my $PIPELINE_DATAPATH_DMEM_WRITE_REG      = 0x2001114; # Reg 5: DMEM Write Enable
my $PIPELINE_DATAPATH_DMEM_RW_ADDRESS_REG = 0x2001118; # Reg 6: DMEM Address
my $PIPELINE_DATAPATH_DMEM_WDATA_HI_REG   = 0x200111c; # Reg 7: DMEM Data In (High 32)
my $PIPELINE_DATAPATH_DMEM_WDATA_LO_REG   = 0x2001120; # Reg 8: DMEM Data In (Low 32)

# Hardware Registers (Read Back Status)
my $PIPELINE_DATAPATH_IMEM_RDATA_REG      = 0x2001124; # HW Reg 0: IMEM Data Out
my $PIPELINE_DATAPATH_DMEM_RDATA_LO_REG   = 0x2001128; # HW Reg 1: DMEM Data Out (Low 32)
my $PIPELINE_DATAPATH_DMEM_RDATA_HI_REG   = 0x200112c; # HW Reg 2: DMEM Data Out (High 32)
my $PIPELINE_DATAPATH_HWREG1_REG          = 0x2001130; # HW Reg 3: Current PC Value

# ==============================================================================
# HELPER FUNCTIONS (NF2 Register Access)
# ==============================================================================

sub silent_regwrite {
    my ($addr, $value) = @_;
    my $cmd = sprintf("regwrite 0x%08x 0x%08x 2>&1", $addr, $value);
    `$cmd`;
}

sub regread {
    my ($addr) = @_;
    my $cmd = sprintf("regread 0x%08x", $addr);
    my @out = `$cmd`;
    if (defined $out[0] && $out[0] =~ m/:\s+(0x[0-9a-f]+)/i) {
        return $1;
    }
    return "0x00000000";
}

# ==============================================================================
# STATE CONTROL
# ==============================================================================

# Reset Active (Bit 1=0), Debug Mode On (Bit 0=1)
sub cpu_reset { 
    silent_regwrite($PIPELINE_DATAPATH_IMEM_INTERACT_REG, 0x1); 
} 

# Run Mode: Reset Inactive (Bit 1=1), Debug Mode Off (Bit 0=0)
# Also clears DMEM Capture to ready it for next read
sub cpu_run_state { 
    silent_regwrite($PIPELINE_DATAPATH_DMEM_INTERACT_REG, 0x0);
    silent_regwrite($PIPELINE_DATAPATH_IMEM_INTERACT_REG, 0x2); 
} 

# Freeze Mode: Reset Inactive (Bit 1=1), Debug Mode On (Bit 0=1)
# Pauses pipeline, allows memory access
sub cpu_freeze { 
    silent_regwrite($PIPELINE_DATAPATH_IMEM_INTERACT_REG, 0x3); 
} 

# ==============================================================================
# MEMORY ACCESS
# ==============================================================================

sub write_imem {
    my ($addr, $hex_instr) = @_;
    
    # Ensure CPU is paused for access
    cpu_freeze();
    
    silent_regwrite($PIPELINE_DATAPATH_IMEM_WRITE_REG, 1);
    # 1. Set Address & Data
    silent_regwrite($PIPELINE_DATAPATH_IMEM_RW_ADDRESS_REG, $addr);
    silent_regwrite($PIPELINE_DATAPATH_IMEM_WDATA_REG, hex($hex_instr));
    
    # 2. Pulse Write Enable 
    silent_regwrite($PIPELINE_DATAPATH_IMEM_WRITE_REG, 0);
    
    printf("  IMEM[0x%02x] <= %s\n", $addr, $hex_instr);
}

sub read_imem {
    my ($addr) = @_;
    
    cpu_freeze();
    
    # IMEM Readback is continuous in Debug Mode
    silent_regwrite($PIPELINE_DATAPATH_IMEM_RW_ADDRESS_REG, $addr);
    
    return regread($PIPELINE_DATAPATH_IMEM_RDATA_REG);
}

sub write_dmem {
    my ($addr, $val64_hex) = @_;
    
    # Ensure CPU is paused
    cpu_freeze();
    silent_regwrite($PIPELINE_DATAPATH_DMEM_WRITE_REG, 1);
    # 1. Prepare 64-bit Data
    my $clean = $val64_hex; 
    $clean =~ s/^0x//i; 
    $clean = sprintf("%016s", $clean); # Pad to 16 hex chars
    my $hi = hex(substr($clean, 0, 8)); 
    my $lo = hex(substr($clean, 8, 8));
    
    # 2. Set Address & Data Registers
    silent_regwrite($PIPELINE_DATAPATH_DMEM_RW_ADDRESS_REG, $addr);
    silent_regwrite($PIPELINE_DATAPATH_DMEM_WDATA_HI_REG, $hi);
    silent_regwrite($PIPELINE_DATAPATH_DMEM_WDATA_LO_REG, $lo);
    
    # 3. Disable Write Enable 
    silent_regwrite($PIPELINE_DATAPATH_DMEM_WRITE_REG, 0);
    
    printf("  DMEM[0x%02x] <= %s\n", $addr, $val64_hex);
}

sub read_dmem {
    my ($addr) = @_;
    
    cpu_freeze();
    
    # 1. Set Address FIRST
    silent_regwrite($PIPELINE_DATAPATH_DMEM_RW_ADDRESS_REG, $addr);

    # 2. Toggle Capture Bit (Low -> High)
    # This forces the Verilog to latch the NEW data from the updated address
    
    # 3. Read the Captured Data
    my $hi = regread($PIPELINE_DATAPATH_DMEM_RDATA_HI_REG);
    my $lo = regread($PIPELINE_DATAPATH_DMEM_RDATA_LO_REG);
    
    # Format output
    $lo =~ s/^0x//i;
    return $hi . $lo;
}

# ==============================================================================
# CLI EXECUTION
# ==============================================================================

my $cmd = $ARGV[0];

if (!defined $cmd) {
    print "Usage: ./cpu_control.pl <command> [args]\n";
    print "  load <file.mem>       : Load Program & Data (Resets CPU)\n";
    print "  run                   : Run CPU (Reset=1)\n";
    print "  status                : Freeze & Dump State\n";
    print "  writereg <addr> <val> : Write ANY register\n";
    print "  readreg <addr>        : Read ANY register\n";
    print "  writeins <addr> <hex> : IMEM Access\n";
    print "  readins <addr>        : IMEM Read\n";
    print "  writedata <addr> <hex>: DMEM Access\n";
    print "  readdata <addr>       : DMEM Read\n";
    exit;
}

if ($cmd eq "load") {
    my $file = $ARGV[1];
    die "Usage: ./cpu_control.pl load <filename.mem>\n" unless defined $file;
    die "Error: File '$file' not found.\n" unless -e $file;

    print "--- RESETTING & LOADING FROM $file ---\n";
    
    # Initial Hard Reset
    cpu_reset(); 
    
    # Program Instructions (Loaded dynamically from the .mem file)
    open(my $fh, '<', $file) or die "Could not open '$file': $!\n";
    
    my $addr = 0;
    while (my $line = <$fh>) {
        $line =~ s/\/\/.*//;           # Remove inline comments
        $line =~ s/\s+//g;             # Remove whitespace
        $line =~ s/,$//;               # Remove trailing commas
        
        next if $line eq "";           # Skip blank lines
        
        my $hex_instr = $line;
        $hex_instr = "0x" . $hex_instr unless $hex_instr =~ /^0x/i;
        
        write_imem($addr, $hex_instr); 
        $addr++;
    }
    close($fh);
    
    # Initial Data: Your Bubble Sort Array (64-bit Sign-Extended)
    print "\n--- LOADING DMEM ARRAY ---\n";
    write_dmem(0, "0x000000000000007B");  # 123
    write_dmem(1, "0xFFFFFFFFFFFFFE39");  # -455
    write_dmem(2, "0x0000000000000002");  # 2
    write_dmem(3, "0x0000000000000062");  # 98
    write_dmem(4, "0x000000000000007D");  # 125
    write_dmem(5, "0x000000000000000A");  # 10
    write_dmem(6, "0x0000000000000041");  # 65
    write_dmem(7, "0xFFFFFFFFFFFFFFC8");  # -56
    write_dmem(8, "0x0000000000000000");  # 0
    write_dmem(9, "0x0000000000000143");  # 323
    
    print "\nLoad Complete. $addr instructions written. CPU is in Freeze state.\n";

} elsif ($cmd eq "run") {
    print "--- RUNNING ---\n";
    cpu_run_state();

} elsif ($cmd eq "status") {
    print "--- STATUS ---\n";
    cpu_freeze();
    
    my $pc = regread($PIPELINE_DATAPATH_HWREG1_REG);
    print "PC: $pc\n";
    
    print "IMEM (First 20 Inst):\n"; 
    for my $i (0..19) { printf("  [%02d]: %s\n", $i, read_imem($i)); }
    
    silent_regwrite($PIPELINE_DATAPATH_DMEM_INTERACT_REG, 0x0); 
    silent_regwrite($PIPELINE_DATAPATH_DMEM_INTERACT_REG, 0x1);
    
    print "\nDMEM (Array 0-9):\n"; 
    for my $i (0..9) { printf("  [%02d]: %s\n", $i, read_dmem($i)); }

} elsif ($cmd eq "writereg") {
    die "Usage: writereg <addr> <val>\n" unless defined $ARGV[2];
    silent_regwrite(hex($ARGV[1]), hex($ARGV[2]));
    printf("Wrote 0x%08x to Register 0x%08x\n", hex($ARGV[2]), hex($ARGV[1]));

} elsif ($cmd eq "readreg") {
    die "Usage: readreg <addr>\n" unless defined $ARGV[1];
    my $val = regread(hex($ARGV[1]));
    printf("Reg 0x%08x: %s\n", hex($ARGV[1]), $val);

} elsif ($cmd eq "writeins") {
    write_imem($ARGV[1], $ARGV[2]);

} elsif ($cmd eq "readins") {
    print read_imem($ARGV[1]) . "\n";

} elsif ($cmd eq "writedata") {
    silent_regwrite($PIPELINE_DATAPATH_DMEM_INTERACT_REG, 0x0); 
    silent_regwrite($PIPELINE_DATAPATH_DMEM_INTERACT_REG, 0x1);
    write_dmem($ARGV[1], $ARGV[2]);

} elsif ($cmd eq "readdata") {
    silent_regwrite($PIPELINE_DATAPATH_DMEM_INTERACT_REG, 0x0); 
    silent_regwrite($PIPELINE_DATAPATH_DMEM_INTERACT_REG, 0x1);
    print read_dmem($ARGV[1]) . "\n";

} else {
    print "Unknown command.\n";
}