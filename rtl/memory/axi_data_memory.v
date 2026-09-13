`timescale 1ns / 1ps

module axi_data_memory #(
    parameter int AXI_ADDR_WIDTH   = 32,
    parameter int AXI_DATA_WIDTH   = 32,
    parameter int MEM_DEPTH        = 1024,                  // 1024 words = 4096 bytes (4 KB)
    parameter logic [31:0] BASE_ADDR = 32'h0000_0000
)(
    input  wire                          clk,
    input  wire                          rst,

    // =========================================================================
    // AXI4-Lite Slave Interface (Connected to AXI Decoder Slave 0)
    // =========================================================================
    // Write Address Channel
    input  wire [AXI_ADDR_WIDTH-1:0]     s_axi_awaddr,
    input  wire                          s_axi_awvalid,
    output reg                           s_axi_awready,

    // Write Data Channel
    input  wire [AXI_DATA_WIDTH-1:0]     s_axi_wdata,
    input  wire [AXI_DATA_WIDTH/8-1:0]   s_axi_wstrb,
    input  wire                          s_axi_wvalid,
    output reg                           s_axi_wready,

    // Write Response Channel
    output reg  [1:0]                    s_axi_bresp,
    output reg                           s_axi_bvalid,
    input  wire                          s_axi_bready,

    // Read Address Channel
    input  wire [AXI_ADDR_WIDTH-1:0]     s_axi_araddr,
    input  wire                          s_axi_arvalid,
    output reg                           s_axi_arready,

    // Read Data Channel
    output reg  [AXI_DATA_WIDTH-1:0]     s_axi_rdata,
    output reg  [1:0]                    s_axi_rresp,
    output reg                           s_axi_rvalid,
    input  wire                          s_axi_rready
);

    localparam logic [1:0] AXI_RESP_OKAY   = 2'b00;
    localparam logic [1:0] AXI_RESP_SLVERR = 2'b10;

    localparam int BYTE_SIZE  = MEM_DEPTH * 4;
    localparam int ADDR_WIDTH = $clog2(MEM_DEPTH);

    // -------------------------------------------------------------------------
    // SRAM Port Signals
    // -------------------------------------------------------------------------
    reg                  mem_en;
    reg  [3:0]            mem_we;
    reg  [ADDR_WIDTH-1:0] mem_addr;
    reg  [31:0]           mem_wdata;
    wire [31:0]           mem_rdata;

    // Instantiate Underlying Physical Data Memory
    data_memory #(
        .MEM_DEPTH (MEM_DEPTH)
    ) u_data_memory (
        .clk   (clk),
        .en    (mem_en),
        .we    (mem_we),
        .addr  (mem_addr),
        .wdata (mem_wdata),
        .rdata (mem_rdata)
    );

    // -------------------------------------------------------------------------
    // Address Validation Helper
    // -------------------------------------------------------------------------
    function automatic logic is_valid_addr(input [31:0] addr);
        return ((addr >= BASE_ADDR) &&
                ((addr - BASE_ADDR) < BYTE_SIZE) &&
                (addr[1:0] == 2'b00));
    endfunction

    // -------------------------------------------------------------------------
    // Write Channel Buffering & State Machine
    // -------------------------------------------------------------------------
    reg [AXI_ADDR_WIDTH-1:0]     awaddr_buf;
    reg [AXI_DATA_WIDTH-1:0]     wdata_buf;
    reg [AXI_DATA_WIDTH/8-1:0]   wstrb_buf;
    reg                          aw_latched;
    reg                          w_latched;

    typedef enum logic [1:0] {
        W_IDLE   = 2'b00,
        W_EXEC   = 2'b01,
        W_RESP   = 2'b10
    } wr_state_t;

    wr_state_t wr_state;

    wire [AXI_ADDR_WIDTH-1:0] eff_awaddr = aw_latched ? awaddr_buf : s_axi_awaddr;
    wire [AXI_DATA_WIDTH-1:0] eff_wdata  = w_latched  ? wdata_buf  : s_axi_wdata;
    wire [3:0]                eff_wstrb  = w_latched  ? wstrb_buf  : s_axi_wstrb;

    // -------------------------------------------------------------------------
    // Read Channel Buffering & State Machine
    // -------------------------------------------------------------------------
    reg [AXI_ADDR_WIDTH-1:0] araddr_buf;

    typedef enum logic [1:0] {
        R_IDLE   = 2'b00,
        R_WAIT   = 2'b01,
        R_RESP   = 2'b10
    } rd_state_t;

    rd_state_t rd_state;

    // -------------------------------------------------------------------------
    // Memory Port Arbitration (Read priority over Write if simultaneous)
    // -------------------------------------------------------------------------
    always_comb begin
        if (rd_state == R_IDLE && s_axi_arvalid && s_axi_arready && is_valid_addr(s_axi_araddr)) begin
            // Synchronous Read: Address applied directly to memory
            mem_en    = 1'b1;
            mem_we    = 4'b0000;
            mem_addr  = (s_axi_araddr - BASE_ADDR) >> 2;
            mem_wdata = 32'd0;
        end else if (wr_state == W_EXEC && is_valid_addr(eff_awaddr)) begin
            // Synchronous Write: Address, data and strobes applied to memory
            mem_en    = 1'b1;
            mem_we    = eff_wstrb;
            mem_addr  = (eff_awaddr - BASE_ADDR) >> 2;
            mem_wdata = eff_wdata;
        end else begin
            mem_en    = 1'b0;
            mem_we    = 4'b0000;
            mem_addr  = '0;
            mem_wdata = 32'd0;
        end
    end

    // -------------------------------------------------------------------------
    // AXI Write Channel Handling
    // -------------------------------------------------------------------------
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            s_axi_awready <= 1'b1;
            s_axi_wready  <= 1'b1;
            s_axi_bvalid  <= 1'b0;
            s_axi_bresp   <= AXI_RESP_OKAY;
            aw_latched    <= 1'b0;
            w_latched     <= 1'b0;
            awaddr_buf    <= '0;
            wdata_buf     <= '0;
            wstrb_buf     <= '0;
            wr_state      <= W_IDLE;
        end else begin
            // Latch Write Address
            if (s_axi_awvalid && s_axi_awready) begin
                awaddr_buf    <= s_axi_awaddr;
                aw_latched    <= 1'b1;
                s_axi_awready <= 1'b0;
            end

            // Latch Write Data
            if (s_axi_wvalid && s_axi_wready) begin
                wdata_buf    <= s_axi_wdata;
                wstrb_buf    <= s_axi_wstrb;
                w_latched    <= 1'b1;
                s_axi_wready <= 1'b0;
            end

            case (wr_state)
                W_IDLE: begin
                    if ((aw_latched || (s_axi_awvalid && s_axi_awready)) &&
                        (w_latched  || (s_axi_wvalid  && s_axi_wready))) begin
                        
                        if (is_valid_addr(eff_awaddr)) begin
                            wr_state <= W_EXEC;
                        end else begin
                            // Unmapped/Unaligned Address: Return SLVERR
                            s_axi_bresp  <= AXI_RESP_SLVERR;
                            s_axi_bvalid <= 1'b1;
                            wr_state     <= W_RESP;
                        end
                    end
                end

                W_EXEC: begin
                    // Memory write performed in this cycle; transition to response
                    s_axi_bresp  <= AXI_RESP_OKAY;
                    s_axi_bvalid <= 1'b1;
                    wr_state     <= W_RESP;
                end

                W_RESP: begin
                    if (s_axi_bvalid && s_axi_bready) begin
                        s_axi_bvalid  <= 1'b0;
                        aw_latched    <= 1'b0;
                        w_latched     <= 1'b0;
                        s_axi_awready <= 1'b1;
                        s_axi_wready  <= 1'b1;
                        wr_state      <= W_IDLE;
                    end
                end
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // AXI Read Channel Handling
    // -------------------------------------------------------------------------
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            s_axi_arready <= 1'b1;
            s_axi_rvalid  <= 1'b0;
            s_axi_rdata   <= '0;
            s_axi_rresp   <= AXI_RESP_OKAY;
            araddr_buf    <= '0;
            rd_state      <= R_IDLE;
        end else begin
            case (rd_state)
                R_IDLE: begin
                    if (s_axi_arvalid && s_axi_arready) begin
                        araddr_buf    <= s_axi_araddr;
                        s_axi_arready <= 1'b0;

                        if (is_valid_addr(s_axi_araddr)) begin
                            // Memory address is applied combinatorially in this cycle.
                            // Advance to wait 1 clock cycle for synchronous memory output.
                            rd_state <= R_WAIT;
                        end else begin
                            s_axi_rdata  <= 32'd0;
                            s_axi_rresp  <= AXI_RESP_SLVERR;
                            s_axi_rvalid <= 1'b1;
                            rd_state     <= R_RESP;
                        end
                    end
                end

                R_WAIT: begin
                    // Capture synchronous read data from memory
                    s_axi_rdata  <= mem_rdata;
                    s_axi_rresp  <= AXI_RESP_OKAY;
                    s_axi_rvalid <= 1'b1;
                    rd_state     <= R_RESP;
                end

                R_RESP: begin
                    if (s_axi_rvalid && s_axi_rready) begin
                        s_axi_rvalid  <= 1'b0;
                        s_axi_arready <= 1'b1;
                        rd_state      <= R_IDLE;
                    end
                end
            endcase
        end
    end

endmodule
