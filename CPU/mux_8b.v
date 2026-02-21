////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : mux_8b.vf
// /___/   /\     Timestamp : 02/15/2026 05:31:32
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/VM_Share/533_lab5/alu_64/mux_8b.sch mux_8b.vf
//Design Name: mux_8b
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module mux_8b(A, 
              B, 
              S, 
              O);

    input [7:0] A;
    input [7:0] B;
    input S;
   output [7:0] O;
   
   
   MUXF5 XLXI_1 (.I0(A[0]), 
                 .I1(B[0]), 
                 .S(S), 
                 .O(O[0]));
   MUXF5 XLXI_2 (.I0(A[1]), 
                 .I1(B[1]), 
                 .S(S), 
                 .O(O[1]));
   MUXF5 XLXI_3 (.I0(A[2]), 
                 .I1(B[2]), 
                 .S(S), 
                 .O(O[2]));
   MUXF5 XLXI_4 (.I0(A[3]), 
                 .I1(B[3]), 
                 .S(S), 
                 .O(O[3]));
   MUXF5 XLXI_5 (.I0(A[4]), 
                 .I1(B[4]), 
                 .S(S), 
                 .O(O[4]));
   MUXF5 XLXI_6 (.I0(A[5]), 
                 .I1(B[5]), 
                 .S(S), 
                 .O(O[5]));
   MUXF5 XLXI_7 (.I0(A[6]), 
                 .I1(B[6]), 
                 .S(S), 
                 .O(O[6]));
   MUXF5 XLXI_8 (.I0(A[7]), 
                 .I1(B[7]), 
                 .S(S), 
                 .O(O[7]));
endmodule
