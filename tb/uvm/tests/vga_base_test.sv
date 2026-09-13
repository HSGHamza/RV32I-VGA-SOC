`ifndef VGA_BASE_TEST_SV
`define VGA_BASE_TEST_SV

class vga_base_test extends uvm_test;
  `uvm_component_utils(vga_base_test)

  vga_env env;

  function new(string name = "vga_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = vga_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    // Base test just waits a bit
    #1000ns;
    phase.drop_objection(this);
  endtask

endclass

`endif
