////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : byte_comp_mask.vf
// /___/   /\     Timestamp : 02/15/2026 05:27:22
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/VM_Share/533_lab5/alu_64/byte_comp_mask.sch byte_comp_mask.vf
//Design Name: byte_comp_mask
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module AND8_MXILINX_byte_comp_mask(I0, 
                                   I1, 
                                   I2, 
                                   I3, 
                                   I4, 
                                   I5, 
                                   I6, 
                                   I7, 
                                   O);

    input I0;
    input I1;
    input I2;
    input I3;
    input I4;
    input I5;
    input I6;
    input I7;
   output O;
   
   wire dummy;
   wire S0;
   wire S1;
   wire O_DUMMY;
   
   assign O = O_DUMMY;
   FMAP I_36_29 (.I1(I0), 
                 .I2(I1), 
                 .I3(I2), 
                 .I4(I3), 
                 .O(S0));
   // synthesis attribute RLOC of I_36_29 is "X0Y0"
   AND4 I_36_110 (.I0(I0), 
                  .I1(I1), 
                  .I2(I2), 
                  .I3(I3), 
                  .O(S0));
   AND4 I_36_127 (.I0(I4), 
                  .I1(I5), 
                  .I2(I6), 
                  .I3(I7), 
                  .O(S1));
   FMAP I_36_138 (.I1(I4), 
                  .I2(I5), 
                  .I3(I6), 
                  .I4(I7), 
                  .O(S1));
   // synthesis attribute RLOC of I_36_138 is "X0Y0"
   AND2 I_36_142 (.I0(S0), 
                  .I1(S1), 
                  .O(O_DUMMY));
   FMAP I_36_152 (.I1(S0), 
                  .I2(S1), 
                  .I3(dummy), 
                  .I4(dummy), 
                  .O(O_DUMMY));
   // synthesis attribute RLOC of I_36_152 is "X0Y1"
endmodule
`timescale 1ns / 1ps

module byte_comp_mask(A, 
                      mask, 
                      O);

    input [7:0] A;
    input mask;
   output O;
   
   wire XLXN_13;
   
   AND8_MXILINX_byte_comp_mask XLXI_1 (.I0(A[0]), 
                                       .I1(A[1]), 
                                       .I2(A[2]), 
                                       .I3(A[3]), 
                                       .I4(A[4]), 
                                       .I5(A[5]), 
                                       .I6(A[6]), 
                                       .I7(A[7]), 
                                       .O(XLXN_13));
   // synthesis attribute HU_SET of XLXI_1 is "XLXI_1_0"
   OR2B1 XLXI_3 (.I0(mask), 
                 .I1(XLXN_13), 
                 .O(O));
endmodule
