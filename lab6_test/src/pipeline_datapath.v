`timescale 1ns / 1ps

module pipeline_datapath #( parameter UDP_REG_SRC_WIDTH = 2 ) (
    input clk, input reset,
    input reg_req_in, input reg_ack_in, input reg_rd_wr_L_in,
    input [`UDP_REG_ADDR_WIDTH-1:0] reg_addr_in, input [`CPCI_NF2_DATA_WIDTH-1:0] reg_data_in,
    input [UDP_REG_SRC_WIDTH-1:0] reg_src_in,
    output reg_req_out, output reg_ack_out, output reg_rd_wr_L_out,
    output [`UDP_REG_ADDR_WIDTH-1:0] reg_addr_out, output [`CPCI_NF2_DATA_WIDTH-1:0] reg_data_out,
    output [UDP_REG_SRC_WIDTH-1:0] reg_src_out
);
    // Connection to CPU Ports
    wire [31:0] cpu_imem_dout_b;
    wire [63:0] cpu_dmem_dout_b;
    wire [8:0] cpu_pc_out;
    // SW Regs
    wire [31:0] imem_interact, imem_write, imem_rw_address, imem_wdata;
    wire [31:0] dmem_interact, dmem_write, dmem_rw_address, dmem_wdata_hi, dmem_wdata_lo;

    // HW Regs & Internal State
    reg [8:0]  PC;           // CPU Traversal PC
    reg [31:0] hwreg1;       // Shadow PC
    reg [31:0] imem_rdata;   // Extraction (Port B Read)
    reg [31:0] dmem_rdata_hi, dmem_rdata_lo; // Extraction (Port B Read)

    wire debug_mode     = imem_interact[0];
    wire cpu_soft_reset = imem_interact[1];

    always @(posedge clk) begin
        if (!cpu_soft_reset) begin
            hwreg1 <= 32'hBADABDAB;
            imem_rdata <= 32'hBADABDAB;
        end 
        else begin
            // 1. CPU Port A Logic
            if (!debug_mode) begin
                hwreg1 <= {23'b0, cpu_pc_out};
            end 
            
            // 2. Debug Port B Extraction (Readback)
            if (debug_mode) begin
                imem_rdata <= cpu_imem_dout_b;
            end
            if (dmem_interact[0]) begin
                dmem_rdata_hi <= cpu_dmem_dout_b[63:32];
                dmem_rdata_lo <= cpu_dmem_dout_b[31:0];
            end
        end
    end



    cpu_CMT my_cpu (
        .CLK(clk),
        .debug_pc(imem_rw_address[8:0]),   // Driven to Port B
        .debug_enable(debug_mode),         // Enable Port B & Stall A
        .debug_instr_in(imem_wdata),       // Write-data Port B
        .debug_instr_write_en(imem_write[0]), // Write-enable Port B
        .debug_instr_out(cpu_imem_dout_b), // Read-data Port B
        .debug_addr_in(dmem_rw_address[7:0]), // Data Addr Port B
        .debug_data_in({dmem_wdata_hi, dmem_wdata_lo}), // Data Write-data Port B
        .debug_data_write_en(dmem_write[0]), // Data Write-enable Port B
        .debug_data_out(cpu_dmem_dout_b),  // Data Read-data Port B
        .RSTB(cpu_soft_reset),
	.PC_END(cpu_pc_out)
    );

    generic_regs #( 
        .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
        .TAG                 (`PIPELINE_DATAPATH_BLOCK_ADDR), // Defined in defines.v
        .REG_ADDR_WIDTH      (`PIPELINE_DATAPATH_REG_ADDR_WIDTH),
        .NUM_COUNTERS        (0),
        .NUM_SOFTWARE_REGS   (9),
        .NUM_HARDWARE_REGS   (4)
    ) module_regs (
        .reg_req_in      (reg_req_in),
        .reg_ack_in      (reg_ack_in),
        .reg_rd_wr_L_in  (reg_rd_wr_L_in),
        .reg_addr_in     (reg_addr_in),
        .reg_data_in     (reg_data_in),
        .reg_src_in      (reg_src_in),
        
        .reg_req_out     (reg_req_out),
        .reg_ack_out     (reg_ack_out),
        .reg_rd_wr_L_out (reg_rd_wr_L_out),
        .reg_addr_out    (reg_addr_out),
        .reg_data_out    (reg_data_out),
        .reg_src_out     (reg_src_out),
        
        // --- WIRE MAPPING ---
        .counter_updates   (),
        .counter_decrement (),
	.software_regs({
            dmem_wdata_lo,      // Reg 8 (Offset 0x20)
            dmem_wdata_hi,      // Reg 7
            dmem_rw_address,    // Reg 6
            dmem_write,         // Reg 5
            dmem_interact,      // Reg 4
            imem_wdata,         // Reg 3
            imem_rw_address,    // Reg 2
            imem_write,         // Reg 1
            imem_interact       // Reg 0 (Offset 0x00)
        }),
        // HARDWARE REGS: Last item (imem_rdata) = Hardware Reg 0 (Offset 0x24)
        .hardware_regs({
            hwreg1,             // HW Reg 3 (Offset 0x30)
            dmem_rdata_hi,      // HW Reg 2
            dmem_rdata_lo,      // HW Reg 1
            imem_rdata          // HW Reg 0 (Offset 0x24)
        }),
        .clk(clk), .reset(reset)
    );
endmodule
