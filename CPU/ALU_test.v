`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:18:51 02/17/2026
// Design Name:   cpu_with_ALU
// Module Name:   Z:/EE533/lab6_sp26/verilog/alu_test.v
// Project Name:  verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_with_ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg CLK;
	reg RSTB;

	// Instantiate the Unit Under Test (UUT)
	cpu_with_ALU uut (
		.CLK(CLK), 
		.RSTB(RSTB)
	);

// Clock Generation
parameter CLK_PERIOD = 200;
initial begin
    CLK = 0;
    forever #(CLK_PERIOD/2) CLK = ~CLK;
end

	initial begin
    $display("Starting Testbench for basic CPU operations...");

    // 1. Apply Reset
    RSTB = 1'b0;
    #(CLK_PERIOD * 2); // Hold reset for 2 cycles
    RSTB = 1'b1;
    $display("Reset released at time %0t", $time);
    
    // --- Test Setup ---
    // Wait for one cycle after reset before accessing internal signals
    #(CLK_PERIOD); 

    // 2. Initialize Register File with test values
    // Hierarchical access is used to preset the DUT's internal state.
    $display("Initializing source registers...");
    uut.reg_file[1] = 64'd10;  // R1 = 10
    uut.reg_file[2] = 64'd20;  // R2 = 20
	 #(CLK_PERIOD * 20);

	end
      
endmodule

