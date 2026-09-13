`timescale 1ns / 1ps

`include "uvm_macros.svh"

module tb_top;
  import uvm_pkg::*;
  import axi_lite_types_pkg::*;
  import axi_lite_pkg::*;
  import vga_pkg::*;
  import vga_env_pkg::*;
  import vga_test_pkg::*;

  logic clk;
  logic rst;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1;
    #40;
    @(posedge clk);
    rst = 0;
  end

  // Interfaces
  axi_lite_if #(32, 32) m_axi_if(clk, rst);
  vga_if vga_vif(clk, rst);

  // DUT Instance
  wire [18:0] fb_addr;
  wire [31:0] fb_wdata;
  wire [3:0]  fb_we;
  wire        fb_en;
  wire [31:0] fb_rdata;

  wire        vga_fb_req;
  wire [20:0] vga_fb_addr;
  wire        vga_video_on;
  wire        display_enable;

  vga_registers #(
      .AXI_ADDR_WIDTH   (32),
      .AXI_DATA_WIDTH   (32),
      .FB_WIDTH_DEFAULT (640),
      .FB_HEIGHT_DEFAULT(480),
      .FB_BASE_DEFAULT  (32'h5000_0000)
  ) u_vga_reg (
      .clk            (clk),
      .rst            (rst),
      .btn            (4'h0),
      .sw             (4'h0),
      .s_axi_awaddr   (m_axi_if.awaddr),
      .s_axi_awvalid  (m_axi_if.awvalid),
      .s_axi_awready  (m_axi_if.awready),
      .s_axi_wdata    (m_axi_if.wdata),
      .s_axi_wstrb    (m_axi_if.wstrb),
      .s_axi_wvalid   (m_axi_if.wvalid),
      .s_axi_wready   (m_axi_if.wready),
      .s_axi_bresp    (m_axi_if.bresp),
      .s_axi_bvalid   (m_axi_if.bvalid),
      .s_axi_bready   (m_axi_if.bready),
      .s_axi_araddr   (m_axi_if.araddr),
      .s_axi_arvalid  (m_axi_if.arvalid),
      .s_axi_arready  (m_axi_if.arready),
      .s_axi_rdata    (m_axi_if.rdata),
      .s_axi_rresp    (m_axi_if.rresp),
      .s_axi_rvalid   (m_axi_if.rvalid),
      .s_axi_rready   (m_axi_if.rready),
      .vga_fb_req     (vga_fb_req),
      .vga_fb_addr    (vga_fb_addr),
      .vga_video_on   (vga_video_on),
      .display_enable (display_enable),
      .fb_addr        (fb_addr),
      .fb_wdata       (fb_wdata),
      .fb_we          (fb_we),
      .fb_en          (fb_en),
      .fb_rdata       (fb_rdata)
  );

 

  vga_controller #(
      .PIXEL_SCALE(1),
      .H_VISIBLE(64),
      .H_FRONT(2),
      .H_SYNC(10),
      .H_BACK(5),
      .V_VISIBLE(48),
      .V_FRONT(2),
      .V_SYNC(2),
      .V_BACK(2)
  ) u_vga_ctrl (
      .clk(clk),
      .rst(rst),
      .display_enable(display_enable),
      .vga_fb_req(vga_fb_req),
      .vga_fb_addr(vga_fb_addr),
      .vga_video_on(vga_video_on),
      .vga_data(fb_rdata),
      .Hsync(vga_vif.Hsync),
      .Vsync(vga_vif.Vsync),
      .red(vga_vif.red),
      .green(vga_vif.green),
      .blue(vga_vif.blue)
  );

  framebuffer_sram #(
      .FB_WIDTH(640),
      .FB_HEIGHT(480)
  ) u_fb_sram (
      .clk  (clk),
      .en   (fb_en),
      .we   (fb_we),
      .addr (fb_addr),
      .wdata(fb_wdata),
      .rdata(fb_rdata)
  );

  // Bind SV Assertions
  bind u_vga_ctrl.u_vga_timing vga_assertions u_vga_asserts (
    .clk(clk),
    .rst(rst),
    .Hsync(Hsync),
    .Vsync(Vsync),
    .video_on(video_on),
    .H_count(H_count),
    .V_count(V_count),
    .H_VISIBLE(H_VISIBLE),
    .H_FRONT(H_FRONT),
    .H_SYNC(H_SYNC),
    .H_BACK(H_BACK),
    .V_VISIBLE(V_VISIBLE),
    .V_FRONT(V_FRONT),
    .V_SYNC(V_SYNC),
    .V_BACK(V_BACK)
  );

  initial begin
    uvm_config_db#(virtual axi_lite_if)::set(null, "*.axi_agnt.*", "vif", m_axi_if);
    uvm_config_db#(virtual vga_if)::set(null, "*.vga_agnt.*", "vif", vga_vif);
    run_test();
  end

endmodule
