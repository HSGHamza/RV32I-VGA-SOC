`ifndef VGA_SYNC_TEST_SV
`define VGA_SYNC_TEST_SV

class vga_sync_test extends vga_base_test;
  `uvm_component_utils(vga_sync_test)

  function new(string name = "vga_sync_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    // Let monitor catch syncs
    #50ms;
    phase.drop_objection(this);
  endtask

endclass

`endif
