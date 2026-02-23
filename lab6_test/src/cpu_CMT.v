`timescale 1ns / 1ps

module cpu_CMT (CLK,
                RSTB,
                debug_pc,
                debug_enable,
                debug_instr_in,
                debug_instr_write_en,
                debug_instr_out,
                debug_addr_in,
                debug_data_in,
                debug_data_write_en,
                debug_data_out,
		PC_END);
input CLK,RSTB;

// =============================
// Debugging signals
// =============================
input [7:0] debug_addr_in;        // Port B Data Addr
input [63:0] debug_data_in;       // Port B Data In
input debug_data_write_en;        // Port B Data WE
input debug_enable;               // Debug Mode Enable
input [31:0] debug_instr_in;      // Port B Instr In
input debug_instr_write_en;       // Port B Instr WE
input [8:0] debug_pc;             // Port B Instr Addr
output [63:0] debug_data_out;     // Port B Data Out
output [31:0] debug_instr_out;     // Port B Instr Out
output [8:0] PC_END;         // Port A PC (CPU Execution)

// =============================
// IF stage signals
// =============================
reg [8:0] PC_OUT;
wire [31:0] instr_mem_douta;

// =============================
// ID stage signals
// =============================
// reg STALL; // Removed stalling mechanism
wire w_RegDst, w_ALUSrc, w_MemtoReg, w_RegWrite, w_MemRead, w_MemWrite, w_Branch_ifEqual, w_Branch_ifNotEqual;
wire w_ALUOp1, w_ALUOp0;
reg ID_ALUSrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_Branch_ifEqual, ID_Branch_ifNotEqual;
reg [1:0] ID_ALUOp;
reg [4:0] ID_Rs, ID_Rt, ID_Rd;
reg [3:0] ID_funct;
reg [15:0] ID_imm;
reg [31:0] ID_INSTR;
reg [31:0] reg_file [0:31];
reg [8:0] ID_PC_OUT;

// Combinational register file read
wire [31:0] ID_XD_wire, ID_Yd_wire;

// =============================
// EX stage signals
// =============================
wire [31:0] EX_operand_A;
wire [31:0] EX_operand_B;
wire [31:0] w_alu_result;
wire w_alu_zero;
reg EX_ALUSrc, EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_Branch_ifEqual, EX_Branch_ifNotEqual;
reg [1:0] EX_ALUOp;
wire [3:0] EX_ALUOp_final;
wire [31:0] EX_imm_extended;
reg [4:0] EX_Rs, EX_Rt, EX_Rd;
reg [3:0] EX_funct;
reg [15:0] EX_imm;
reg [31:0] EX_XD, EX_Yd;
reg [31:0] EX_INSTR;
reg [8:0] EX_PC_OUT;

wire [8:0] BTA;
wire Br1;

// =============================
// MEM stage signals
// =============================
wire [31:0] data_mem_douta;
reg MEM_MemtoReg, MEM_RegWrite, MEM_MemRead, MEM_MemWrite;
reg [4:0] MEM_Rd;
reg [31:0] MEM_ALU_OUT, MEM_STORE_DATA;
reg [31:0] MEM_INSTR;

// =============================
// WB stage signals
// =============================
reg WB_MemtoReg, WB_RegWrite;
reg [4:0] WB_Rd;
reg [31:0] WB_ALU_OUT;
wire [31:0] WB_RData;
reg [31:0] WB_INSTR;

// =============================
// WB MUX
// =============================
assign WB_RData = WB_MemtoReg ? data_mem_douta : WB_ALU_OUT;
// =============================
// Instruction Memory instantiation
// =============================
instr_mem_dp ICache (
    .addra(PC_OUT),
    .clka(CLK),
    .douta(instr_mem_douta),
    .ena(1'b1),
    .clkb(CLK), 
    .addrb(debug_pc[8:0]), 
    .dinb(debug_instr_in[31:0]), 
    .doutb(debug_instr_out[31:0]), 
    .enb(debug_enable), 
    .web(debug_instr_write_en)
);

// =============================
// Data Memory instantiation
// =============================
data_mem_64_256 DCache (
    .addra(MEM_ALU_OUT[7:0]),
    .clka(CLK),
    .dina( {{32{MEM_STORE_DATA[31]}},MEM_STORE_DATA}),
    .douta(data_mem_douta),
    .ena(MEM_MemRead | MEM_MemWrite),
    .wea(MEM_MemWrite),
    .clkb(CLK), 
    .addrb(debug_addr_in[7:0]), 
    .dinb(debug_data_in[63:0]), 
    .enb(debug_enable), 
    .web(debug_data_write_en), 
    .doutb(debug_data_out[63:0])
);

// =============================
// Control Unit instantiation
// =============================
control_unit main_control (
    .opcode(instr_mem_douta[31:26]),
    .RegDst(w_RegDst),
    .ALUSrc(w_ALUSrc),
    .MemtoReg(w_MemtoReg),
    .RegWrite(w_RegWrite),
    .MemRead(w_MemRead),
    .MemWrite(w_MemWrite),
    .Beq(w_Branch_ifEqual),
	 .Bne(w_Branch_ifNotEqual),
    .ALUOp1(w_ALUOp1),
    .ALUOp0(w_ALUOp0)
);

// =============================
// ALU controller instantiation
// =============================
alu_control alu_ctrl (
    .alu_op_in(EX_ALUOp),
    .funct(EX_funct),
    .alu_op_out(EX_ALUOp_final)
);

sign_extend sign_ext(
    .in(EX_imm),
    .out(EX_imm_extended)
);
assign PC_END = PC_OUT;
// =============================
// Register File Read (Combinational)
// =============================
assign ID_XD_wire = (ID_Rs == 0) ? 32'd0 : reg_file[ID_Rs];
assign ID_Yd_wire = (ID_Rt == 0) ? 32'd0 : reg_file[ID_Rt];

// =============================
// ALU instantiation
// =============================
// Generate ALU operand B for R-type v/s I-type
assign EX_operand_A = EX_XD;
assign EX_operand_B = EX_ALUSrc ? EX_imm_extended : EX_Yd;

alu_64 theALU (
    .A(EX_operand_A), // No forwarding, use EX_XD directly
    .ALUOp(EX_ALUOp_final),
    .B(EX_operand_B),
    .byte_select(8'b0),
    .ShiftA(7'b0),
    .ShiftB(7'b0),
    .O(w_alu_result),
    .N(),
	 .V(),
	 .C(),
    .Z(w_alu_zero)
);

// Branch resolution
assign Br1 = (EX_Branch_ifEqual && w_alu_zero) || (EX_Branch_ifNotEqual && !w_alu_zero);
assign BTA = EX_PC_OUT + EX_imm_extended[8:0] + 1;

// =============================
// Sequential Logic
// =============================
always @(posedge CLK or negedge RSTB)
begin
if (!RSTB)
begin
    PC_OUT <= 0;

    ID_ALUSrc <= 0; ID_MemtoReg <= 0; ID_RegWrite <= 0;
    ID_MemRead <= 0; ID_MemWrite <= 0; ID_Branch_ifEqual <= 0; ID_Branch_ifNotEqual <= 0;
    ID_ALUOp <= 0; ID_INSTR <= 0;

    EX_ALUSrc <= 0; EX_MemtoReg <= 0; EX_RegWrite <= 0;
    EX_MemRead <= 0; EX_MemWrite <= 0; EX_Branch_ifEqual <= 0; EX_Branch_ifNotEqual <= 0;
    EX_ALUOp <= 0; EX_INSTR <= 0;

    MEM_MemtoReg <= 0; MEM_RegWrite <= 0;
    MEM_MemRead <= 0; MEM_MemWrite <= 0;
    MEM_INSTR <= 0;

    WB_MemtoReg <= 0; WB_RegWrite <= 0;
    WB_INSTR <= 0;
end
else
begin
    // =============================
    // IF stage (PC update)
    // =============================
    if (Br1) begin // Use Br1 as the condition
        PC_OUT <= BTA; // BTA is the target address
    end else begin
        PC_OUT <= PC_OUT + 1;
    end

    // =============================
    // ID stage
    // =============================
    // ID register file inputs are directly given the instruction memory output
    // because of the synchronous read delay
    ID_Rs <= instr_mem_douta[25:21];
    ID_Rt <= instr_mem_douta[20:16];
    ID_Rd <= w_RegDst ? instr_mem_douta[15:11] :
                            instr_mem_douta[20:16];
    ID_imm <= instr_mem_douta[15:0];
    ID_funct <= instr_mem_douta[3:0];

    // Pipelining produced signals
    ID_ALUSrc         <= w_ALUSrc;
    ID_MemtoReg       <= w_MemtoReg;
    ID_RegWrite       <= w_RegWrite;
    ID_MemRead        <= w_MemRead;
    ID_MemWrite       <= w_MemWrite;
    ID_Branch_ifEqual <= w_Branch_ifEqual;
	 ID_Branch_ifNotEqual <= w_Branch_ifNotEqual;
    ID_ALUOp          <= {w_ALUOp1, w_ALUOp0};
    ID_INSTR          <= instr_mem_douta;
	 
	 // PC pipelined to ID:
	 ID_PC_OUT <= PC_OUT;

    // =============================
    // Writeback register file update logic
    // =============================
    if (WB_RegWrite && (WB_Rd != 0))
        reg_file[WB_Rd] <= WB_RData;

    // =============================
    // WB pipeline registers
    // =============================
    WB_MemtoReg <= MEM_MemtoReg;
    WB_ALU_OUT  <= MEM_ALU_OUT;
    WB_Rd       <= MEM_Rd;
    WB_RegWrite <= MEM_RegWrite;
    WB_INSTR    <= MEM_INSTR;
   
    // =============================
    // MEM pipeline registers
    // =============================
    MEM_ALU_OUT <= w_alu_result;
    MEM_STORE_DATA <= EX_Yd;
    MEM_MemtoReg <= EX_MemtoReg;
    MEM_RegWrite <= EX_RegWrite;
    MEM_MemRead  <= EX_MemRead;
    MEM_MemWrite <= EX_MemWrite;
    MEM_Rd       <= EX_Rd;
    MEM_INSTR    <= EX_INSTR;
    // =============================
    // EX pipeline registers
    // =============================
    EX_XD <= ID_XD_wire;
    EX_Yd <= ID_Yd_wire;
    EX_Rs <= ID_Rs;
    EX_Rt <= ID_Rt;
    EX_Rd <= ID_Rd;
    EX_imm <= ID_imm;
    EX_funct <= ID_funct;

    EX_ALUSrc   <= ID_ALUSrc;
    EX_MemtoReg <= ID_MemtoReg;
    EX_RegWrite <= ID_RegWrite;
    EX_MemRead  <= ID_MemRead;
    EX_MemWrite <= ID_MemWrite;
    EX_Branch_ifEqual   <= ID_Branch_ifEqual;
	 EX_Branch_ifNotEqual   <= ID_Branch_ifNotEqual;
    EX_ALUOp    <= ID_ALUOp;
    EX_INSTR    <= ID_INSTR;
	 
	 EX_PC_OUT <= ID_PC_OUT;
	

end
end

endmodule
