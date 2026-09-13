## -----------------------------------------------------------------------------
## Digilent Zybo Z7-10 Pin Constraints for RV32I-AXI-VGA SoC
## Target Part: xc7z010clg400-1
## -----------------------------------------------------------------------------

## Clock Signal (125 MHz Onboard Oscillator)
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { clk }];

## Reset Button (BTN0)
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { btn0 }];

## User Status LEDs
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; # Active video
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; # CPU stall
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; # Memory write
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; # Heartbeat

## -----------------------------------------------------------------------------
## Digilent Pmod VGA (Connected to Pmod Ports JC and JD)
## -----------------------------------------------------------------------------

## Pmod Header JC: Red & Green Channels
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { vga_r[0] }]; # JC1
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { vga_r[1] }]; # JC2
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { vga_r[2] }]; # JC3
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { vga_r[3] }]; # JC4
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { vga_g[0] }]; # JC7
set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33 } [get_ports { vga_g[1] }]; # JC8
set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33 } [get_ports { vga_g[2] }]; # JC9
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { vga_g[3] }]; # JC10

## Pmod Header JD: Blue Channel & Synchronization Signals
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { vga_b[0] }]; # JD1
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { vga_b[1] }]; # JD2
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { vga_b[2] }]; # JD3
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { vga_b[3] }]; # JD4
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { vga_hs }];   # JD7
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { vga_vs }];   # JD8
