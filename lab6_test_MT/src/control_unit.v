`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:50 05/26/2024 
// Design Name: 
// Module Name:    control_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    A combinational control unit based on a 6-bit opcode.
//                 This design uses dataflow assignments to allow for efficient
//                 synthesis into Look-Up Tables (LUTs).
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control_unit (
    input  [5:0] opcode, // Mapped from instruction[31:26]
    output       RegDst,
    output       ALUSrc,
    output       MemtoReg,
    output       RegWrite,
    output       MemRead,
    output       MemWrite,
    output       Beq,
	 output       Bne,
    output       ALUOp1,
    output       ALUOp0
);

    wire RType             = (opcode == 6'b000000);
    wire LW                = (opcode == 6'b100011);
    wire SW                = (opcode == 6'b101011);
    wire Branch_ifEqual    = (opcode == 6'b000100);
	 wire Branch_ifNotEqual = (opcode == 6'b000101);
    wire AddI              = (opcode == 6'b001000);
    
    assign RegDst   = RType; // 1 for Rtype
    assign ALUSrc   = LW | SW | AddI; // 1 for lw/sw/addi
    assign MemtoReg = LW; // 1 for lw
    assign RegWrite = RType | LW | AddI; // 1 for Rtype/lw/addi
    assign MemRead  = LW; // 1 for lw
    assign MemWrite = SW; // 1 for sw
    assign Beq      = Branch_ifEqual; // 1 for beq
	 assign Bne      = Branch_ifNotEqual; // 1 for bne
    assign ALUOp1   = RType; // R-type ALU operation
    assign ALUOp0   = Branch_ifEqual | Branch_ifNotEqual; // BEQ ALU operation (subtract)

endmodule