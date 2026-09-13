`timescale 1ns / 1ps

`ifndef AXI_LITE_IF_SV
`define AXI_LITE_IF_SV

interface axi_lite_if #(
    parameter int AXI_ADDR_WIDTH = 32,
    parameter int AXI_DATA_WIDTH = 32
)(
    input logic clk,
    input logic rst
);

  // Write Address Channel
  logic [AXI_ADDR_WIDTH-1:0]   awaddr;
  logic                        awvalid;
  logic                        awready;

  // Write Data Channel
  logic [AXI_DATA_WIDTH-1:0]   wdata;
  logic [AXI_DATA_WIDTH/8-1:0] wstrb;
  logic                        wvalid;
  logic                        wready;

  // Write Response Channel
  logic [1:0]                  bresp;
  logic                        bvalid;
  logic                        bready;

  // Read Address Channel
  logic [AXI_ADDR_WIDTH-1:0]   araddr;
  logic                        arvalid;
  logic                        arready;

  // Read Data Channel
  logic [AXI_DATA_WIDTH-1:0]   rdata;
  logic [1:0]                  rresp;
  logic                        rvalid;
  logic                        rready;

  // Passive Monitor Clocking Block
  clocking mon_cb @(posedge clk);
    default input #1step;
    input awaddr, awvalid, awready;
    input wdata, wstrb, wvalid, wready;
    input bresp, bvalid, bready;
    input araddr, arvalid, arready;
    input rdata, rresp, rvalid, rready;
  endclocking

  modport monitor(clocking mon_cb, input clk, input rst);

  // ---------------------------------------------------------------------------
  // AXI4-Lite SystemVerilog Assertions (SVA)
  // ---------------------------------------------------------------------------
  // 1. Reset Property: All master valids must be deasserted during reset
  property p_reset_valid_low;
    @(posedge clk) rst |-> (!awvalid && !wvalid && !arvalid);
  endproperty
  a_reset_valid_low: assert property (p_reset_valid_low)
    else `uvm_error("SVA_RST", "Master valid asserted during reset!");

  // 2. AWADDR Stability: AWADDR must remain stable until AWREADY is asserted
  property p_awaddr_stable;
    @(posedge clk) disable iff (rst)
    (awvalid && !awready) |=> ($stable(awaddr) && awvalid);
  endproperty
  a_awaddr_stable: assert property (p_awaddr_stable)
    else `uvm_error("SVA_AWADDR", "AWADDR changed while AWVALID was high and AWREADY low!");

  // 3. WDATA & WSTRB Stability: WDATA and WSTRB must remain stable until WREADY is asserted
  property p_wdata_stable;
    @(posedge clk) disable iff (rst)
    (wvalid && !wready) |=> ($stable(wdata) && $stable(wstrb) && wvalid);
  endproperty
  a_wdata_stable: assert property (p_wdata_stable)
    else `uvm_error("SVA_WDATA", "WDATA/WSTRB changed while WVALID was high and WREADY low!");

  // 4. ARADDR Stability: ARADDR must remain stable until ARREADY is asserted
  property p_araddr_stable;
    @(posedge clk) disable iff (rst)
    (arvalid && !arready) |=> ($stable(araddr) && arvalid);
  endproperty
  a_araddr_stable: assert property (p_araddr_stable)
    else `uvm_error("SVA_ARADDR", "ARADDR changed while ARVALID was high and ARREADY low!");

  // 5. RDATA & RRESP Stability: RDATA/RRESP must remain stable until RREADY is asserted
  property p_rdata_stable;
    @(posedge clk) disable iff (rst)
    (rvalid && !rready) |=> ($stable(rdata) && $stable(rresp) && rvalid);
  endproperty
  a_rdata_stable: assert property (p_rdata_stable)
    else `uvm_error("SVA_RDATA", "RDATA/RRESP changed while RVALID was high and RREADY low!");

  // 6. BRESP Stability: BRESP must remain stable until BREADY is asserted
  property p_bresp_stable;
    @(posedge clk) disable iff (rst)
    (bvalid && !bready) |=> ($stable(bresp) && bvalid);
  endproperty
  a_bresp_stable: assert property (p_bresp_stable)
    else `uvm_error("SVA_BRESP", "BRESP changed while BVALID was high and BREADY low!");

endinterface : axi_lite_if

`endif // AXI_LITE_IF_SV
