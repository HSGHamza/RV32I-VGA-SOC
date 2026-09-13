`ifndef VGA_INVALID_ACCESS_TEST_SV
`define VGA_INVALID_ACCESS_TEST_SV

class vga_invalid_access_test extends vga_base_test;
  `uvm_component_utils(vga_invalid_access_test)

  function new(string name = "vga_invalid_access_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    axi_lite_item item;
    phase.raise_objection(this);
    
    // Sequence to write to invalid address
    item = axi_lite_item::type_id::create("item");
    item.op = axi_lite_types_pkg::AXI_WRITE;
    item.addr = 32'hFFFF_FFFF; 
    item.wdata = 32'h0;
    env.axi_agnt.sequencer.execute_item(item);
    
    #1ms;
    
    phase.drop_objection(this);
  endtask

endclass

`endif
