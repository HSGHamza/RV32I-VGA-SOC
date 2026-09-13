`ifndef VGA_ASSERTIONS_SV
`define VGA_ASSERTIONS_SV

module vga_assertions (
    input clk,
    input rst,
    input Hsync,
    input Vsync,
    input video_on,
    input [15:0] H_count,
    input [15:0] V_count,
    input [15:0] H_VISIBLE,
    input [15:0] H_FRONT,
    input [15:0] H_SYNC,
    input [15:0] H_BACK,
    input [15:0] V_VISIBLE,
    input [15:0] V_FRONT,
    input [15:0] V_SYNC,
    input [15:0] V_BACK
);

  // Helper properties
  property p_hsync_active;
    @(posedge clk) disable iff (rst)
    (H_count >= (H_VISIBLE + H_FRONT)) && (H_count < (H_VISIBLE + H_FRONT + H_SYNC)) |-> (Hsync == 0);
  endproperty

  property p_hsync_inactive;
    @(posedge clk) disable iff (rst)
    !((H_count >= (H_VISIBLE + H_FRONT)) && (H_count < (H_VISIBLE + H_FRONT + H_SYNC))) |-> (Hsync == 1);
  endproperty

  property p_vsync_active;
    @(posedge clk) disable iff (rst)
    (V_count >= (V_VISIBLE + V_FRONT)) && (V_count < (V_VISIBLE + V_FRONT + V_SYNC)) |-> (Vsync == 0);
  endproperty

  property p_vsync_inactive;
    @(posedge clk) disable iff (rst)
    !((V_count >= (V_VISIBLE + V_FRONT)) && (V_count < (V_VISIBLE + V_FRONT + V_SYNC))) |-> (Vsync == 1);
  endproperty

  // Assertions
  assert_hsync_active: assert property (p_hsync_active) else $error("HSYNC should be active (low)");
  assert_hsync_inactive: assert property (p_hsync_inactive) else $error("HSYNC should be inactive (high)");
  assert_vsync_active: assert property (p_vsync_active) else $error("VSYNC should be active (low)");
  assert_vsync_inactive: assert property (p_vsync_inactive) else $error("VSYNC should be inactive (high)");

endmodule

`endif
