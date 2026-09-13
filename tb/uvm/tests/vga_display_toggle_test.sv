`ifndef VGA_DISPLAY_TOGGLE_TEST_SV
`define VGA_DISPLAY_TOGGLE_TEST_SV

class vga_display_toggle_test extends vga_base_test;
  `uvm_component_utils(vga_display_toggle_test)

  function new(string name = "vga_display_toggle_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    axi_lite_item item;
    phase.raise_objection(this);
    
    // Sequence to enable display
    item = axi_lite_item::type_id::create("item");
    item.op = axi_lite_types_pkg::AXI_WRITE;
    item.addr = 32'h1000_0000; // CTRL Reg
    item.wdata = 32'h1; // Enable
    env.axi_agnt.sequencer.execute_item(item);
    
    #10ms;
    
    // Sequence to disable display
    item = axi_lite_item::type_id::create("item");
    item.op = axi_lite_types_pkg::AXI_WRITE;
    item.addr = 32'h1000_0000; // CTRL Reg
    item.wdata = 32'h0; // Disable
    env.axi_agnt.sequencer.execute_item(item);

    #10ms;
    phase.drop_objection(this);
  endtask

endclass

`endif
