`ifndef VGA_ITEM_SV
`define VGA_ITEM_SV

class vga_item extends uvm_sequence_item;
  // A VGA item represents a captured frame
  rand int h_visible;
  rand int v_visible;

  // The actual captured pixels [y][x]
  logic [23:0] pixels[][];

  `uvm_object_utils_begin(vga_item)
    `uvm_field_int(h_visible, UVM_DEFAULT)
    `uvm_field_int(v_visible, UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name = "vga_item");
    super.new(name);
  endfunction

endclass

`endif
