////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : alu_op.vf
// /___/   /\     Timestamp : 02/20/2026 06:55:22
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/VM_Share/533_lab5/alu_64/alu_op.sch alu_op.vf
//Design Name: alu_op
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module alu_op(ALUOp, 
              alu_and, 
              alu_comp, 
              alu_or, 
              alu_shiftA, 
              alu_shiftB, 
              alu_shift_out, 
              alu_xnor, 
              slt, 
              sub, 
              substr_comp);

    input [3:0] ALUOp;
   output alu_and;
   output alu_comp;
   output alu_or;
   output alu_shiftA;
   output alu_shiftB;
   output alu_shift_out;
   output alu_xnor;
   output slt;
   output sub;
   output substr_comp;
   
   wire XLXN_22;
   wire slt_DUMMY;
   wire alu_comp_DUMMY;
   
   assign alu_comp = alu_comp_DUMMY;
   assign slt = slt_DUMMY;
   AND3B1 XLXI_2 (.I0(ALUOp[3]), 
                  .I1(ALUOp[2]), 
                  .I2(ALUOp[1]), 
                  .O(alu_shift_out));
   AND4B3 XLXI_4 (.I0(ALUOp[3]), 
                  .I1(ALUOp[2]), 
                  .I2(ALUOp[1]), 
                  .I3(ALUOp[0]), 
                  .O(XLXN_22));
   AND4B3 XLXI_6 (.I0(ALUOp[0]), 
                  .I1(ALUOp[1]), 
                  .I2(ALUOp[2]), 
                  .I3(ALUOp[3]), 
                  .O(alu_xnor));
   AND4B2 XLXI_7 (.I0(ALUOp[2]), 
                  .I1(ALUOp[1]), 
                  .I2(ALUOp[3]), 
                  .I3(ALUOp[0]), 
                  .O(alu_and));
   AND4B2 XLXI_9 (.I0(ALUOp[3]), 
                  .I1(ALUOp[1]), 
                  .I2(ALUOp[2]), 
                  .I3(ALUOp[0]), 
                  .O(alu_or));
   GND XLXI_11 (.G(alu_shiftA));
   AND3B2 XLXI_12 (.I0(ALUOp[3]), 
                   .I1(ALUOp[2]), 
                   .I2(ALUOp[1]), 
                   .O(alu_comp_DUMMY));
   AND4B2 XLXI_13 (.I0(ALUOp[3]), 
                   .I1(ALUOp[2]), 
                   .I2(ALUOp[1]), 
                   .I3(ALUOp[0]), 
                   .O(alu_shiftB));
   AND4B3 XLXI_14 (.I0(ALUOp[0]), 
                   .I1(ALUOp[1]), 
                   .I2(ALUOp[3]), 
                   .I3(ALUOp[2]), 
                   .O(substr_comp));
   AND4B2 XLXI_21 (.I0(ALUOp[0]), 
                   .I1(ALUOp[2]), 
                   .I2(ALUOp[1]), 
                   .I3(ALUOp[3]), 
                   .O(slt_DUMMY));
   OR3 XLXI_22 (.I0(XLXN_22), 
                .I1(alu_comp_DUMMY), 
                .I2(slt_DUMMY), 
                .O(sub));
endmodule
