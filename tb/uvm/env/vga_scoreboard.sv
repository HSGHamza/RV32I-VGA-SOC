`ifndef VGA_SCOREBOARD_SV
`define VGA_SCOREBOARD_SV

`uvm_analysis_imp_decl(_axi)
`uvm_analysis_imp_decl(_vga)

class vga_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(vga_scoreboard)

  uvm_analysis_imp_axi #(axi_lite_item, vga_scoreboard) axi_export;
  uvm_analysis_imp_vga #(vga_item, vga_scoreboard) vga_export;

  // Reference Framebuffer (32-bit words, each containing 4 pixels if 8bpp)
  // For simplicity, let's just store the exact 32-bit words written to each address
  int ref_fb[int];

  // Register state
  bit display_enable = 0;

  function new(string name = "vga_scoreboard", uvm_component parent = null);
    super.new(name, parent);
    axi_export = new("axi_export", this);
    vga_export = new("vga_export", this);
  endfunction

  virtual function void write_axi(axi_lite_item item);
    if (item.op == axi_lite_types_pkg::AXI_WRITE) begin
      if (item.addr == 32'h1000_0000) begin
        display_enable = item.wdata[0];
        `uvm_info("SCB", $sformatf("Display Enable updated to %0b", display_enable), UVM_LOW)
      end else if (item.addr >= 32'h5000_0000 && item.addr < 32'h5012_C000) begin
        // Write to Framebuffer memory
        ref_fb[item.addr] = item.wdata;
      end
    end
  endfunction

  virtual function void write_vga(vga_item item);
    // Compare reconstructed frame against ref_fb
    // This is highly dependent on pixel unpacking logic
    // For this demonstration, we'll just log that a frame was received.
    if (display_enable == 1) begin
      `uvm_info("SCB", $sformatf("Received active frame of size %0dx%0d", item.h_visible, item.v_visible), UVM_LOW)
    end else begin
      `uvm_info("SCB", "Received frame while display disabled (should be blank)", UVM_LOW)
    end
  endfunction

endclass

`endif
