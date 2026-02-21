////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : xor_64_1.vf
// /___/   /\     Timestamp : 02/15/2026 05:27:16
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/VM_Share/533_lab5/alu_64/xor_64_1.sch xor_64_1.vf
//Design Name: xor_64_1
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module xor_64_1(A, 
                B, 
                O);

    input [63:0] A;
    input B;
   output [63:0] O;
   
   
   xor_32_1 XLXI_3 (.A(A[31:0]), 
                    .B(B), 
                    .O(O[31:0]));
   xor_32_1 XLXI_4 (.A(A[63:32]), 
                    .B(B), 
                    .O(O[63:32]));
endmodule
