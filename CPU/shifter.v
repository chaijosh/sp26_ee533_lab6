`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:12:27 02/13/2026 
// Design Name: 
// Module Name:    shifter 
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
module shifter(
    input [5:0] shamt,
    input [63:0] A,
    output reg [63:0] O,
    input shcode
    );

	always @(*)
	begin
		if (shcode == 1'b0)
		begin
			O = A << shamt;
		end
		
		else
		begin
			O = A >> shamt;
		end
	
	end

endmodule
