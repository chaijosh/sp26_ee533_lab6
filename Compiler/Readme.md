# Custom ISA Compiler & Assembler Toolchain

A Python-based, dual-mode compiler and assembler designed to generate 32-bit hexadecimal machine code (`.mem`) for a custom Verilog CPU architecture. 

This toolchain bridges the gap between high-level C code (compiled to ARM assembly via GCC) and custom hardware execution. It features a built-in **Pipeline Hazard Resolver** that automatically simulates execution and injects software stalls (`NOP`s) to protect against Read-After-Write (RAW) data hazards and control hazards in hardware that lacks a Forwarding Unit (FU) or Hazard Detection Unit (HDU).

## 🚀 Features

* **Dual-Mode Execution:** * **Compiler Mode:** Translates standard GCC ARMv8 assembly (`.s`) into the custom instruction set, mapping registers and scaling memory offsets.
  * **Assembler Mode:** Directly assembles manually written custom assembly (`.asm`).
* **Automatic Hazard Mitigation:** Simulates the CPU pipeline during assembly. Automatically calculates and injects 1 to 3 `NOP` instructions between dependent instructions (e.g., `LW` followed by `SLT`) and after branches (`BEQ`).
* **Hardware-Accurate Bit Packing:** Packs 32-bit instructions precisely according to the custom ISA specifications, correctly routing `Rs` and `Rt` fields for I-Type and R-Type instructions.
* **Protected Hardwired Zero:** Automatically maps standard registers to protect `R0` (ensuring it remains the hardwired zero register).
* **Verilog-Ready Output:** Generates comma-separated `.mem` files that can be directly loaded into Verilog Data/Instruction Memory using `$readmemh`.

## 🛠️ Supported Instruction Set

The assembler currently supports the following custom ISA instructions:

| Type | Instructions | Format |
| :--- | :--- | :--- |
| **R-Type** | `ADD`, `SUB`, `CMP`/`COMP`, `SHCMP`, `STRCMP`, `OR`, `AND`, `XNOR`, `LSH`, `RSH`, `SLT` | `OpCode (6) \| Rs (5) \| Rt (5) \| Rd (5) \| Shift (7) \| Func (4)` |
| **I-Type** | `ADDI` | `OpCode (6) \| Rs/Src (5) \| Rt/Dest (5) \| Imm (16)` |
| **I-Type** | `LW`, `SW` | `OpCode (6) \| Rs/Base (5) \| Rt/Data (5) \| Imm (16)` |
| **I-Type** | `BEQ` | `OpCode (6) \| Rs (5) \| Rt (5) \| PC-Offset (16)` |

## 💻 Usage

### Prerequisites
* Python 3.x
* No external libraries required!

### Running the Tool
1. Place your input assembly file in the root directory.
   * If using raw custom assembly, name it `input.asm`.
   * If compiling from GCC, name it `sort.s` (and adjust the `FILENAME` variable in the script).
2. Run the script:
   ```bash
   python assembler.py
