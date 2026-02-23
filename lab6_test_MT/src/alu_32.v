`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:49 02/22/2026 
// Design Name: 
// Module Name:    alu_32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu_32(A, 
              ALUOp, 
              B, 
              byte_select, 
              ShiftA, 
              ShiftB, 
              C, 
              N, 
              O, 
              V, 
              Z);

    input [31:0] A;
    input [3:0] ALUOp;
    input [31:0] B;
    input [7:0] byte_select;
    input [6:0] ShiftA;
    input [6:0] ShiftB;
   output C;
   output N;
   output [31:0] O;
   output V;
   output Z;
   
    // Temporary holder for arithmetic value
    reg [32:0] arith_temp;
    
    // Output assignments 

    assign O = arith_temp[31:0];
    assign Z = O == 32'd0 ? 1 : 0;
    assign V = arith_temp[32] != arith_temp[31] ? 1: 0;
    assign C = arith_temp[32];
	 assign N = arith_temp[31];

    always @(*)
    begin
    if (ALUOp == 4'h1)
    begin
        arith_temp = {A[31], A} - {B[31], B};      
    end
    else if (ALUOp == 4'hA)
    begin
        arith_temp = $signed(A) < $signed(B) ? 32'd1 : 32'd0;        
    end
    else
        arith_temp = {A[31], A} + {B[31], B};
   end


endmodule
