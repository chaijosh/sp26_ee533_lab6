`timescale 1ns / 1ps

module cpu_tb1;

// Inputs to the DUT
reg CLK;
reg RSTB;

// Instantiate the Device Under Test (DUT)
cpu_behavioural dut (
    .CLK(CLK),
    .RSTB(RSTB)
);

// Clock Generation
parameter CLK_PERIOD = 200;
initial begin
    CLK = 0;
    forever #(CLK_PERIOD/2) CLK = ~CLK;
end

// Main Test Sequence
initial begin
    $display("Starting Testbench for basic CPU operations...");

    // 1. Apply Reset
    RSTB = 1'b0;
    #(CLK_PERIOD * 2); // Hold reset for 2 cycles
    RSTB = 1'b1;
    $display("Reset released at time %0t", $time);
    
    // --- Test Setup ---
    // Wait for one cycle after reset before accessing internal signals
    #(CLK_PERIOD); 

    // 2. Initialize Register File with test values
    // Hierarchical access is used to preset the DUT's internal state.
    $display("Initializing source registers...");
    dut.reg_file[1] = 64'd10;  // R1 = 10
    dut.reg_file[2] = 64'd20;  // R2 = 20

    dut.reg_file[4] = 64'd100; // R4 = 100
    dut.reg_file[5] = 64'd33;  // R5 = 33

    dut.reg_file[7] = 64'd500; // R7 = 500
    dut.reg_file[8] = 64'd600; // R8 = 600

    // 3. Initialize registers for LW/SW tests
    $display("Initializing registers for LW/SW tests...");
    dut.reg_file[10] = 64'd2;
    dut.reg_file[11] = 64'd5;

    // --- Verification ---
    // Wait for the instructions to complete the 5-stage pipeline and write back.
    // Assuming 5 instructions (3 ALU + LW + SW) + 5 stages = ~10 cycles. We'll wait for 15 to be safe.
    #(CLK_PERIOD * 20);

    $display("\n--- Verification Phase ---");
    $display("Checking final register values at time %0t", $time);

    // --- ALU Verification ---
    // Check result of ADD R3, R1, R2 (10 + 20 = 30)
    $display("R3 (ADD result): Expected=30, Actual=%0d", dut.reg_file[3]);
    if (dut.reg_file[3] !== 64'd30) $display("--> TEST FAILED for ADD R3");

    // Check result of SUB R6, R4, R5 (100 - 33 = 67)
    $display("R6 (SUB result): Expected=67, Actual=%0d", dut.reg_file[6]);
    if (dut.reg_file[6] !== 64'd67) $display("--> TEST FAILED for SUB R6");

    // Check result of ADD R9, R7, R8 (500 + 600 = 1100)
    $display("R9 (ADD result): Expected=1100, Actual=%0d", dut.reg_file[9]);
    if (dut.reg_file[9] !== 64'd1100) $display("--> TEST FAILED for ADD R9");

    // --- Memory Verification ---
    // Assuming an instruction "SW R10, (R11)" was executed.
    $display("(SW result): Expected=%0d, Actual=%0d", dut.reg_file[10], dut.reg_file[12]);
    if (dut.reg_file[12] !== 64'd2) $display("--> TEST FAILED for LW/SW");

    $display("\nTestbench finished.");
end

endmodule