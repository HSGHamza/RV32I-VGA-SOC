`ifndef VGA_AGENT_SV
`define VGA_AGENT_SV

class vga_agent extends uvm_agent;
  `uvm_component_utils(vga_agent)

  vga_monitor monitor;

  function new(string name = "vga_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor = vga_monitor::type_id::create("monitor", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

endclass

`endif
