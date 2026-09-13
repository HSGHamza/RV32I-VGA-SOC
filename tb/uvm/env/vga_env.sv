`ifndef VGA_ENV_SV
`define VGA_ENV_SV

class vga_env extends uvm_env;
  `uvm_component_utils(vga_env)

  axi_lite_agent   axi_agnt;
  vga_agent        vga_agnt;
  vga_scoreboard   scb;
  vga_coverage     cov;

  function new(string name = "vga_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    axi_agnt = axi_lite_agent::type_id::create("axi_agnt", this);
    vga_agnt = vga_agent::type_id::create("vga_agnt", this);
    scb = vga_scoreboard::type_id::create("scb", this);
    cov = vga_coverage::type_id::create("cov", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    // Connect AXI Agent to Scoreboard and Coverage
    axi_agnt.monitor.ap.connect(scb.axi_export);
    axi_agnt.monitor.ap.connect(cov.analysis_export);

    // Connect VGA Agent to Scoreboard
    vga_agnt.monitor.ap.connect(scb.vga_export);
  endfunction

endclass

`endif
