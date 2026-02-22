`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:09:51 02/21/2026
// Design Name:   cpu_CMT
// Module Name:   Z:/EE533/lab6_sp26/verilog/cmt_test1.v
// Project Name:  verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_CMT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cmt_test1;

	// Inputs
	reg CLK;
	reg RSTB;

	// Instantiate the Unit Under Test (UUT)
	cpu_CMT uut (
		.CLK(CLK), 
		.RSTB(RSTB)
	);

// Clock Generation
parameter CLK_PERIOD = 200;
integer i;
initial begin
    CLK = 0;
    forever #(CLK_PERIOD/2) CLK = ~CLK;
end

	initial begin
    $display("Starting Testbench for basic CPU operations...");

    // 1. Apply Reset
    RSTB = 1'b0;
    #(CLK_PERIOD * 5); // Hold reset for 2 cycles
    RSTB = 1'b1;
    $display("Reset released at time %0t", $time);
    
    // --- Test Setup ---
    // Wait for one cycle after reset before accessing internal signals
    #(CLK_PERIOD); 

    // 2. Initialize Register File with test values
    // Hierarchical access is used to preset the DUT's internal state.
    $display("Initializing source registers...");
    /*uut.reg_file[1] = 64'd0;  // R1 = 10
    uut.reg_file[2] = 64'd10;  // R2 = 20
	 uut.reg_file[10] = 64'd0;  // R2 = 20
	 uut.reg_file[11] = 64'd5;  // R2 = 20
	 uut.reg_file[20] = 64'd0;  // R2 = 20
	 uut.reg_file[21] = 64'd9;  // R2 = 20
	 uut.reg_file[22] = 64'd6;  // R2 = 20*/
	 
	 
	 for (i = 0; i < 128; i = i + 1) begin
			uut.reg_file[i] = 64'd0;
		end
	 #(CLK_PERIOD * 20);
	end
      
endmodule

