
// This design supports ADD, SUB, LW, and SW instructions.

`timescale 1 ns / 1 ps

module cpu_behavioural (CLK,RSTB);
input CLK,RSTB;


// signals -- listed stagewise

// IF stage signals
reg [8:0] PC_OUT;
// reg [31:0] instr_mem_32x512 [0:511]; // Replaced by instr_mem_dp instance
wire [31:0] instr_mem_douta;
reg [31:0] IF_INSTR;

reg STALL; // STALL_B, the opposite of STALL, is neither explicitly declared, nor produced explicitly. 
reg ID_SUB,ID_ADD, ID_LW, ID_SW; // Control signals for instructions.
reg [4:0] ID_Rs,ID_Rt,ID_Rd; // 5-bit source (Rs, Rt) and destination (Rd) register IDs
reg [63:0] reg_file [0:31] ; // register file 32x64
reg [63:0] ID_XD, ID_Yd; // Data for Rs (ID_XD) and Rt (ID_Yd)
reg [31:0] ID_INSTR;

// EX stage signals (was EX1)
reg EX_SUB,EX_ADD, EX_LW, EX_SW; 
reg [4:0] EX_Rs, EX_Rt, EX_Rd; // Pipelined register IDs
reg [63:0] EX_XD, EX_Yd; // Pipelined operand data
reg [63:0] EX_ALU_OUT;
reg [31:0] EX_INSTR;

// MEM stage signals (was EX2)
/* reg [63:0] data_memory [0:255]; */ // Replaced by data_mem_64_256 instance
wire [63:0] data_mem_douta;
reg MEM_SUB,MEM_ADD, MEM_LW, MEM_SW; 
reg [4:0] MEM_Rd; // Pipelined register IDs
reg [63:0] MEM_ALU_OUT, MEM_STORE_DATA; // Pipelined data
reg [31:0] MEM_INSTR;

// WB stage signals
reg WB_WRITE;
reg WB_LW; // Pipelined control signals
reg [4:0] WB_Rd; // 5-bit write register ID
reg [63:0] WB_ALU_OUT;
reg [63:0] WB_RD;
reg [31:0] WB_INSTR;


instr_mem_dp ICache (
    // Port A connections for instruction fetch
    .addra(PC_OUT[8:0]),
    .clka(CLK),
    .douta(instr_mem_douta),
    .ena(1'b1),
    .addrb(9'b0),
    .clkb(1'b0),
    .dinb(32'b0),
    .enb(1'b0),
    .web(1'b0),
    .doutb()
);

data_mem_64_256 DCache (
    // Port A connections for data access
    .addra(MEM_ALU_OUT[7:0]),
    .clka(CLK),
    .dina(MEM_STORE_DATA),
    .douta(data_mem_douta),
    .ena(MEM_LW | MEM_SW),
    .wea(MEM_SW),

    // Tie off unused Port B
    .addrb(8'b0),
    .clkb(1'b0),
    .dinb(64'b0),
    .enb(1'b0),
    .web(1'b0),
    .doutb()
);


always @(posedge CLK, negedge RSTB)

  begin : Main_Clocked_Block 	// Name the sequential block as in this example. Any name (an unique identifier) may be chosen.
								// Once you name a block as shown above, you can declare variables visible to this block only.
								// This is inline with the "variables declaration with in a process in VHDL". Those variables
								// are visible only inside that process.
 reg [63:0] EX_operand_X, EX_operand_Y; // Intermediate variables for forwarding
  
	if (RSTB == 1'b0)
	
	  begin
	  
		// IF stage
		PC_OUT <= 9'h000;
		
		// ID Stage
		// Notice: ID_XD is not a physical register. So do not initalize it (no need to write "ID_XD <= 16'hXXXX;")
		//          and later do not assign to it using a non-blocking assignment.	
		// 			Similarly STALL is not a physical register. So no initialization for it.
		ID_Rs <= 5'hX; 
		ID_Rt <= 5'hX;
		ID_Rd <= 5'hX;
		ID_INSTR <= 32'h00000000; // we could put 32'hXXXXXXXX but, we want to report a NOP in TimeSpace.txt
		ID_SUB <= 1'b0; 
		ID_ADD <= 1'b0; 
		ID_LW  <= 1'b0;
		ID_SW  <= 1'b0;
		// please notice that the control signals (ID_MOV, etc.) are inactivated to make sure
		// that a BUBBLE occupies the stage during reset. When control signals
		// are turned to zero, data can be don't care. See "EX1_XD <= 16'hXXXX;" below.
		
		// EX Stage
		EX_XD <= 64'hXXXXXXXXXXXXXXXX;
		EX_Yd <= 64'hXXXXXXXXXXXXXXXX;
		EX_Rs <= 5'hX;
		EX_Rt <= 5'hX;
		EX_Rd <= 5'hX;
		EX_INSTR <= 32'h00000000; // we could put 32'hXXXXXXXX but, we want to report a NOP in TimeSpace.txt
		EX_SUB <= 1'b0; 
		EX_ADD <= 1'b0; 
		EX_LW  <= 1'b0;
		EX_SW  <= 1'b0;
		
		// MEM Stage
		MEM_ALU_OUT <= 64'hXXXXXXXXXXXXXXXX;
		MEM_STORE_DATA <= 64'hXXXXXXXXXXXXXXXX;
		MEM_Rd <= 5'hX;
		MEM_INSTR <= 32'h00000000; // we could put 32'hXXXXXXXX but, we want to report a NOP in TimeSpace.txt
		MEM_SUB <= 1'b0; 
		MEM_ADD <= 1'b0; 
		MEM_LW  <= 1'b0;
		MEM_SW  <= 1'b0;

		WB_LW <= 1'b0;
		// WB Stage
		WB_ALU_OUT <= 64'hXXXXXXXXXXXXXXXX;
		WB_INSTR <= 32'h00000000; // we could put 32'hXXXXXXXX but, we want to report a NOP in TimeSpace.txt
		WB_Rd <= 5'hX;
		WB_WRITE <= 1'b0; // to see that a BUBBLE occupies the WB stage initially

	  end	
	  
	else // else if posedge CLK
	
	  begin
		// Please notice that we are producing the STALL signal
		// as an intermediate variable using blocking assignment
		// in the beginning of the else part of the statement, as
		// it is needed as an enable for the PC counter and the IF/ID stage register.
		
		STALL	 = 	( (ID_Rs == EX_Rd) || (ID_Rt == EX_Rd && ~ID_LW) ) // if a source register in ID matches the destination in EX
					& EX_LW; // and the instruction in EX is a LW (load-use hazard)
				
		if (~STALL) // if STALL is *not* true, the PC and the IF/ID registers may be updated.
		// Can we replace the above line with "if (~STALL_combinational)" ? YES!
		// But then, the STALL and the STALL_combinational, are quite different in the waveform.
		// True, but that is an artifact of RTL coding in HDL and the associated waveform display.
		// Please make sure you understand this point completely.
			begin

			// PC
			
				PC_OUT <= PC_OUT + 1;

			// IF stage logic and IF_ID stage register
				// IF stage logic
				IF_INSTR = instr_mem_douta; // instruction is read from the instruction memory using blocking assignment
				// IF_ID stage register
				ID_Rs <= IF_INSTR[25:21]; 
				ID_Rt <= IF_INSTR[20:16];
				// For LW, Rt is the destination register. For R-type, Rd is the destination.
				ID_Rd <= IF_INSTR[28] ? IF_INSTR[20:16] : IF_INSTR[15:11];
				ID_SUB <= IF_INSTR[30]; 
				ID_ADD <= IF_INSTR[29]; 
				ID_LW  <= IF_INSTR[28];
				ID_SW  <= IF_INSTR[27];
				ID_INSTR <= IF_INSTR; // carry the instruction for reverse assembling and displaying in Time-Space diagram
			end

		// The rest of the three stage registers ID/EX, EX/MEM, and MEM/WB are not controlled by the STALL signal.
// WB stage logic 
			// Select final result. For LW, it's from the memory's current output. For ALU ops, it's from the pipelined ALU result.
			WB_RD = WB_LW ? data_mem_douta : WB_ALU_OUT;
		
		// MEM stage logic and MEM_WB stage register
			// MEM stage logic
			// Read/Write is now handled by the DCache instance.
			// Due to synchronous read latency, data is captured directly into the MEM/WB pipeline register.

			// MEM_WB stage register
			WB_LW <= MEM_LW;
			WB_ALU_OUT <= MEM_ALU_OUT;
			WB_Rd <= MEM_Rd;
			WB_WRITE <= MEM_SUB | MEM_ADD | MEM_LW;	
			WB_INSTR <= MEM_INSTR; // carry the instruction for reverse assembling and displaying in Time-Space diagram

		// EX stage logic and EX_MEM stage register
			// EX stage logic
			// Forwarding logic for Rs operand (EX_operand_X)
			// Priority 1: Forward ALU result from MEM stage. This path is not valid for LW due to 1-cycle memory latency.
			if ( (EX_Rs == MEM_Rd) & (MEM_SUB | MEM_ADD) )
				EX_operand_X = MEM_ALU_OUT;
			// Priority 2: Forward ALU or LW result from WB stage.
			else if ( (EX_Rs == WB_Rd) & WB_WRITE )
				EX_operand_X = WB_RD;
			// Default: Use pipelined value.
			else
				EX_operand_X = EX_XD;

			// Forwarding logic for Rt operand (EX_operand_Y)
			if ( (EX_Rt == MEM_Rd) & (MEM_SUB | MEM_ADD) )
				EX_operand_Y = MEM_ALU_OUT;
			else if ( (EX_Rt == WB_Rd) & WB_WRITE )
				EX_operand_Y = WB_RD;
			else
				EX_operand_Y = EX_Yd;

			// EX ALU
			if (EX_ADD)
				EX_ALU_OUT = EX_operand_X + EX_operand_Y;
			else if (EX_SUB)
				EX_ALU_OUT = EX_operand_X - EX_operand_Y;
			else // For LW/SW, ALU passes through the address from Rs
				EX_ALU_OUT = EX_operand_X;

			// EX/MEM stage register update
			MEM_ALU_OUT <= EX_ALU_OUT;
			MEM_STORE_DATA <= EX_operand_Y; // Pass Rt data for SW
			MEM_SUB <= EX_SUB; 
			MEM_ADD <= EX_ADD;
			MEM_LW  <= EX_LW;
			MEM_SW  <= EX_SW;
			MEM_Rd   <= EX_Rd;
			MEM_INSTR <= EX_INSTR; // carry the instruction for reverse assembling and displaying in Time-Space diagram

			
		// ID stage logic and ID_EX stage register
			// ID stage logic
			if (WB_WRITE == 1 && WB_Rd != 5'd0)
				reg_file[WB_Rd] <= WB_RD; // write back to the register file, ignoring writes to R0
			
			// Read from register file with forwarding from WB stage. R0 is always 0.
			if (ID_Rs == 5'd0)
				ID_XD = 64'd0;
			else if ((WB_Rd == ID_Rs) && WB_WRITE == 1)
				ID_XD = WB_RD; // forwarding from WB stage using blocking assignment
			else
				ID_XD = reg_file[ID_Rs]; // register content is read from the register file using blocking assignment

			// For LW, Rt is a destination, not a source. For other ops, read Rt. R0 is always 0.
			if (~ID_LW) begin
				if (ID_Rt == 5'd0)
					ID_Yd = 64'd0;
				else if ((WB_Rd == ID_Rt) && WB_WRITE == 1)
					ID_Yd = WB_RD; // forwarding from WB stage using blocking assignment
				else
					ID_Yd = reg_file[ID_Rt]; // register content is read from the register file using blocking assignment
			end else begin
				ID_Yd = 64'hXXXXXXXXXXXXXXXX;
			end

			// ID/EX stage register
			EX_XD <= ID_XD;
			EX_Yd <= ID_Yd;
			EX_Rs <= ID_Rs;
			EX_Rt <= ID_Rt;
			EX_Rd <= ID_Rd;
			EX_SUB <= (~STALL) & ID_SUB; 
			EX_ADD <= (~STALL) & ID_ADD;
			EX_LW  <= (~STALL) & ID_LW;
			EX_SW  <= (~STALL) & ID_SW;
			if (STALL) // If stalling, inject a bubble (NOP instruction, all zeros) into the EX1 stage for clarity in simulation.
				EX_INSTR <= 32'b0;
			else // Otherwise, pass the instruction forward.
				EX_INSTR <= ID_INSTR; // carry the instruction for reverse assembling and displaying in Time-Space diagram
	  end
  
  end

//--------------------------------------------------
endmodule