`ifndef VGA_COVERAGE_SV
`define VGA_COVERAGE_SV

class vga_coverage extends uvm_subscriber #(axi_lite_item);
  `uvm_component_utils(vga_coverage)

  axi_lite_item cur_item;

  covergroup cg_vga_configs;
    option.per_instance = 1;
    option.comment      = "VGA Configuration Coverage";

    // Track writes to VGA CTRL (toggle display)
    cp_vga_ctrl_write: coverpoint cur_item.addr {
      bins ctrl_reg = {32'h1000_0000};
    }
    cp_display_enable: coverpoint cur_item.wdata[0] {
      bins disabled = {0};
      bins enabled  = {1};
    }

    // Boundary Framebuffer Accesses
    cp_fb_boundary: coverpoint cur_item.addr {
      bins start_fb = {32'h5000_0000};
      bins end_fb   = {32'h5012_BFFC}; // Last word
    }

    cx_ctrl_enable: cross cp_vga_ctrl_write, cp_display_enable;
  endgroup : cg_vga_configs

  function new(string name = "vga_coverage", uvm_component parent = null);
    super.new(name, parent);
    cg_vga_configs = new();
  endfunction

  function void write(axi_lite_item t);
    if (t.op == axi_lite_types_pkg::AXI_WRITE) begin
      cur_item = t;
      cg_vga_configs.sample();
    end
  endfunction

endclass : vga_coverage

`endif
