////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : mux32b.vf
// /___/   /\     Timestamp : 02/13/2026 09:17:17
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/VM_Share/533_lab5/alu_64/mux32b.sch mux32b.vf
//Design Name: mux32b
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module mux32b(A, 
              B, 
              S, 
              O);

    input [31:0] A;
    input [31:0] B;
    input S;
   output [31:0] O;
   
   
   mux_8b XLXI_1 (.A(A[7:0]), 
                  .B(B[7:0]), 
                  .S(S), 
                  .O(O[7:0]));
   mux_8b XLXI_2 (.A(A[15:8]), 
                  .B(B[15:8]), 
                  .S(S), 
                  .O(O[15:8]));
   mux_8b XLXI_3 (.A(A[23:16]), 
                  .B(B[23:16]), 
                  .S(S), 
                  .O(O[23:16]));
   mux_8b XLXI_4 (.A(A[31:24]), 
                  .B(B[31:24]), 
                  .S(S), 
                  .O(O[31:24]));
endmodule
