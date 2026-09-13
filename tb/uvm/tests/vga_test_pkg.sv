`ifndef VGA_TEST_PKG_SV
`define VGA_TEST_PKG_SV

package vga_test_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import axi_lite_types_pkg::*;
  import axi_lite_pkg::*;
  import vga_pkg::*;
  import vga_env_pkg::*;

  `include "vga_base_test.sv"
  `include "vga_framebuffer_test.sv"
  `include "vga_sync_test.sv"
  `include "vga_display_toggle_test.sv"
  `include "vga_invalid_access_test.sv"

endpackage

`endif
