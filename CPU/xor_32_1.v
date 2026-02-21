////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : xor_32_1.vf
// /___/   /\     Timestamp : 02/13/2026 09:17:20
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/VM_Share/533_lab5/alu_64/xor_32_1.sch xor_32_1.vf
//Design Name: xor_32_1
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module xor_32_1(A, 
                B, 
                O);

    input [31:0] A;
    input B;
   output [31:0] O;
   
   
   xor_8_1 XLXI_2 (.A(A[7:0]), 
                   .B(B), 
                   .S(O[7:0]));
   xor_8_1 XLXI_3 (.A(A[15:8]), 
                   .B(B), 
                   .S(O[15:8]));
   xor_8_1 XLXI_4 (.A(A[23:16]), 
                   .B(B), 
                   .S(O[23:16]));
   xor_8_1 XLXI_5 (.A(A[31:24]), 
                   .B(B), 
                   .S(O[31:24]));
endmodule
