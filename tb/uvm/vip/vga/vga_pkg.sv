`ifndef VGA_PKG_SV
`define VGA_PKG_SV

package vga_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "vga_item.sv"
  `include "vga_monitor.sv"
  `include "vga_agent.sv"
endpackage

`endif
