////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : alu_64.vf
// /___/   /\     Timestamp : 02/20/2026 07:23:17
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family aspartan2e -w Z:/VM_Share/533_lab5/alu_64/alu_64.sch alu_64.vf
//Design Name: alu_64
//Device: aspartan2e
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module AND8_MXILINX_alu_64(I0, 
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
   // synthesis attribute RLOC of I_36_29 is "R0C0.S1"
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
   // synthesis attribute RLOC of I_36_138 is "R0C0.S1"
   AND2 I_36_142 (.I0(S0), 
                  .I1(S1), 
                  .O(O_DUMMY));
   FMAP I_36_152 (.I1(S0), 
                  .I2(S1), 
                  .I3(dummy), 
                  .I4(dummy), 
                  .O(O_DUMMY));
   // synthesis attribute RLOC of I_36_152 is "R0C0.S0"
endmodule
`timescale 1ns / 1ps

module alu_64(A, 
              ALUOp, 
              B, 
              byte_select, 
              ShiftA, 
              ShiftB, 
              C, 
              O, 
              V, 
              Z,
				  N);

    input [63:0] A;
    input [3:0] ALUOp;
    input [63:0] B;
    input [7:0] byte_select;
    input [6:0] ShiftA;
    input [6:0] ShiftB;
   output C;
   output [63:0] O;
   output V;
   output Z;
	output N;
   
   wire [63:0] B_actual;
   wire substr_eq_0;
   wire substr_eq_1;
   wire substr_eq_2;
   wire substr_eq_3;
   wire substr_eq_4;
   wire substr_eq_5;
   wire substr_eq_6;
   wire substr_eq_7;
   wire XLXN_17;
   wire XLXN_18;
   wire XLXN_21;
   wire XLXN_22;
   wire XLXN_23;
   wire [63:0] XLXN_139;
   wire [63:0] XLXN_140;
   wire [63:0] XLXN_160;
   wire [63:0] XLXN_166;
   wire XLXN_178;
   wire [63:0] XLXN_180;
   wire XLXN_195;
   wire XLXN_196;
   wire XLXN_197;
   wire XLXN_201;
   wire [63:0] XLXN_206;
   wire [63:0] XLXN_207;
   wire XLXN_208;
   wire XLXN_259;
   wire XLXN_268;
   wire XLXN_269;
   wire XLXN_270;
   wire [63:0] XLXN_276;
   wire [63:0] XLXN_277;
   wire XLXN_278;
   wire XLXN_279;
   wire [63:0] XLXN_280;
   wire [63:0] XLXN_281;
   wire XLXN_282;
   wire [63:0] XLXN_288;
   wire [63:0] O_DUMMY;
   wire V_DUMMY;
   
   assign O[63:0] = O_DUMMY[63:0];
	assign N = O_DUMMY[63];
   assign V = V_DUMMY;
   alu_8 XLXI_1 (.A(A[7:0]), 
                 .B(B_actual[7:0]), 
                 .CI(XLXN_201), 
                 .alu_and(XLXN_140[7:0]), 
                 .alu_or(XLXN_166[7:0]), 
                 .alu_xnor(XLXN_180[7:0]), 
                 .CO(XLXN_17), 
                 .S(XLXN_139[7:0]));
   alu_8 XLXI_2 (.A(A[15:8]), 
                 .B(B_actual[15:8]), 
                 .CI(XLXN_17), 
                 .alu_and(XLXN_140[15:8]), 
                 .alu_or(XLXN_166[15:8]), 
                 .alu_xnor(XLXN_180[15:8]), 
                 .CO(XLXN_18), 
                 .S(XLXN_139[15:8]));
   alu_8 XLXI_3 (.A(A[23:16]), 
                 .B(B_actual[23:16]), 
                 .CI(XLXN_18), 
                 .alu_and(XLXN_140[23:16]), 
                 .alu_or(XLXN_166[23:16]), 
                 .alu_xnor(XLXN_180[23:16]), 
                 .CO(XLXN_178), 
                 .S(XLXN_139[23:16]));
   alu_8 XLXI_4 (.A(A[31:24]), 
                 .B(B_actual[31:24]), 
                 .CI(XLXN_178), 
                 .alu_and(XLXN_140[31:24]), 
                 .alu_or(XLXN_166[31:24]), 
                 .alu_xnor(XLXN_180[31:24]), 
                 .CO(XLXN_23), 
                 .S(XLXN_139[31:24]));
   alu_8 XLXI_5 (.A(A[39:32]), 
                 .B(B_actual[39:32]), 
                 .CI(XLXN_23), 
                 .alu_and(XLXN_140[39:32]), 
                 .alu_or(XLXN_166[39:32]), 
                 .alu_xnor(XLXN_180[39:32]), 
                 .CO(XLXN_21), 
                 .S(XLXN_139[39:32]));
   alu_8 XLXI_6 (.A(A[47:40]), 
                 .B(B_actual[47:40]), 
                 .CI(XLXN_21), 
                 .alu_and(XLXN_140[47:40]), 
                 .alu_or(XLXN_166[47:40]), 
                 .alu_xnor(XLXN_180[47:40]), 
                 .CO(XLXN_22), 
                 .S(XLXN_139[47:40]));
   alu_8 XLXI_7 (.A(A[55:48]), 
                 .B(B_actual[55:48]), 
                 .CI(XLXN_22), 
                 .alu_and(XLXN_140[55:48]), 
                 .alu_or(XLXN_166[55:48]), 
                 .alu_xnor(XLXN_180[55:48]), 
                 .CO(XLXN_259), 
                 .S(XLXN_139[55:48]));
   mux64b XLXI_10 (.A(XLXN_139[63:0]), 
                   .B(XLXN_140[63:0]), 
                   .S(XLXN_195), 
                   .O(XLXN_160[63:0]));
   mux64b XLXI_11 (.A(XLXN_160[63:0]), 
                   .B(XLXN_166[63:0]), 
                   .S(XLXN_197), 
                   .O(XLXN_288[63:0]));
   mux64b XLXI_12 (.A(XLXN_288[63:0]), 
                   .B(XLXN_180[63:0]), 
                   .S(XLXN_196), 
                   .O(XLXN_277[63:0]));
   mux64b XLXI_13 (.A(XLXN_276[63:0]), 
                   .B(XLXN_280[63:0]), 
                   .S(XLXN_278), 
                   .O(O_DUMMY[63:0]));
   xor_64_1 XLXI_15 (.A(XLXN_207[63:0]), 
                     .B(XLXN_201), 
                     .O(B_actual[63:0]));
   shifter XLXI_16 (.A(A[63:0]), 
                    .shamt(ShiftA[5:0]), 
                    .shcode(ShiftA[6]), 
                    .O(XLXN_280[63:0]));
   shifter XLXI_17 (.A(B[63:0]), 
                    .shamt(ShiftB[5:0]), 
                    .shcode(ShiftB[6]), 
                    .O(XLXN_206[63:0]));
   alu_op XLXI_52 (.ALUOp(ALUOp[3:0]), 
                   .alu_and(XLXN_195), 
                   .alu_comp(), 
                   .alu_or(XLXN_197), 
                   .alu_shiftA(), 
                   .alu_shiftB(XLXN_208), 
                   .alu_shift_out(XLXN_278), 
                   .alu_xnor(XLXN_196), 
                   .slt(XLXN_279), 
                   .sub(XLXN_201), 
                   .substr_comp(XLXN_268));
   mux64b XLXI_54 (.A(B[63:0]), 
                   .B(XLXN_206[63:0]), 
                   .S(XLXN_208), 
                   .O(XLXN_207[63:0]));
   byte_comp_mask XLXI_64 (.A(XLXN_180[7:0]), 
                           .mask(byte_select[0]), 
                           .O(substr_eq_0));
   byte_comp_mask XLXI_65 (.A(XLXN_180[15:8]), 
                           .mask(byte_select[1]), 
                           .O(substr_eq_1));
   byte_comp_mask XLXI_66 (.A(XLXN_180[23:16]), 
                           .mask(byte_select[2]), 
                           .O(substr_eq_2));
   byte_comp_mask XLXI_67 (.A(XLXN_180[31:24]), 
                           .mask(byte_select[3]), 
                           .O(substr_eq_3));
   byte_comp_mask XLXI_68 (.A(XLXN_180[39:32]), 
                           .mask(byte_select[4]), 
                           .O(substr_eq_4));
   byte_comp_mask XLXI_69 (.A(XLXN_180[47:40]), 
                           .mask(byte_select[5]), 
                           .O(substr_eq_5));
   byte_comp_mask XLXI_70 (.A(XLXN_180[55:48]), 
                           .mask(byte_select[6]), 
                           .O(substr_eq_6));
   byte_comp_mask XLXI_71 (.A(XLXN_180[63:56]), 
                           .mask(byte_select[7]), 
                           .O(substr_eq_7));
   AND8_MXILINX_alu_64 XLXI_72 (.I0(substr_eq_7), 
                                .I1(substr_eq_6), 
                                .I2(substr_eq_5), 
                                .I3(substr_eq_4), 
                                .I4(substr_eq_3), 
                                .I5(substr_eq_2), 
                                .I6(substr_eq_1), 
                                .I7(substr_eq_0), 
                                .O(XLXN_269));
   // synthesis attribute HU_SET of XLXI_72 is "XLXI_72_0"
   alu_8_overflow XLXI_74 (.A(A[63:56]), 
                           .B(B_actual[63:56]), 
                           .CI(XLXN_259), 
                           .alu_and(XLXN_140[63:56]), 
                           .alu_or(XLXN_166[63:56]), 
                           .alu_xnor(XLXN_180[63:56]), 
                           .CO(C), 
                           .Overflow(V_DUMMY), 
                           .S(XLXN_139[63:56]));
   zero XLXI_75 (.A(O_DUMMY[63:0]), 
                 .Z(XLXN_270));
   MUXF5 XLXI_78 (.I0(XLXN_270), 
                  .I1(XLXN_269), 
                  .S(XLXN_268), 
                  .O(Z));
   mux64b XLXI_79 (.A(XLXN_277[63:0]), 
                   .B(XLXN_281[63:0]), 
                   .S(XLXN_279), 
                   .O(XLXN_276[63:0]));
   bool_setter XLXI_80 (.set(XLXN_282), 
                        .bool_ext(XLXN_281[63:0]));
   AND2B1 XLXI_81 (.I0(V_DUMMY), 
                   .I1(XLXN_139[63]), 
                   .O(XLXN_282));
endmodule
