////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : alu_8.vf
// /___/   /\     Timestamp : 02/15/2026 05:27:11
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/VM_Share/533_lab5/alu_64/alu_8.sch alu_8.vf
//Design Name: alu_8
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module alu_8(A, 
             B, 
             CI, 
             alu_and, 
             alu_or, 
             alu_xnor, 
             CO, 
             S);

    input [7:0] A;
    input [7:0] B;
    input CI;
   output [7:0] alu_and;
   output [7:0] alu_or;
   output [7:0] alu_xnor;
   output CO;
   output [7:0] S;
   
   wire XLXN_135;
   wire XLXN_136;
   wire XLXN_137;
   wire XLXN_138;
   wire XLXN_139;
   wire XLXN_140;
   wire XLXN_141;
   
   alu_1b XLXI_11 (.A(A[0]), 
                   .B(B[0]), 
                   .CI(CI), 
                   .ALU_and(alu_and[0]), 
                   .ALU_or(alu_or[0]), 
                   .ALU_xnor(alu_xnor[0]), 
                   .CO(XLXN_135), 
                   .S(S[0]));
   alu_1b XLXI_12 (.A(A[1]), 
                   .B(B[1]), 
                   .CI(XLXN_135), 
                   .ALU_and(alu_and[1]), 
                   .ALU_or(alu_or[1]), 
                   .ALU_xnor(alu_xnor[1]), 
                   .CO(XLXN_136), 
                   .S(S[1]));
   alu_1b XLXI_13 (.A(A[2]), 
                   .B(B[2]), 
                   .CI(XLXN_136), 
                   .ALU_and(alu_and[2]), 
                   .ALU_or(alu_or[2]), 
                   .ALU_xnor(alu_xnor[2]), 
                   .CO(XLXN_138), 
                   .S(S[2]));
   alu_1b XLXI_14 (.A(A[3]), 
                   .B(B[3]), 
                   .CI(XLXN_138), 
                   .ALU_and(alu_and[3]), 
                   .ALU_or(alu_or[3]), 
                   .ALU_xnor(alu_xnor[3]), 
                   .CO(XLXN_137), 
                   .S(S[3]));
   alu_1b XLXI_15 (.A(A[4]), 
                   .B(B[4]), 
                   .CI(XLXN_137), 
                   .ALU_and(alu_and[4]), 
                   .ALU_or(alu_or[4]), 
                   .ALU_xnor(alu_xnor[4]), 
                   .CO(XLXN_140), 
                   .S(S[4]));
   alu_1b XLXI_16 (.A(A[5]), 
                   .B(B[5]), 
                   .CI(XLXN_140), 
                   .ALU_and(alu_and[5]), 
                   .ALU_or(alu_or[5]), 
                   .ALU_xnor(alu_xnor[5]), 
                   .CO(XLXN_139), 
                   .S(S[5]));
   alu_1b XLXI_17 (.A(A[6]), 
                   .B(B[6]), 
                   .CI(XLXN_139), 
                   .ALU_and(alu_and[6]), 
                   .ALU_or(alu_or[6]), 
                   .ALU_xnor(alu_xnor[6]), 
                   .CO(XLXN_141), 
                   .S(S[6]));
   alu_1b XLXI_18 (.A(A[7]), 
                   .B(B[7]), 
                   .CI(XLXN_141), 
                   .ALU_and(alu_and[7]), 
                   .ALU_or(alu_or[7]), 
                   .ALU_xnor(alu_xnor[7]), 
                   .CO(CO), 
                   .S(S[7]));
endmodule
