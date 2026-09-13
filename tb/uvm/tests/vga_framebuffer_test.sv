`ifndef VGA_FRAMEBUFFER_TEST_SV
`define VGA_FRAMEBUFFER_TEST_SV

class vga_framebuffer_test extends vga_base_test;
  `uvm_component_utils(vga_framebuffer_test)

  function new(string name = "vga_framebuffer_test", uvm_component parent = null);
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
    
    // Write a pixel to framebuffer
    item = axi_lite_item::type_id::create("item");
    item.op = axi_lite_types_pkg::AXI_WRITE;
    item.addr = 32'h5000_0000;
    item.wdata = 32'hFFFFFFFF; // White pixel
    env.axi_agnt.sequencer.execute_item(item);

    // Wait for frames to generate
    #20ms;
    
    phase.drop_objection(this);
  endtask

endclass

`endif
