`ifndef VGA_IF_SV
`define VGA_IF_SV

interface vga_if (input logic clk, input logic rst);
  logic       Hsync;
  logic       Vsync;
  logic [7:0] red;
  logic [7:0] green;
  logic [7:0] blue;
endinterface

`endif
