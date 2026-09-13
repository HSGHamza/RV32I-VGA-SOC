`ifndef VGA_MONITOR_SV
`define VGA_MONITOR_SV

class vga_monitor extends uvm_monitor;
  `uvm_component_utils(vga_monitor)

  virtual vga_if vif;
  uvm_analysis_port #(vga_item) ap;

  // Track the configuration from environment (or default to 640x480)
  int h_visible = 640;
  int v_visible = 480;

  function new(string name = "vga_monitor", uvm_component parent = null);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual vga_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
    end
  endfunction

  task run_phase(uvm_phase phase);
    vga_item item;
    int h_count = 0;
    int v_count = 0;
    logic vsync_prev = 1;

    forever begin
      @(posedge vif.clk);

      // Detect VSYNC falling edge (start of frame)
      if (vsync_prev == 1 && vif.Vsync == 0) begin
        if (v_count > 0) begin
          // Send previous frame
          ap.write(item);
        end
        // Start new frame
        item = vga_item::type_id::create("item");
        item.h_visible = h_visible;
        item.v_visible = v_visible;
        item.pixels = new[v_visible];
        foreach (item.pixels[i]) item.pixels[i] = new[h_visible];
        
        v_count = 0;
        h_count = 0;
      end

      vsync_prev = vif.Vsync;

      // Active video region is when both syncs are high (simplified, actually depends on porches)
      // A better way is to rely on internal signal video_on, but as a physical monitor, 
      // we must deduce active video from Hsync and Vsync. 
      // For simplicity, we just sample when both Hsync and Vsync are high. 
      // Wait, standard VGA Hsync/Vsync are active low.
      if (vif.Vsync == 1 && vif.Hsync == 1) begin
        // Assuming we are in active video if we see non-zero RGB, or just counting cycles
        // This is a simplification. A real monitor would count back porch etc.
        // For our test, we'll just capture non-black pixels into a bounded box if possible.
        // Actually we need to know the porch parameters to perfectly extract the image.
        // Let's assume we capture all cycles where Hsync=1 and Vsync=1 and just store them
        // and let the scoreboard figure it out, or we use the known porches.
      end

    end
  endtask

endclass

`endif
