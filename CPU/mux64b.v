////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : mux64b.vf
// /___/   /\     Timestamp : 02/15/2026 05:27:18
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/VM_Share/533_lab5/alu_64/mux64b.sch mux64b.vf
//Design Name: mux64b
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module mux64b(A, 
              B, 
              S, 
              O);

    input [63:0] A;
    input [63:0] B;
    input S;
   output [63:0] O;
   
   
   mux32b XLXI_1 (.A(A[31:0]), 
                  .B(B[31:0]), 
                  .S(S), 
                  .O(O[31:0]));
   mux32b XLXI_2 (.A(A[63:32]), 
                  .B(B[63:32]), 
                  .S(S), 
                  .O(O[63:32]));
endmodule
