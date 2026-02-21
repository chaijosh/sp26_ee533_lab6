////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : alu_1b.vf
// /___/   /\     Timestamp : 02/15/2026 05:27:09
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/VM_Share/533_lab5/alu_64/alu_1b.sch alu_1b.vf
//Design Name: alu_1b
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module alu_1b(A, 
              B, 
              CI, 
              ALU_and, 
              ALU_or, 
              ALU_xnor, 
              CO, 
              S);

    input A;
    input B;
    input CI;
   output ALU_and;
   output ALU_or;
   output ALU_xnor;
   output CO;
   output S;
   
   wire XLXN_9;
   wire XLXN_10;
   wire XLXN_18;
   wire ALU_and_DUMMY;
   
   assign ALU_and = ALU_and_DUMMY;
   AND2 XLXI_1 (.I0(B), 
                .I1(A), 
                .O(ALU_and_DUMMY));
   AND2 XLXI_2 (.I0(CI), 
                .I1(A), 
                .O(XLXN_9));
   AND2 XLXI_3 (.I0(CI), 
                .I1(B), 
                .O(XLXN_10));
   XOR2 XLXI_4 (.I0(B), 
                .I1(A), 
                .O(XLXN_18));
   XOR2 XLXI_5 (.I0(CI), 
                .I1(XLXN_18), 
                .O(S));
   OR3 XLXI_6 (.I0(XLXN_10), 
               .I1(XLXN_9), 
               .I2(ALU_and_DUMMY), 
               .O(CO));
   INV XLXI_8 (.I(XLXN_18), 
               .O(ALU_xnor));
   OR2 XLXI_9 (.I0(B), 
               .I1(A), 
               .O(ALU_or));
endmodule
