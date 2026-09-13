
`timescale 1ns / 1ps

module data_memory #(
    parameter int MEM_DEPTH  = 1024, // 1024 words = 4096 bytes (4 KB)
    parameter int ADDR_WIDTH = $clog2(MEM_DEPTH)
)(
    input  wire                  clk,
    input  wire                  en,
    input  wire [3:0]            we,
    input  wire [ADDR_WIDTH-1:0] addr,
    input  wire [31:0]           wdata,
    output reg  [31:0]           rdata
);

    reg [31:0] memory [0:MEM_DEPTH-1];

    always @(posedge clk) begin
        if (en) begin
            if (we[0]) memory[addr][7:0]   <= wdata[7:0];
            if (we[1]) memory[addr][15:8]  <= wdata[15:8];
            if (we[2]) memory[addr][23:16] <= wdata[23:16];
            if (we[3]) memory[addr][31:24] <= wdata[31:24];
            rdata <= memory[addr];
        end
    end

endmodule
