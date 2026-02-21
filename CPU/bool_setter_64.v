`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:42:16 02/20/2026 
// Design Name: 
// Module Name:    bool_setter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Converts a 1 bit boolean value into a 64-bit bool.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bool_setter(
    input set,
    output wire [63:0] bool_ext
    );

	assign bool_ext[63:1] = 63'd0;
	assign bool_ext[0] = set;

endmodule
