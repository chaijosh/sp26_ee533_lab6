`timescale 1ns / 1ps

module cpu_with_ALU (CLK,RSTB);
input CLK,RSTB;

// =============================
// IF stage signals
// =============================
reg [8:0] PC_OUT;
wire [31:0] instr_mem_douta;

// =============================
// ID stage signals
// =============================
reg STALL;

wire w_RegDst, w_ALUSrc, w_MemtoReg, w_RegWrite, w_MemRead, w_MemWrite, w_Branch;
wire w_ALUOp1, w_ALUOp0;

reg ID_ALUSrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_Branch;
reg [1:0] ID_ALUOp;

reg [4:0] ID_Rs,ID_Rt,ID_Rd;
reg [3:0] ID_funct;
reg [15:0] ID_imm;

reg [63:0] reg_file [0:31];
reg [31:0] ID_INSTR;

// Combinational register file read
wire [63:0] ID_XD_wire, ID_Yd_wire;

// =============================
// EX stage signals
// =============================
wire [63:0] w_forward_A;
wire [63:0] w_forward_B;
wire [63:0] w_alu_B_operand;
wire [63:0] w_alu_result;
wire w_alu_zero;

reg EX_ALUSrc, EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_Branch;
reg [1:0] EX_ALUOp;

wire [3:0] EX_ALUOp_final;
wire [63:0] EX_imm_extended;

reg [4:0] EX_Rs, EX_Rt, EX_Rd;
reg [3:0] EX_funct;
reg [15:0] EX_imm;
reg [63:0] EX_XD, EX_Yd;
reg [31:0] EX_INSTR;

// =============================
// MEM stage signals
// =============================
wire [63:0] data_mem_douta;

reg MEM_MemtoReg, MEM_RegWrite, MEM_MemRead, MEM_MemWrite, MEM_Branch;
reg [4:0] MEM_Rd;
reg [63:0] MEM_ALU_OUT, MEM_STORE_DATA;
reg [31:0] MEM_INSTR;

// =============================
// WB stage signals
// =============================
reg WB_MemtoReg, WB_RegWrite;
reg [4:0] WB_Rd;
reg [63:0] WB_ALU_OUT;
wire [63:0] WB_RD;
reg [31:0] WB_INSTR;

// =============================
// WB MUX
// =============================
assign WB_RD = WB_MemtoReg ? data_mem_douta : WB_ALU_OUT;

// =============================
// Instruction Memory instantiation
// =============================
instr_mem_dp ICache (
    .addra(PC_OUT),
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

// =============================
// Data Memory instantiation
// =============================
data_mem_64_256 DCache (
    .addra(MEM_ALU_OUT[7:0]),
    .clka(CLK),
    .dina(MEM_STORE_DATA),
    .douta(data_mem_douta),
    .ena(MEM_MemRead | MEM_MemWrite),
    .wea(MEM_MemWrite),
    .addrb(8'b0),
    .clkb(1'b0),
    .dinb(64'b0),
    .enb(1'b0),
    .web(1'b0),
    .doutb()
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
    .Branch(w_Branch),
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

// =============================
// Register File Read (Combinational)
// =============================
assign ID_XD_wire =
    (ID_Rs == 0) ? 64'd0 :
    (WB_RegWrite && WB_Rd == ID_Rs) ? WB_RD :
    reg_file[ID_Rs];

assign ID_Yd_wire =
    (ID_Rt == 0) ? 64'd0 :
    (WB_RegWrite && WB_Rd == ID_Rt) ? WB_RD :
    reg_file[ID_Rt];

// =============================
// Forwarding unit
// =============================
assign w_forward_A =
    ( (EX_Rs == MEM_Rd) && MEM_RegWrite && (MEM_Rd != 0) ) ?
        (MEM_MemRead ? data_mem_douta : MEM_ALU_OUT) :
    ( (EX_Rs == WB_Rd) && WB_RegWrite && (WB_Rd != 0) ) ?
        WB_RD :
    EX_XD;

assign w_forward_B =
    ( (EX_Rt == MEM_Rd) && MEM_RegWrite && (MEM_Rd != 0) ) ?
        (MEM_MemRead ? data_mem_douta : MEM_ALU_OUT) :
    ( (EX_Rt == WB_Rd) && WB_RegWrite && (WB_Rd != 0) ) ?
        WB_RD :
    EX_Yd;

assign w_alu_B_operand = EX_ALUSrc ? EX_imm_extended : w_forward_B;

// =============================
// ALU instantiation
// =============================
alu_64 theALU (
    .A(w_forward_A),
    .ALUOp(EX_ALUOp_final),
    .B(w_alu_B_operand),
    .byte_select(8'b0),
    .ShiftA(7'b0),
    .ShiftB(7'b0),
    .O(w_alu_result),
    .Overflow(),
    .Z(w_alu_zero)
);

// =============================
// Sequential Logic
// =============================
always @(posedge CLK or negedge RSTB)
begin
if (!RSTB)
begin
    PC_OUT <= 0;

    ID_ALUSrc <= 0; ID_MemtoReg <= 0; ID_RegWrite <= 0;
    ID_MemRead <= 0; ID_MemWrite <= 0; ID_Branch <= 0;
    ID_ALUOp <= 0; ID_INSTR <= 0;

    EX_ALUSrc <= 0; EX_MemtoReg <= 0; EX_RegWrite <= 0;
    EX_MemRead <= 0; EX_MemWrite <= 0; EX_Branch <= 0;
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
    // Hazard Detection Unit
    // =============================
    STALL = EX_MemRead &&
            (EX_Rd != 5'd0) &&
            ((EX_Rd == ID_Rs) || (EX_Rd == ID_Rt));

    if (!STALL)
    begin
        PC_OUT <= PC_OUT + 1;

        ID_Rs <= instr_mem_douta[25:21];
        ID_Rt <= instr_mem_douta[20:16];
        ID_Rd <= w_RegDst ? instr_mem_douta[15:11] :
                            instr_mem_douta[20:16];
        ID_imm <= instr_mem_douta[15:0];
        ID_funct <= instr_mem_douta[3:0];

        ID_ALUSrc   <= w_ALUSrc;
        ID_MemtoReg <= w_MemtoReg;
        ID_RegWrite <= w_RegWrite;
        ID_MemRead  <= w_MemRead;
        ID_MemWrite <= w_MemWrite;
        ID_Branch   <= w_Branch;
        ID_ALUOp    <= {w_ALUOp1, w_ALUOp0};
        ID_INSTR    <= instr_mem_douta;
    end

    // =============================
    // Writeback
    // =============================
    if (WB_RegWrite && (WB_Rd != 0))
        reg_file[WB_Rd] <= WB_RD;

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
    MEM_STORE_DATA <= w_forward_B;
    MEM_MemtoReg <= EX_MemtoReg;
    MEM_RegWrite <= EX_RegWrite;
    MEM_MemRead  <= EX_MemRead;
    MEM_MemWrite <= EX_MemWrite;
    MEM_Branch   <= EX_Branch;
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

    EX_ALUSrc   <= (!STALL) & ID_ALUSrc;
    EX_MemtoReg <= (!STALL) & ID_MemtoReg;
    EX_RegWrite <= (!STALL) & ID_RegWrite;
    EX_MemRead  <= (!STALL) & ID_MemRead;
    EX_MemWrite <= (!STALL) & ID_MemWrite;
    EX_Branch   <= (!STALL) & ID_Branch;
    EX_ALUOp    <= (!STALL) ? ID_ALUOp : 2'b00;
    EX_INSTR    <= STALL ? 32'b0 : ID_INSTR;

end
end

endmodule
