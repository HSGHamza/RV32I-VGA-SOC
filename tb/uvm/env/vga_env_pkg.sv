`ifndef VGA_ENV_PKG_SV
`define VGA_ENV_PKG_SV

package vga_env_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import axi_lite_types_pkg::*;
  import axi_lite_pkg::*;
  import vga_pkg::*;

  `include "vga_scoreboard.sv"
  `include "vga_coverage.sv"
  `include "vga_env.sv"
endpackage

`endif
