import re
import os

# ==========================================
# ISA DEFINITIONS
# ==========================================
R_OPCODE = "000000"
R_FUNCS = {
    "ADD": "0000", "SUB": "0001", "COMP": "0010", "CMP": "0010",
    "SHCMP": "0011", "STRCMP": "0100", "OR": "0101", 
    "LSH": "0110", "RSH": "0110", "XNOR": "1000", "AND": "1001", "SLT": "1010"
}

I_OPCODES = {"ADDI": "001000", "LW": "100011", "SW": "101011", "BEQ": "000100"}

def r2b(reg_str):
    num = re.findall(r'\d+', reg_str)
    return format(int(num[0]), '05b') if num else "00000"

def get_imm(imm_str, bits=16):
    try:
        val = int(re.sub(r'[^0-9\-]', '', imm_str))
        if val < 0: val = (1 << bits) + val
        return format(val, f'0{bits}b')
    except: return "0" * bits

def get_regs(op, p):
    """Parses instructions to find which registers are Read (srcs) vs Written (dest)."""
    dest = None
    srcs = []
    if op in ['ADD', 'SUB', 'SLT', 'OR', 'AND', 'XNOR']:
        if len(p) >= 4: dest, srcs = p[1], [p[2], p[3]]
    elif op in ['CMP', 'COMP']:
        if len(p) >= 3: srcs = [p[1], p[2]]
    elif op == 'ADDI':
        if len(p) >= 4: dest, srcs = p[1], [p[2]]
    elif op == 'LW':
        if len(p) >= 4: dest, srcs = p[1], [p[3]] # p[1]=Rt (Dest), p[3]=Rs (Base)
    elif op == 'SW':
        if len(p) >= 4: srcs = [p[1], p[3]]       # p[1]=Rt (Data), p[3]=Rs (Base)
    elif op == 'BEQ':
        if len(p) >= 3: srcs = [p[1], p[2]]
    return dest, srcs

# ==========================================
# PHASE 1: AUTOMATIC NOP INJECTOR
# ==========================================
def resolve_hazards(raw_lines):
    padded_asm = []
    last_written = {} # Tracks the cycle index where each reg was last written
    pc = 0            # Tracks the instruction count
    
    for line in raw_lines:
        clean = line.split('//')[0].strip()
        if not clean: continue
        
        # Keep labels, don't increment PC
        if clean.endswith(':'):
            padded_asm.append(f"\n{clean}")
            continue
            
        p = [x.replace(',', '') for x in clean.replace('(', ' ').replace(')', ' ').split()]
        op = p[0].upper()
        
        if op == "NOP":
            padded_asm.append("NOP")
            pc += 1
            continue
            
        dest, srcs = get_regs(op, p)
        
        # --- 1. RESOLVE DATA HAZARDS (RAW) ---
        nops_needed = 0
        for src in srcs:
            if src in last_written and src != 'R0':
                dist = pc - last_written[src]
                # If the write was less than 4 instructions ago, we need to stall
                if dist <= 3:
                    nops_needed = max(nops_needed, 4 - dist)
                    
        for _ in range(nops_needed):
            padded_asm.append("NOP")
            pc += 1
            
        # --- 2. ADD THE INSTRUCTION ---
        padded_asm.append(clean)
        if dest and dest != 'R0':
            last_written[dest] = pc # Log the write at the current PC
        pc += 1
        
        # --- 3. RESOLVE CONTROL HAZARDS (Branches) ---
        if op == 'BEQ':
            for _ in range(3):
                padded_asm.append("NOP")
                pc += 1
                
    return padded_asm

# ==========================================
# PHASE 2: ASSEMBLER
# ==========================================
def assemble_to_hex(padded_asm):
    labels, final_code, pc = {}, [], 0
    
    # Pass 1: Resolve Labels
    for line in padded_asm:
        line = line.strip()
        if not line: continue
        if line.endswith(':'):
            labels[line[:-1]] = pc
            continue
        final_code.append(line)
        pc += 1

    machine_code = []
    
    # Pass 2: Generate Machine Code
    for cur_pc, inst in enumerate(final_code):
        if inst.upper() == "NOP": 
            machine_code.append("00000000")
            continue
            
        p = [x.replace(',', '') for x in inst.replace('(', ' ').replace(')', ' ').split()]
        op, bin_str = p[0].upper(), ""
        
        if op in R_FUNCS:
            if op in ['CMP', 'COMP']: 
                rs, rt, rd = r2b(p[1]), r2b(p[2]), "00000"
            else: 
                rd, rs, rt = r2b(p[1]), r2b(p[2]), r2b(p[3]) if len(p)>3 else "00000"
            shift = "0000000" 
            bin_str = f"{R_OPCODE}{rs}{rt}{rd}{shift}{R_FUNCS[op]}"
            
        elif op == 'ADDI':
            rs_src, rt_dest = r2b(p[2]), r2b(p[1]) # p[1]=Rs (Src), p[2]=Rt (Dest) Rt= Rs +Imm
            bin_str = f"{I_OPCODES[op]}{rs_src}{rt_dest}{get_imm(p[3])}"
            
        elif op in ['LW', 'SW']:
            rt_data, rs_base = r2b(p[1]), r2b(p[3])
            bin_str = f"{I_OPCODES[op]}{rs_base}{rt_data}{get_imm(p[2])}"
            
        elif op == 'BEQ':
            rs, rt = (r2b(p[1]), r2b(p[2])) if len(p)==4 else ("00000", "00000")
            target = p[-1]
            off = (labels[target] - cur_pc - 1) & 0xFFFF if target in labels else 0
            bin_str = f"{I_OPCODES['BEQ']}{rs}{rt}{format(off, '016b')}"
        
        machine_code.append(format(int(bin_str, 2), '08X') if bin_str else "00000000")
        
    return machine_code

# ==========================================
# MAIN EXECUTION
# ==========================================
if __name__ == "__main__":
    # Your raw assembly file (NO MANUAL NOPS NEEDED)
    INPUT_FILE = "debug.asm" 
    
    if not os.path.exists(INPUT_FILE):
        print(f"Error: '{INPUT_FILE}' not found. Create it and put your raw ASM there.")
    else:
        with open(INPUT_FILE, "r") as f:
            raw_code = f.readlines()

        # 1. Automatically inject NOPs for all hazards
        padded_asm = resolve_hazards(raw_code)
        
        # 2. Save the padded assembly so you can debug side-by-side
        with open("padded_debug.asm", "w") as f:
            f.write("\n".join(padded_asm))
        print(f"-> Created 'padded_debug.asm' (Read this to see exactly where NOPs were injected!)")

        # 3. Generate the Machine Code
        hex_list = assemble_to_hex(padded_asm)
        with open("machine_code.mem", "w") as f:
            for h in hex_list:
                f.write(h + ",\n") 
        print(f"-> Created 'machine_code.mem' with {len(hex_list)} fully-protected instructions.")