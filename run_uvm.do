# ============================================================================
# QuestaSim / ModelSim UVM Compilation and Run Script
# ============================================================================
# To execute this script in the QuestaSim transcript, run:
#   do run_uvm.do
# ============================================================================

# 1. Create and map the work library
vlib work
vmap work work

# 2. Define Include Directories
# In SystemVerilog, `include directives need to know where to search for files.
set INCDIRS "+incdir+rtl/bus +incdir+rtl/vga +incdir+tb/uvm/vip/axi_lite +incdir+tb/uvm/vip/vga +incdir+tb/uvm/env +incdir+tb/uvm/tests"

# 3. Compile RTL Design Files (Order usually doesn't matter for basic Verilog, but good to be explicit)
echo "Compiling RTL..."
vlog -sv rtl/bus/axi_decoder.v
vlog -sv rtl/bus/axi_data_memory.v
vlog -sv rtl/vga/vga_timing.v
vlog -sv rtl/vga/pixel_addr_gen.v
vlog -sv rtl/vga/rgb_output.v
vlog -sv rtl/vga/vga_controller.v
vlog -sv rtl/vga/vga_registers.v
vlog -sv rtl/vga/framebuffer_sram.v

# 4. Compile UVM Interfaces and Packages (ORDER IS CRITICAL!)
echo "Compiling UVM Environment..."
# 4a. AXI-Lite VIP
vlog -sv $INCDIRS tb/uvm/vip/axi_lite/axi_lite_types.sv
vlog -sv $INCDIRS tb/uvm/vip/axi_lite/axi_lite_if.sv
vlog -sv $INCDIRS tb/uvm/vip/axi_lite/axi_lite_pkg.sv

# 4b. VGA VIP
vlog -sv $INCDIRS tb/uvm/vip/vga/vga_if.sv
vlog -sv $INCDIRS tb/uvm/vip/vga/vga_pkg.sv

# 4c. Assertions and Environment Package
vlog -sv $INCDIRS tb/uvm/env/vga_assertions.sv
vlog -sv $INCDIRS tb/uvm/env/vga_env_pkg.sv

# 4d. Test Package (Must be compiled AFTER environment package)
vlog -sv $INCDIRS tb/uvm/tests/vga_test_pkg.sv

# 5. Compile Top-Level Testbench (Must be compiled LAST)
echo "Compiling Top-Level Testbench..."
vlog -sv $INCDIRS tb/uvm/tb_top.sv

# 6. Load the simulation and open waveforms
echo "Loading Simulation (vga_framebuffer_test)..."
# Note: You can change vga_framebuffer_test to vga_sync_test, vga_display_toggle_test, etc.
vsim -voptargs=+acc +UVM_TESTNAME=vga_framebuffer_test tb_top

# 7. Add waveforms automatically (optional, but highly recommended)
# This assumes you want to see the VGA physical signals and AXI writes
add wave -position insertpoint sim:/tb_top/clk
add wave -position insertpoint sim:/tb_top/rst
add wave -divider "AXI-Lite Interface"
add wave -position insertpoint sim:/tb_top/m_axi_if/awaddr
add wave -position insertpoint sim:/tb_top/m_axi_if/awvalid
add wave -position insertpoint sim:/tb_top/m_axi_if/awready
add wave -position insertpoint sim:/tb_top/m_axi_if/wdata
add wave -position insertpoint sim:/tb_top/m_axi_if/wvalid
add wave -position insertpoint sim:/tb_top/m_axi_if/wready
add wave -divider "VGA Physical Outputs"
add wave -position insertpoint sim:/tb_top/vga_vif/Hsync
add wave -position insertpoint sim:/tb_top/vga_vif/Vsync
add wave -position insertpoint sim:/tb_top/vga_video_on
add wave -position insertpoint -radix hexadecimal sim:/tb_top/vga_vif/red
add wave -position insertpoint -radix hexadecimal sim:/tb_top/vga_vif/green
add wave -position insertpoint -radix hexadecimal sim:/tb_top/vga_vif/blue

# 8. Run the simulation
run -all
