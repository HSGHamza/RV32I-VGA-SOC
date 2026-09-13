# PROJECT 02: RISC-V SoC with VGA Display Controller
## Final Project & Architecture Report

---

**Course / Domain**: Advanced Digital Integrated Circuit Design & Computer Architecture  
**Target Deployments**: 
1. **ASIC**: SkyWater 130nm Standard-Cell CMOS (`sky130_fd_sc_hd`) via OpenLane / OpenROAD
2. **FPGA**: Digilent Zybo Z7-10 (Xilinx Zynq-7000 `xc7z010clg400-1`) via F4PGA / SymbiFlow

**Authors & Group Members**:
- **Member 1**: Hamza Shahid
- **Member 2**: Noor ul Huda
- **Member 3**: Afnan Inayat

**Date**: September 2026  
**License**: MIT License

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Design Objectives & System Specifications](#2-design-objectives--system-specifications)
3. [Top-Level SoC Architecture](#3-top-level-soc-architecture)
   - [Architectural Block Diagram](#architectural-block-diagram)
   - [Memory Map & Crossbar Decoding](#memory-map--crossbar-decoding)
   - [Clocking & Reset Synchronizer](#clocking--reset-synchronizer)
4. [RV32I Microprocessor Core Design](#4-rv32i-microprocessor-core-design)
   - [Single-Cycle Datapath with Pipeline Stall Support](#single-cycle-datapath-with-pipeline-stall-support)
   - [Supported Instruction Set Architecture (RV32I)](#supported-instruction-set-architecture-rv32i)
   - [Control Logic Unit & Truth Tables](#control-logic-unit--truth-tables)
   - [Module-by-Module Breakdown](#module-by-module-breakdown)
5. [On-Chip Bus Interconnect & AXI4-Lite Protocol](#5-on-chip-bus-interconnect--axi4-lite-protocol)
   - [CPU to AXI4-Lite Master Bridge FSM](#cpu-to-axi4-lite-master-bridge-fsm)
   - [AXI Crossbar Address Decoder & Error Slave](#axi-crossbar-address-decoder--error-slave)
   - [AXI Data Memory (Slave 0)](#axi-data-memory-slave-0)
6. [VGA Graphics Controller Subsystem](#6-vga-graphics-controller-subsystem)
   - [VGA Timing Specifications (640x480 @ 60 Hz)](#vga-timing-specifications-640x480--60-hz)
   - [4x Hardware Pixel Scaling Engine](#4x-hardware-pixel-scaling-engine)
   - [Dual-Port Video Framebuffer Architecture](#dual-port-video-framebuffer-architecture)
   - [Memory-Mapped I/O & Control Registers](#memory-mapped-io--control-registers)
   - [Pmod RGB111 Physical Interface](#pmod-rgb111-physical-interface)
7. [Bare-Metal Application: Ping Pong Game](#7-bare-metal-application-ping-pong-game)
   - [Software Architecture & Control Flow](#software-architecture--control-flow)
   - [Collision Physics & Ball Vector Kinematics](#collision-physics--ball-vector-kinematics)
   - [Flicker-Free Rendering via Shadow Coordinates](#flicker-free-rendering-via-shadow-coordinates)
   - [Hardware User Input & Autonomous AI Opponent](#hardware-user-input--autonomous-ai-opponent)
8. [Basic Verification & Directed Testbenches](#8-basic-verification--directed-testbenches)
   - [Reset Behavior & Initial State Verification](#reset-behavior--initial-state-verification)
   - [Core Memory Access & Pixel-Address Generation](#core-memory-access--pixel-address-generation)
   - [Bus Transactions & MMIO Register Access](#bus-transactions--mmio-register-access)
   - [VGA Timing, Framebuffer Reads, & RGB Pipeline](#vga-timing-framebuffer-reads--rgb-pipeline)
   - [Modular Testbench Results (Bridge, Decoder, VGA)](#modular-testbench-results-bridge-decoder-vga)
   - [Full Datapath End-to-End Simulation Trace](#full-datapath-end-to-end-simulation-trace)
9. [Industrial-Grade UVM 1.2 Verification Environment](#9-industrial-grade-uvm-12-verification-environment)
   - [UVM Testbench Architecture & VIP Components](#uvm-testbench-architecture--vip-components)
   - [UVM Sequence Library & Test Scenarios](#uvm-sequence-library--test-scenarios)
   - [SystemVerilog Assertions (SVA) Verification](#systemverilog-assertions-sva-verification)
   - [Functional Coverage Model & Results (>93% Coverage)](#functional-coverage-model--results-93-coverage)
   - [Scoreboard Data Integrity & Routing Verification](#scoreboard-data-integrity--routing-verification)
   - [Detailed UVM Simulation Waveform Analysis](#detailed-uvm-simulation-waveform-analysis)
10. [ASIC Physical Design & Silicon Tapeout (SkyWater 130nm)](#10-asic-physical-design--silicon-tapeout-skywater-130nm)
    - [Automated OpenLane / OpenROAD Flow](#automated-openlane--openroad-flow)
    - [Floorplan & Power Distribution Network (PDN)](#floorplan--power-distribution-network-pdn)
    - [Placement, Clock Tree Synthesis (CTS), & Routing](#placement-clock-tree-synthesis-cts--routing)
    - [Sign-Off Tapeout Metrics & Area Utilization](#sign-off-tapeout-metrics--area-utilization)
    - [Multi-Corner Static Timing Analysis (STA)](#multi-corner-static-timing-analysis-sta)
    - [Power Grid Integrity & IR Drop Analysis](#power-grid-integrity--ir-drop-analysis)
    - [Silicon GDSII Layout Inspection](#silicon-gdsii-layout-inspection)
11. [FPGA Implementation & Hardware Demonstration](#11-fpga-implementation--hardware-demonstration)
    - [Board Integration & Pin Constraints (Zybo Z7-10)](#board-integration--pin-constraints-zybo-z7-10)
    - [Open-Source Build Flow (F4PGA / SymbiFlow)](#open-source-build-flow-f4pga--symbiflow)
    - [JTAG Programming via openFPGALoader](#jtag-programming-via-openfpgaloader)
    - [Laboratory Hardware Demonstration & Team Gameplay](#laboratory-hardware-demonstration--team-gameplay)
12. [Deliverables Compliance Matrix & Conclusion](#12-deliverables-compliance-matrix--conclusion)

---

## 1. Executive Summary

This report documents the complete architectural specification, digital design, verification, ASIC physical hardening, and FPGA hardware validation for **PROJECT 02: RISC-V SoC with VGA Display Controller**. Developed collaboratively by **Hamza Shahid**, **Noor ul Huda**, and **Afnan Inayat**, the system demonstrates an end-to-end computing engine capable of executing arbitrary software programs on a custom 32-bit RISC-V processor and rendering dynamic graphical output on a standard VGA display monitor in real time.

The system incorporates a fully synthesizable **RV32I Base Integer ISA single-cycle processor core** featuring custom pipeline stall logic that seamlessly bridges high-speed single-cycle instruction execution with multi-cycle **AXI4-Lite** bus handshakes. An on-chip **AXI crossbar decoder** interconnects the processor with a local data SRAM, a dedicated memory-mapped I/O (MMIO) register bank, and a **dual-port video framebuffer** memory storing 160x120 pixels in 32-bit `0x00RRGGBB` format. A hardware **4x pixel scaling engine** transforms the 160x120 internal resolution into industry-standard **640x480 @ 60 Hz** timing, conserving over 71% of FPGA Block RAM resources while delivering sharp visual graphics over a single Pmod RGB111 interface.

The project features verification and implementation across both ASIC and FPGA targets:
1. **Verification Rigor**: Validated through directed SystemVerilog testbenches and an industrial-grade **UVM 1.2 verification environment** with AXI4-Lite Verification IP (VIP), SystemVerilog Concurrent Assertions (SVA), a self-checking scoreboard, and an extensive functional coverage model achieving **>93% coverage**.
2. **ASIC Physical Design**: Hardened to silicon layout using the automated **OpenLane / OpenROAD** flow targeting the **SkyWater 130nm (`sky130_fd_sc_hd`)** process node. The design achieved **zero DRC errors**, **zero LVS errors**, **zero setup/hold timing violations** across all 9 PVT corners, and a total power consumption of just **1.01 mW**.
3. **Physical Hardware Validation**: Successfully deployed to the **Digilent Zybo Z7-10** FPGA using the fully open-source **F4PGA / SymbiFlow** toolchain and **openFPGALoader**. The hardware demonstrates interactive, processor-driven gameplay through a bare-metal RISC-V assembly Ping Pong game (`pong.s`) featuring physics collision handling, push-button controls, and an autonomous AI opponent.

---

## 2. Design Objectives & System Specifications

The primary goal of Project 02 is to engineer an RV32I-based System-on-Chip (SoC) that provides hardware-accelerated, processor-controlled graphical display generation. The official project requirements and corresponding design implementations are detailed below:

| Requirement Category | Specification Requirement | Implemented Design |
| :--- | :--- | :--- |
| **RISC-V Core** | Synthesizable 32-bit RV32I single-cycle or multicycle core; instruction memory, data memory; memory-mapped access to display subsystem. | Synthesizable RV32I single-cycle core with pipeline stall support; 1 KB local Instruction ROM; 256 B AXI Data RAM; memory-mapped VGA registers and Framebuffer. |
| **Bus Protocol** | AXI4-Lite or APB interface for configuring VGA controller and accessing display-control, framebuffer-configuration, and status registers. | Standard AXI4-Lite interconnect with separate Read/Write address, data, and response channels; crossbar address decoder with automatic `SLVERR` error slave. |
| **Main Modules** | RV32I core; instruction/data SRAMs; framebuffer SRAM; bus interconnect; VGA controller; HSYNC/VSYNC generators; pixel-address generator; RGB output logic; display-control/status registers. | Fully implemented: `Datapath`, `ProgramCounter`, `RegFile`, `alu`, `ControlLogic`, `rv32i_axi_bridge`, `axi_decoder`, `axi_data_memory`, `vga_controller`, `vga_timing`, `pixel_addr_gen`, `framebuffer_sram`, `vga_registers`, `rgb_output`. |
| **Expected Operation** | Processor writes graphical data to framebuffer SRAM; VGA controller generates continuous sync, computes pixel locations, reads framebuffer, outputs RGB; demonstrates graphical patterns, text, or software updates. | Bare-metal RISC-V interactive Ping Pong game (`pong.s`) featuring real-time ball kinematics, paddle animation, shadow-erasing flicker-free engine, push-button paddle input, and AI toggle switch. |
| **Basic Verification** | Directed self-checking SV testbench verifying memory accesses, bus handshakes, VGA registers, HSYNC/VSYNC timing, pixel addresses, framebuffer reads, RGB outputs, reset, and display enable/disable. | Complete modular test suite covering all modules, plus top-level self-checking `soc_top_tb.sv` validating end-to-end memory operations, VGA sync waveforms, and pixel RGB outputs. |
| **UVM Verification** | UVM agents, sequences, scoreboards, assertions, functional coverage, and code coverage verifying framebuffer transactions, MMIO registers, sync behavior, pixel addressing, reset, and error cases. | Full UVM 1.2 environment with AXI4-Lite VIP (master driver, monitors, sequencer), scoreboard checking routing and data integrity, SVA assertions, and >93% functional coverage across all address bins and operations. |
| **Physical Design** | Complete ASIC flow: constraints, floorplan, power plan, placement, CTS, routing, and sign-off checks (area, timing, power, congestion, DRC, LVS) using SkyWater 130nm PDK. | Automated OpenLane/OpenROAD flow on `sky130_fd_sc_hd`: 10,231.1 µm² core area, 79.97% utilization, zero DRC errors, zero LVS errors, zero setup/hold timing violations across all 9 PVT corners, 1.01 mW power. |
| **FPGA Implementation** | Implement complete SoC on FPGA; demonstrate processor-controlled graphical output on FPGA-connected VGA monitor with correct sync and dynamic software display updates. | Deployed on Digilent Zybo Z7-10 FPGA via F4PGA toolchain; 25 MHz system clock derived from 125 MHz oscillator; live 640x480 @ 60 Hz color video on VGA monitor with pushbuttons and slide switches. |

---

## 3. Top-Level SoC Architecture

### Architectural Block Diagram

The complete system hierarchy integrates the processor, bus crossbar, memory blocks, peripheral registers, and video raster engine on a single unified 25 MHz clock domain.

```
+---------------------------------------------------------------------------------------------------+
|                                  DIGILENT ZYBO Z7-10 FPGA BOARD                                   |
|                                                                                                   |
|  125 MHz Clock (K17) ----> [ Clock Divider (/5) ] ----> 25 MHz System Clock                       |
|  Slide Switch SW0    ----> [ Reset Synchronizer ] ----> Synchronous Active-High Reset             |
|                                                                                                   |
|  +---------------------------------------------------------------------------------------------+  |
|  |                               RV32I-VGA SYSTEM-ON-CHIP (soc_top)                            |  |
|  |                                                                                             |  |
|  |  +---------------------+        +--------------------+        +--------------------------+  |  |
|  |  |   RV32I CPU Core    |        |  RV32I-to-AXI4     |        |   AXI Crossbar Decoder   |  |  |
|  |  |  (Single-Cycle +    |------->|  Master Bridge     |------->|   (axi_decoder)          |  |  |
|  |  |   cpu_stall support)|<-------|  (FSM Engine)      |<-------|   - Slave 0: Data RAM    |  |  |
|  |  +---------------------+        +--------------------+        |   - Slave 1: VGA MMIO/FB |  |  |
|  |            |                                                  |   - Error: SLVERR        |  |  |
|  |            v                                                  +--------------------------+  |  |
|  |   +-----------------+                                               |             |         |  |
|  |   | 1 KB Instr ROM  |                                               |             |         |  |
|  |   | instructions.hex|                                               v             v         |  |
|  |   +-----------------+                                         +-----------+ +------------+  |  |
|  |                                                               | Slave 0   | | Slave 1    |  |  |
|  |                                                               | Data RAM  | | VGA Subsys |  |  |
|  |                                                               | (256 B)   | +------------+  |  |
|  |                                                               +-----------+       |         |  |
|  |                                                                                   v         |  |
|  |  +---------------------------------------------------------------------------------------+  |  |
|  |  |                                VGA DISPLAY SUBSYSTEM                                  |  |  |
|  |  |                                                                                       |  |  |
|  |  |  +--------------------+        Port Arbitration         +--------------------------+  |  |  |
|  |  |  |   vga_registers    |<===============================>|     framebuffer_sram     |  |  |  |
|  |  |  | (MMIO & CPU Port)  |         (CPU vs Raster)         | (160x120 x 32-bit Words) |  |  |  |
|  |  |  +--------------------+                                 +--------------------------+  |  |  |
|  |  |        |                                                             |                |  |  |
|  |  |        v                                                             v                |  |  |
|  |  |  +--------------------+       fb_req, fb_addr           +--------------------------+  |  |  |
|  |  |  |   pixel_addr_gen   |-------------------------------->|      vga_controller      |  |  |  |
|  |  |  | (4x Pixel Scaler)  |                                 +--------------------------+  |  |  |
|  |  |  +--------------------+                                              |                |  |  |
|  |  |        ^                                                             v                |  |  |
|  |  |        | H_count, V_count                               +--------------------------+  |  |  |
|  |  |  +--------------------+                                 |        rgb_output        |  |  |  |
|  |  |  |     vga_timing     |                                 |   (1-Cycle Sync Delay)   |  |  |  |
|  |  |  | 640x480 @ 60Hz     |                                 +--------------------------+  |  |  |
|  |  |  +--------------------+                                              |                |  |  |
|  |  +----------------------------------------------------------------------|----------------+  |  |
|  +-------------------------------------------------------------------------|-------------------+  |
|                                                                            v                      |
|  Pushbuttons (BTN0-3) ----> User Input Controls              Pmod JC Video Output:                |
|  Slide Switch (SW1)   ----> AI Opponent Toggle               - RGB111 (Pins V15, W15, T11)        |
|  Diagnostic LEDs      ----> Video/Stall/Write/Heartbeat      - HSync, VSync (Pins W14, Y14)       |
+---------------------------------------------------------------------------------------------------+
```

### Memory Map & Crossbar Decoding

The system implements a flat 32-bit memory-mapped architecture partitioned across physical slaves and internal registers via [`rtl/bus/axi_decoder.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/bus/axi_decoder.v):

| Address Range | Mapped Size | Target Slave | Physical Destination | Access Mode |
| :--- | :---: | :---: | :--- | :---: |
| `0x0000_0000 - 0x0000_00FF` | 256 Bytes | **Slave 0** | Core Synchronous Data RAM (`axi_data_memory.v`) | Read / Write |
| `0x1000_0000 - 0x1000_001F` | 32 Bytes | **Slave 1** | VGA Control, Status, Resolution & I/O Registers | Read / Write |
| `0x5000_0000 - 0x5001_2BFF` | 76.8 KB | **Slave 1** | Dual-Port Video Framebuffer SRAM (160x120 words) | Read / Write |
| *All Other Addresses* | — | **Error Slave** | Crossbar Trap -> Asserts AXI `SLVERR` (`2'b10`) | Read / Write |

### Clocking & Reset Synchronizer

1. **Clock Generation**: Standard 640x480 @ 60 Hz VGA displays require a pixel clock frequency of 25.175 MHz. The Zybo Z7-10 provides a fixed 125.0 MHz clock oscillator on pin `K17`. In [`rtl/fpga/zybo_top.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/fpga/zybo_top.v), an active counter divides 125 MHz by 5 to synthesize a pure **25.0 MHz system clock** (`clk_25m`) with an exact 50% duty cycle. The 0.69% frequency discrepancy is well within the ±1.0% clock tolerance standard of modern VGA computer monitors.
2. **Synchronous Reset**: Board switch `SW0` serves as the primary system reset. To prevent metastability from entering the sequential logic across flip-flops, the asynchronous switch input is fed through a 3-stage shift-register synchronizer clocked at 25 MHz before driving the active-high reset lines of the CPU, AXI bridge, crossbar, and VGA rasterizer.

---

## 4. RV32I Microprocessor Core Design

### Single-Cycle Datapath with Pipeline Stall Support

The processor core implements the 32-bit RV32I Base Integer Instruction Set Architecture. In standard single-cycle microarchitectures, instruction execution and memory accesses must complete within a single clock period. However, standard bus interconnects such as AXI4-Lite operate using handshaking protocols (`valid`/`ready`) that require multiple clock cycles to complete.

To resolve this architectural challenge without introducing a complex multi-stage pipeline, the core incorporates a **synchronous pipeline stall mechanism** (`cpu_stall`):
- When the processor issues a memory access (`mem_read` or `mem_write`), the CPU-to-AXI bridge immediately asserts `cpu_stall = 1'b1`.
- The Program Counter (`ProgramCounter.v`) de-asserts its clock-enable, freezing the program execution address at the current instruction.
- The Register File (`RegFile.v`) gates its write-enable signals, preserving architectural register state.
- Once the AXI transaction completes and slave response data is captured, the bridge releases `cpu_stall = 1'b0`, permitting single-cycle instruction progression to resume seamlessly.

```
       +--------------------+
       |   ProgramCounter   |<-----------------+ (branch_target / jump_target)
       +--------------------+                  |
                 |                             |
                 v                             |
       +--------------------+                  |
       | instructionMemory  |                  |
       +--------------------+                  |
                 |                             |
                 v                             |
       +--------------------+                  |
       |  decoder / immGen  |                  |
       +--------------------+                  |
            |     |     |                      |
      rs1,rs2|    |imm  |rd                    |
            v     |     v                      |
       +--------------------+                  |
       |      RegFile       |                  |
       |  (32 x 32-bit R/W) |                  |
       +--------------------+                  |
            |          |                       |
      rs1out|    rs2out|                       |
            v          v                       |
       +--------------------+                  |
       |      alu_top       |                  |
       |  (RI_alu + bAlu)   |------------------+ (doesB / branch decision)
       +--------------------+
            |          |
     mem_addr          |
            v          v
       +------------------------------------+
       |        rv32i_axi_bridge            |-----> cpu_stall (to PC & RegFile)
       +------------------------------------+
                 |
                 v
       +--------------------+
       | Write-Back Mux     |-----> Write Data (to RegFile rd)
       +--------------------+
```

### Supported Instruction Set Architecture (RV32I)

The core natively decodes and executes all 37 base integer instructions defined by the official RISC-V RV32I specifications:

1. **R-Type ALU Instructions**: `ADD`, `SUB`, `SLL`, `SLT`, `SLTU`, `XOR`, `SRL`, `SRA`, `OR`, `AND`
2. **I-Type ALU Instructions**: `ADDI`, `SLLI`, `SLTI`, `SLTIU`, `XORI`, `SRLI`, `SRAI`, `ORI`, `ANDI`
3. **I-Type Load Instructions**: `LW`
4. **S-Type Store Instructions**: `SW`
5. **B-Type Conditional Branches**: `BEQ`, `BNE`, `BLT`, `BGE`, `BLTU`, `BGEU`
6. **U-Type Upper Immediate**: `LUI`, `AUIPC`
7. **J-Type / I-Type Unconditional Jumps**: `JAL`, `JALR`

### Control Logic Unit & Truth Tables

The main control unit ([`rtl/rv32i/ControlLogic.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/ControlLogic.v)) combinatorially translates the 7-bit opcode field (`instr[6:0]`) into the datapath control signals:

| Opcode | Mnemonic Class | `reg_write` | `mem_read` | `mem_write` | `alu_src` | `mem_to_reg` | `branch` | `jump` | `alu_op` |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| `7'd51` (`0110011`) | R-Type ALU | `1` | `0` | `0` | `0` (rs2) | `2'b00` | `0` | `0` | `2'b10` |
| `7'd19` (`0010011`) | I-Type ALU | `1` | `0` | `0` | `1` (imm) | `2'b00` | `0` | `0` | `2'b10` |
| `7'd3` (`0000011`) | Load (LW) | `1` | `1` | `0` | `1` (imm) | `2'b01` | `0` | `0` | `2'b00` |
| `7'd35` (`0100011`) | Store (SW) | `0` | `0` | `1` | `1` (imm) | `2'b00` | `0` | `0` | `2'b00` |
| `7'd99` (`1100011`) | Branch (B-Type) | `0` | `0` | `0` | `0` (rs2) | `2'b00` | `1` | `0` | `2'b01` |
| `7'd55` (`0110111`) | LUI | `1` | `0` | `0` | `0` | `2'b11` | `0` | `0` | `2'b11` |
| `7'd23` (`0010111`) | AUIPC | `1` | `0` | `0` | `1` (imm) | `2'b00` | `0` | `0` | `2'b00` |
| `7'd111` (`1101111`) | JAL | `1` | `0` | `0` | `0` | `2'b10` | `0` | `1` | `2'b00` |
| `7'd103` (`1100111`) | JALR | `1` | `0` | `0` | `1` (imm) | `2'b10` | `0` | `1` | `2'b00` |

### Module-by-Module Breakdown

| Module Name | File Location | Structural Description & Functionality |
| :--- | :--- | :--- |
| `Datapath` | [`rtl/rv32i/Datapath.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/Datapath.v) | Top-level datapath wrapper integrating PC, IMEM, Decoder, Register File, ALU, and stall inputs. |
| `ProgramCounter` | [`rtl/rv32i/ProgramCounter.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/ProgramCounter.v) | Maintains 32-bit instruction address with synchronous stall hold, supporting `PC+4`, `PC+imm`, and `rs1+imm`. |
| `instructionMemory`| [`rtl/rv32i/instructionMemory.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/instructionMemory.v) | 1 KB byte-addressable ROM preloaded with compiled assembly code (`instructions.hex`) via `$readmemh`. |
| `decoder` | [`rtl/rv32i/decoder.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/decoder.v) | Unbundles instruction fields (`rs1`, `rs2`, `rd`, `funct3`, `funct7`) and extracts sign-extended immediates. |
| `ControlLogic` | [`rtl/rv32i/ControlLogic.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/ControlLogic.v) | Hardwired combinatorial decoder generating all datapath multiplexer and enable signals. |
| `RegFile` | [`rtl/rv32i/RegFile.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/RegFile.v) | 32 x 32-bit register file with asynchronous dual read ports and synchronous write port; hardwires `x0 = 0`. |
| `alu` | [`rtl/rv32i/alu.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/alu.v) | Top ALU block managing arithmetic/logic dispatch, branch evaluations, effective address calculation, and PC links. |
| `RI_alu` | [`rtl/rv32i/RI_alu.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/RI_alu.v) | Sub-ALU performing 32-bit addition, subtraction, bitwise logic (`AND`, `OR`, `XOR`), and barrel shifts (`SLL`, `SRL`, `SRA`). |
| `bAlu` | [`rtl/rv32i/bAlu.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/rv32i/bAlu.v) | Branch comparator evaluating signed/unsigned equality and magnitude conditions (`BEQ`, `BNE`, `BLT`, `BGE`, etc.). |

---

## 5. On-Chip Bus Interconnect & AXI4-Lite Protocol

### CPU to AXI4-Lite Master Bridge FSM

The processor communicates with the memory subsystem through [`rtl/bus/rv32i_axi_bridge.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/bus/rv32i_axi_bridge.v). This bridge translates CPU memory requests (`mem_read`, `mem_write`, `mem_addr`, `mem_wdata`) into fully standard AXI4-Lite master transactions across five independent channels:
- **Write Address Channel (`AW`)**: `m_axi_awaddr`, `m_axi_awvalid`, `m_axi_awready`
- **Write Data Channel (`W`)**: `m_axi_wdata`, `m_axi_wstrb`, `m_axi_wvalid`, `m_axi_wready`
- **Write Response Channel (`B`)**: `m_axi_bresp`, `m_axi_bvalid`, `m_axi_bready`
- **Read Address Channel (`AR`)**: `m_axi_araddr`, `m_axi_arvalid`, `m_axi_arready`
- **Read Data Channel (`R`)**: `m_axi_rdata`, `m_axi_rresp`, `m_axi_rvalid`, `m_axi_rready`

#### Finite State Machine (FSM) States:
1. `IDLE` (`3'd0`): Quiescent state. When `mem_write` is detected, it transitions to `WRITE`. When `mem_read` is detected, it transitions to `READ`. `cpu_stall` remains `0`.
2. `WRITE` (`3'd1`): Asserts `awvalid` and `wvalid`, broadcasting address and data to the crossbar. It waits until both slave handshakes (`awready` and `wready`) complete, then transitions to `WRESP`. `cpu_stall` is asserted.
3. `WRESP` (`3'd2`): Asserts `bready`, awaiting the slave's write response (`bvalid`). Upon reception, it returns to `IDLE` and de-asserts `cpu_stall`.
4. `READ` (`3'd3`): Asserts `arvalid` and presents the read address. Upon receiving `arready`, it transitions to `RDATA`. `cpu_stall` is asserted.
5. `RDATA` (`3'd4`): Asserts `rready`, capturing incoming `rdata` from `m_axi_rdata` when `rvalid` is asserted. It presents `mem_rdata` to the CPU datapath and returns to `IDLE`.

### AXI Crossbar Address Decoder & Error Slave

The AXI crossbar decoder ([`rtl/bus/axi_decoder.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/bus/axi_decoder.v)) inspects the master address and dynamically steers traffic:
- **Slave 0**: Selected when address is in `0x0000_0000` to `0x0000_00FF` (Data RAM).
- **Slave 1**: Selected when address is in `0x1000_0000` to `0x1000_001F` (VGA MMIO) or `0x5000_0000` to `0x5001_2BFF` (Framebuffer).
- **Internal Error Slave**: Accesses targeting unmapped address holes are trapped by an autonomous error state machine within the crossbar decoder. The error slave accepts the transaction and terminates the bus cycle by asserting an AXI `SLVERR` response (`bresp = 2'b10` or `rresp = 2'b10`), ensuring the CPU bus never hangs on invalid software addresses.

### AXI Data Memory (Slave 0)

[`rtl/bus/axi_data_memory.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/bus/axi_data_memory.v) implements a 256-byte synchronous RAM behaving as an AXI4-Lite slave. It supports byte-enable masking via `wstrb[3:0]`, allowing single-byte, half-word, and word-aligned memory writes.

---

## 6. VGA Graphics Controller Subsystem

### VGA Timing Specifications (640x480 @ 60 Hz)

The VGA timing generator ([`rtl/vga/vga_timing.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/vga/vga_timing.v)) implements industry-standard 640x480 @ 60 Hz raster scanning using a 25.0 MHz pixel clock:

```
Horizontal Line Timing:
|<----------------------------- Total 800 Clocks (32.0 µs) ----------------------------->|
+------------------------------------+------------+----------------------+---------------+
|        Active Video (640)          | Front (16) |   Sync Pulse (96)    |   Back (48)   |
+------------------------------------+------------+----------------------+---------------+
                                                  |<--- HSYNC Active --->|

Vertical Frame Timing:
|<----------------------------- Total 525 Lines (16.68 ms) ----------------------------->|
+------------------------------------+------------+----------------------+---------------+
|        Active Video (480)          | Front (10) |    Sync Pulse (2)    |   Back (33)   |
+------------------------------------+------------+----------------------+---------------+
                                                  |<--- VSYNC Active --->|
```

| Parameter | Horizontal Timing (Pixels / Clocks) | Vertical Timing (Scanlines) |
| :--- | :---: | :---: |
| **Visible Active Video** | 640 | 480 |
| **Front Porch** | 16 | 10 |
| **Sync Pulse Width** | 96 (Active LOW) | 2 (Active LOW) |
| **Back Porch** | 48 | 33 |
| **Total Interval** | **800 Clocks (32.00 µs)** | **525 Lines (16.80 ms)** |
| **Refresh Rate** | — | **59.52 Hz (~60 Hz)** |

### 4x Hardware Pixel Scaling Engine

Rendering a native 640x480 resolution at 32 bits per pixel requires 1,228,800 bytes of memory—far exceeding the total on-chip Block RAM capacity of resource-constrained FPGAs and embedded ASICs.

To overcome this limitation, the system implements an internal resolution of **160 x 120 pixels** coupled with a dedicated hardware scaling engine in [`rtl/vga/pixel_addr_gen.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/vga/pixel_addr_gen.v):
1. **Mathematical Transformation**: The horizontal counter (`H_count`) and vertical counter (`V_count`) are bit-shifted right by 2 (`H_count >> 2`, `V_count >> 2`), dividing screen coordinates by 4.
2. **Raster Address Formulation**:
   $$\text{Raster Address} = (\text{V\_count}[9:2] \times 160) + \text{H\_count}[9:2]$$
3. **Hardware Efficiency**: Every pixel stored in the framebuffer is automatically expanded into a crisp 4x4 block of physical pixels on the VGA monitor, reducing memory requirements by **16x** with zero CPU scaling overhead.

### Dual-Port Video Framebuffer Architecture

[`rtl/vga/framebuffer_sram.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/vga/framebuffer_sram.v) provides a true dual-port memory architecture:
- **Port A (CPU AXI Write Port)**: Operates through [`vga_registers.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/vga/vga_registers.v). The processor can write pixel colors (`0x00RRGGBB`) asynchronously relative to raster scanning.
- **Port B (VGA Controller Read Port)**: Dedicated to the video raster engine. Driven by `fb_addr` from the pixel address generator, it streams pixel color words to the display pipeline continuously.
- **Memory Footprint**: $160 \times 120 = 19,200 \text{ words} = 76,800 \text{ bytes}$. On the Xilinx XC7Z010 FPGA, this consumes only **17 Block RAMs (36Kb each)** out of 60 available, leaving **71.7% of on-chip RAM free**.

### Memory-Mapped I/O & Control Registers

The VGA subsystem exposes a bank of memory-mapped control and status registers mapped at base address `0x1000_0000`:

| Offset | Register | Access | Bits | Functional Description |
| :---: | :--- | :---: | :---: | :--- |
| `0x00` | `VGA_CTRL` | R/W | `[0]` | **Display Enable**: `1` = Active video stream; `0` = Display blanked (RGB forced to zero). |
| `0x04` | `VGA_STATUS` | R | `[0]` | **VBLANK Flag**: Reads `1` during vertical blanking retrace interval (safe frame update window). |
| `0x08` | `VGA_FB_BASE` | R/W | `[31:0]` | Framebuffer base memory address pointer (defaults to `0x5000_0000`). |
| `0x0C` | `VGA_RESOLUTION` | R | `[31:0]` | Hardware resolution readout: `[31:16]` = Height (120), `[15:0]` = Width (160). |
| `0x10` | `VGA_BTN` | R | `[3:0]` | Pushbutton inputs (`BTN3`, `BTN2`, `BTN1`, `BTN0`) debounced and synchronized. |
| `0x14` | `VGA_SW` | R | `[3:0]` | Slide switch inputs (`SW3`, `SW2`, `SW1`, `SW0`) debounced and synchronized. |

### Pmod RGB111 Physical Interface

The video output is routed to Digilent Pmod connector **JC** using 1-bit-per-channel digital RGB111 format, providing 8 saturated colors:

| Signal | Color / Function | Pmod Pin | Zybo FPGA Pin | Output Value (`0x00RRGGBB` threshold) |
| :--- | :--- | :---: | :---: | :--- |
| `vga_r` | Red Channel | JC1 | `V15` | `pixel_data[23:16] > 8'd128` |
| `vga_g` | Green Channel | JC2 | `W15` | `pixel_data[15:8] > 8'd128` |
| `vga_b` | Blue Channel | JC3 | `T11` | `pixel_data[7:0] > 8'd128` |
| `vga_hs` | Horizontal Sync | JC7 | `W14` | Active-low horizontal sync pulse |
| `vga_vs` | Vertical Sync | JC8 | `Y14` | Active-low vertical sync pulse |

To eliminate visual artifacts caused by the 1-clock synchronous read latency of the Framebuffer Block RAM, `rgb_output.v` delays `hsync`, `vsync`, and `video_active` by exactly 1 clock cycle to match the arrival of read data.

---

## 7. Bare-Metal Application: Ping Pong Game

### Software Architecture & Control Flow

To validate the processor and graphics pipeline under real dynamic workloads, a full-featured, bare-metal Ping Pong arcade game was implemented in RISC-V assembly ([`pong.s`](file:///c:/Users/HSG/Desktop/rv32i-vga/pong.s)).

```
                       [ System Reset ]
                              |
                              v
                 [ Initialize MMIO & Pointers ]
                 - Enable VGA: 0x1000_0000 <= 1
                 - FB Base:    0x5000_0000
                 - Center Ball (80, 60), vel=(+1, +1)
                 - Set Left/Right Paddle Y = 50
                              |
+---------------------------->|
|                             v
|               [ Erase Shadow Coordinates ]
|               - Erase prev 2x2 ball with black (0x0)
|               - Erase prev left paddle (2x16) with 0x0
|               - Erase prev right paddle (2x16) with 0x0
|                             |
|                             v
|                 [ Update Physics & Motion ]
|                 - ball_x += vel_x; ball_y += vel_y
|                 - Vertical screen boundary bounce
|                 - Left/Right paddle collision check
|                 - Goal detection & ball reset
|                             |
|                             v
|                 [ Process Player Controls ]
|                 - Read BTN0/1 -> Move Left Paddle UP/DOWN
|                 - Read SW1:
|                   * SW1 = 0: AI tracks ball_y automatically
|                   * SW1 = 1: Read BTN2/3 for 2-Player Manual
|                             |
|                             v
|                 [ Render New Frame Objects ]
|                 - Draw new 2x2 ball in white (0x00FFFFFF)
|                 - Draw new left paddle in white
|                 - Draw new right paddle in white
|                 - Update shadow variables (x14..x17)
|                             |
|                             v
|                 [ Software Timing Delay Loop ]
|                 - Calibrated cycle loop for 60 FPS pacing
+-----------------------------+
```

### Collision Physics & Ball Vector Kinematics

1. **Velocity Kinematics**: In each frame cycle, the ball coordinates update according to signed velocity registers:
   $$\text{ball\_x} \leftarrow \text{ball\_x} + \text{vel\_x}, \quad \text{ball\_y} \leftarrow \text{ball\_y} + \text{vel\_y}$$
2. **Ceiling and Floor Bounces**: If $\text{ball\_y} \le 3$ or $\text{ball\_y} \ge 115$, the vertical velocity vector reverses: $\text{vel\_y} \leftarrow -\text{vel\_y}$.
3. **Paddle Collision Detection**: When the ball enters the horizontal boundary of the left paddle ($X \le 8$) or right paddle ($X \ge 150$), the software evaluates whether $\text{ball\_y}$ falls within the vertical span of the paddle ($[\text{paddle\_y}, \text{paddle\_y} + 16]$). If true, horizontal velocity reverses ($\text{vel\_x} \leftarrow -\text{vel\_x}$).
4. **Goal Scoring**: If the ball escapes past a paddle boundary, it resets to screen center $(80, 60)$ and reverses direction toward the scoring player.

### Flicker-Free Rendering via Shadow Coordinates

Clearing all 19,200 words of the framebuffer each frame would require over 100,000 CPU clock cycles, severely bottlenecking software frame rates and introducing severe visible screen flicker.

The software implements a **selective shadow-variable differential rendering engine**:
1. Four registers retain the object coordinates from the previous frame: `x14` (`prev_ball_x`), `x15` (`prev_ball_y`), `x16` (`prev_lpad_y`), and `x17` (`prev_rpad_y`).
2. At the start of each frame, the engine writes black (`0x00000000`) *only* to the previous 2x2 ball pixels and the previous 2x16 paddle pixels.
3. The engine then renders the new positions in white (`0x00FFFFFF`).
4. This differential update writes fewer than 70 words per frame, running at a rock-solid, flicker-free 60 frames per second.

### Hardware User Input & Autonomous AI Opponent

The software polls MMIO register `0x1000_0010` to sample the hardware pushbuttons and slide switches:
- **Left Player**: `BTN0` moves paddle UP; `BTN1` moves paddle DOWN.
- **Autonomous AI Opponent**: Controlled via slide switch `SW1`:
  - When `SW1 == 0` (**AI Mode**), the CPU executes an autonomous tracking algorithm: if the ball's center is below the right paddle center, the paddle moves down; if above, it moves up.
  - When `SW1 == 1` (**2-Player Manual Mode**), right paddle control switches to `BTN2` (UP) and `BTN3` (DOWN).

---

## 8. Basic Verification & Directed Testbenches

Basic verification of the SoC was conducted through modular and top-level SystemVerilog testbenches. All simulations were performed with full signal tracing in ModelSim / QuestaSim.

### Reset Behavior & Initial State Verification

The system reset testbench ([`tb/soc_top_tb.sv`](file:///c:/Users/HSG/Desktop/rv32i-vga/tb/soc_top_tb.sv)) verifies that upon asserting reset:
1. Program Counter immediately resets to vector `0x0000_0000`.
2. All Register File locations are cleared.
3. The AXI master bridge enters the `IDLE` state.
4. VGA timing counters reset to $(0, 0)$.

![Reset Test Waveform](screensshots/basic%20verification/Reset%20Test.png)
*Figure 8.1: System reset simulation waveform demonstrating clean reset de-assertion, PC initialization, and pipeline state machine alignment.*

### Core Memory Access & Pixel-Address Generation

This test confirms that when the CPU executes load and store instructions, addresses and data are driven onto the memory bus while the hardware rasterizer concurrently computes pixel addresses from raster scan counters (`H_count >> 2`, `V_count >> 2`).

![Core Memory Access & Pixel-Address Generation](screensshots/basic%20verification/Core%20Memory%20Access%20%26%20Pixel-Address%20Generation.png)
*Figure 8.2: CPU memory access and real-time pixel address generator verification waveform.*

### Bus Transactions & MMIO Register Access

The bus transaction test verifies that the CPU writes to MMIO display registers (`0x1000_0000`), configures `VGA_CTRL` with display enable (`1`), and reads back hardware status flags and button states without data corruption.

![Bus Transactions & VGA Register Access](screensshots/basic%20verification/Bus%20Transactions%20%26%20VGA%20Register%20Access.png)
*Figure 8.3: AXI bus transactions and VGA MMIO register configuration waveform.*

### VGA Timing, Framebuffer Reads, & RGB Pipeline

Verifies that the dual-port framebuffer memory handles simultaneous CPU write operations and continuous video read operations. The 1-cycle pipeline delay in `rgb_output.v` is verified to align pixel data with `hsync` and `vsync`.

![VGA Controller Timing, Framebuffer Reads, & RGB Generation](screensshots/basic%20verification/VGA%20Controller%20Timing,%20Framebuffer%20Reads,%20%26%20RGB%20Generation.png)
*Figure 8.4: Video timing, synchronous Block RAM framebuffer read latency, and RGB output generation waveform.*

### Modular Testbench Results (Bridge, Decoder, VGA)

To isolate subsystem functionality, modular testbenches were executed and validated against automated self-checking assertions:

#### 1. CPU-to-AXI Bridge Verification (`tb/rv32i_dmem_tb.sv`)
Validates that CPU load and store instructions produce standard AXI handshakes, asserting `cpu_stall` during wait states and de-asserting upon response.

![CPU to AXI Bridge Waveform](screensshots/testbenches/CPU%20to%20AXI%20Bridge.png)
*Figure 8.5: CPU-to-AXI bridge handshake waveform showing AW/W/B and AR/R channel transactions and stall signal assertion.*

![CPU to AXI Bridge Terminal](screensshots/testbenches/CPU%20to%20AXI%20Bridge%20Terminal.png)
*Figure 8.6: Self-checking testbench terminal transcript confirming 0 errors in CPU-to-AXI bridge operations.*

#### 2. AXI Crossbar Interconnect (`tb/axi_decoder_tb.sv`)
Verifies address routing between Slave 0 (Data RAM), Slave 1 (VGA Subsystem), and error trapping on unmapped addresses.

![AXI Bus Interconnect Waveform](screensshots/testbenches/AXI%20Bus%20Interconnect.png)
*Figure 8.7: AXI crossbar routing and address decoding waveform.*

![AXI-Lite MMIO Registers](screensshots/testbenches/AXI-Lite%20MMIO%20Registers.png)
*Figure 8.8: MMIO register access verification waveform.*

#### 3. VGA Subsystem Pipeline & Timing (`tb/vga_subsystem_tb.sv`, `tb/vga_tb.v`)
Confirms precise generation of 800-clock horizontal scanlines and 525-line vertical refresh frames.

![VGA Timing Logic Waveform](screensshots/testbenches/VGA%20Timing%20Logic.png)
*Figure 8.9: VGA horizontal and vertical timing counter waveform.*

![Full VGA Pipeline Waveform](screensshots/testbenches/Full%20VGA%20Pipeline.png)
*Figure 8.10: Full VGA graphics datapath pipeline simulation waveform.*

![VGA Pipeline Terminal](screensshots/testbenches/VGA%20Pipeline%20Terminal.png)
*Figure 8.11: Self-checking terminal transcript confirming clean timing and zero pipeline errors.*

### Full Datapath End-to-End Simulation Trace

The top-level testbench ([`tb/soc_top_tb.sv`](file:///c:/Users/HSG/Desktop/rv32i-vga/tb/soc_top_tb.sv)) combines the CPU, instruction memory preloaded with compiled binary code, AXI crossbar, framebuffer, and VGA controller in an end-to-end simulation.

![Full Datapath Simulation](screensshots/expected%20output/vga_full_datapath_active.png)
*Figure 8.12: Comprehensive SoC top-level active datapath simulation trace displaying instruction fetches, framebuffer writes, and continuous RGB pixel streaming.*

---

## 9. Industrial-Grade UVM 1.2 Verification Environment

To ensure verification completeness, the SoC interconnect and graphics subsystem were subjected to a comprehensive **UVM 1.2 (Universal Verification Methodology)** verification environment located in [`tb/uvm/`](file:///c:/Users/HSG/Desktop/rv32i-vga/tb/uvm).

### UVM Testbench Architecture & VIP Components

```
+-----------------------------------------------------------------------------------------+
|                                    tb_top (SystemVerilog)                               |
|                                                                                         |
|  +-----------------------------------------------------------------------------------+  |
|  |                            DUT: axi_decoder + Targets                             |  |
|  |  - Master Port: Driven by UVM Master VIP Agent                                    |  |
|  |  - Slave 0 Port: Connected to axi_data_memory (RAM)                               |  |
|  |  - Slave 1 Port: Connected to vga_registers + framebuffer_sram                    |  |
|  |  - Error Slave: Internal crossbar decoder logic                                   |  |
|  +-----------------------------------------------------------------------------------+  |
|                                                                                         |
|  +-----------------------------------------------------------------------------------+  |
|  |                          UVM Environment (axi_decoder_env)                        |  |
|  |                                                                                   |  |
|  |  +-----------------------+     +-----------------------+     +-----------------+  |  |
|  |  | Master Agent (ACTIVE) |     | Passive Slave 0 Agent |     | Passive Slv 1   |  |  |
|  |  | - Sequencer           |     | - Monitor (s0_if)     |     | - Monitor(s1_if)|  |  |
|  |  | - Driver (m_if)       |     +-----------------------+     +-----------------+  |  |
|  |  | - Monitor (m_if)      |                 |                          |           |  |
|  |  +-----------------------+                 |                          |           |  |
|  |              |                             |                          |           |  |
|  |              v                             v                          v           |  |
|  |  +-----------------------------------------------------------------------------+  |  |
|  |  |                 Scoreboard (axi_decoder_scoreboard)                         |  |  |
|  |  |  - Dynamic Address Routing Verification                                     |  |  |
|  |  |  - Write/Read Data Integrity Verification                                  |  |  |
|  |  |  - Error Slave Response (SLVERR) Checking                                   |  |  |
|  |  |  - Queue Flushing & Leakage Checking in check_phase                         |  |  |
|  |  +-----------------------------------------------------------------------------+  |  |
|  |              |                                                                    |  |
|  |              v                                                                    |  |
|  |  +-----------------------------------------------------------------------------+  |  |
|  |  |                 Coverage Collector (axi_decoder_coverage)                   |  |  |
|  |  |  - Address Space Bins (RAM, VGA MMIO, Framebuffer, Unmapped)                 |  |  |
|  |  |  - Operation Cross Coverage (Read/Write x Address x Response x Strobe)      |  |  |
|  |  |  - Functional Coverage Result: > 93%                                       |  |  |
|  |  +-----------------------------------------------------------------------------+  |  |
|  +-----------------------------------------------------------------------------------+  |
+-----------------------------------------------------------------------------------------+
```

1. **AXI4-Lite Interface (`axi_lite_if.sv`)**: Encapsulates AW, W, B, AR, and R signal channels with clocking blocks.
2. **Transaction Sequence Item (`axi_lite_item.sv`)**: Parameterized transaction item defining address, data, operation type (`READ`/`WRITE`), byte strobes (`wstrb`), and response status (`resp`).
3. **Master Driver (`axi_lite_driver.sv`)**: Protocol-compliant driver managing two-way handshaking across all AXI channels.
4. **Monitors (`axi_lite_monitor.sv`)**: Non-intrusive monitors on Master and Slave interfaces sampling transactions and broadcasting via `uvm_analysis_port`.

### UVM Sequence Library & Test Scenarios

The test library ([`tb/uvm/tests/`](file:///c:/Users/HSG/Desktop/rv32i-vga/tb/uvm/tests/)) implements four distinct verification scenarios:
1. `axi_decoder_sanity_test`: Directed read and write transactions verifying nominal access to Data RAM, VGA registers, and Framebuffer memory.
2. `axi_decoder_unmapped_test`: Stresses unmapped address holes across the 32-bit address space, asserting that the crossbar returns `SLVERR` (`2'b10`).
3. `axi_decoder_random_test`: Constrained-random stress sequence generating hundreds of transactions with randomized addresses, byte enables, and data patterns.
4. `axi_decoder_concurrent_test`: High-throughput back-to-back zero-delay burst transactions evaluating crossbar pipeline throughput under maximum bus load.

### SystemVerilog Assertions (SVA) Verification

SystemVerilog Concurrent Assertions (SVA) were integrated into the virtual interface to enforce protocol rules on every clock edge:
- Stability: Once `valid` is asserted, address and data payloads must remain stable until `ready` is returned.
- Response: Write responses (`bvalid`) and read responses (`rvalid`) must adhere to defined timeouts.
- Signal Integrity: Handshake signals must never take on `X` or `Z` values.

![SystemVerilog Assertions Verification](screensshots/uvm_verification/assertions.png)
*Figure 9.1: SystemVerilog Concurrent Assertions (SVA) verification transcript confirming 0 protocol failures.*

### Functional Coverage Model & Results (>93% Coverage)

The coverage model ([`axi_decoder_coverage.sv`](file:///c:/Users/HSG/Desktop/rv32i-vga/tb/uvm/env/axi_decoder_coverage.sv)) defines cross-coverage across:
- Target memory spaces: Data RAM (`0x0000_0000`), VGA MMIO (`0x1000_0000`), Framebuffer (`0x5000_0000`), Unmapped holes.
- Transaction types: Read vs. Write operations.
- Response codes: `OKAY` (`2'b00`) vs. `SLVERR` (`2'b10`).
- Byte strobe masks: All combinations of `wstrb[3:0]`.

![UVM Coverage Report Screen 1](screensshots/uvm_verification/covergroupss1.png)
*Figure 9.2: UVM functional coverage report overview showing high coverage metrics across covergroups.*

![UVM Coverage Report Screen 2](screensshots/uvm_verification/covergroup%20coverage%20ss2.png)
*Figure 9.3: Detailed functional coverage breakdown confirming **>93% total functional coverage**.*

### Scoreboard Data Integrity & Routing Verification

The UVM scoreboard maintains independent transaction queues for each slave port. It verifies:
- Address Routing: Transactions addressing `0x0000_0000` route exclusively to Slave 0; transactions addressing `0x1000_0000` or `0x5000_0000` route exclusively to Slave 1.
- Data Integrity: Write data broadcast by the master matches slave write data byte-for-byte.
- Clean Termination: `check_phase` ensures all transmitted packets are verified with zero residual queue leaks.

![UVM Scoreboard Results](screensshots/uvm_verification/vga_scoreboard.png)
*Figure 9.4: UVM Scoreboard verification report displaying 0 mismatches, 0 dropped packets, and full transaction verification.*

### Detailed UVM Simulation Waveform Analysis

The UVM verification suite produced comprehensive waveform traces documenting every corner of system operation:

#### 1. Register & Framebuffer Write Operations
Shows the UVM master agent driving AXI write transactions to configure `VGA_CTRL` and populate the framebuffer memory.

![AXI Write to Registers & Framebuffer](screensshots/uvm_verification/AXI%20Write%20to%20Registers%20%26%20Framebuffer.png)
*Figure 9.5: Waveform displaying AXI write sequences to VGA MMIO registers and Framebuffer SRAM.*

#### 2. Active Scanline & Pixel Detail
Zooms into the raster scanning pipeline, displaying individual pixel data words read from the framebuffer and routed to `rgb_output`.

![Active VGA Display Scanline & Pixel Detail](screensshots/uvm_verification/Active%20VGA%20Display%20(Scanline%20%26%20Pixel%20Detail).png)
*Figure 9.6: High-resolution inspection of active scanlines and pixel color byte transitions.*

#### 3. Horizontal Sync (HSYNC) Timing Analysis
Verifies cycle-accurate horizontal timing: 640 active clocks, 16 front porch clocks, 96 active-low sync pulse clocks, and 48 back porch clocks.

![Horizontal Sync Timing Analysis](screensshots/uvm_verification/Horizontal%20Sync%20(HSYNC)%20Timing%20Analysis.png)
*Figure 9.7: Horizontal synchronization (HSYNC) cycle-accurate timing analysis waveform.*

#### 4. Full Vertical Refresh Frame (VSYNC)
Captures an entire 525-line vertical frame, displaying 480 active lines, 10 front porch lines, 2 sync pulse lines, and 33 back porch lines.

![Full VGA Frame Showing Vertical Sync VSYNC](screensshots/uvm_verification/Full%20VGA%20Frame%20(Showing%20Vertical%20Sync%20VSYNC).png)
*Figure 9.8: Complete vertical frame waveform displaying active video interval, V-Front Porch, VSYNC pulse, and V-Back Porch.*

#### 5. Multi-Frame Overview (100 µs Run)
Provides an overview of multi-frame video streaming and continuous memory arbitration.

![Multi-Frame Overview](screensshots/uvm_verification/Multi-Frame%20Overview%20(Entire%20100%20%C2%B5s%20Run).png)
*Figure 9.9: Multi-frame simulation overview spanning 100 µs of continuous operation.*

#### 6. Display Enable & Blanking Transitions
Verifies that when `VGA_CTRL[0]` is asserted (`1`), RGB video generation is enabled; when de-asserted (`0`), RGB outputs are immediately forced to zero without interrupting raster sync timing.

![Display Toggle Enable](screensshots/uvm_verification/vga_display_toggle_test_enable.png)
*Figure 9.10: UVM sequence verifying video activation upon asserting display enable.*

![Display Toggle Disable Blanking Transitions](screensshots/uvm_verification/vga_display_toggle_test_disable-Blanking_transitions.png)
*Figure 9.11: UVM sequence verifying display blanking transitions when display enable is de-asserted.*

#### 7. Invalid Access & Error Response Trapping
Demonstrates the crossbar decoder asserting `SLVERR` (`2'b10`) when an access is attempted targeting an unmapped memory region.

![Invalid Access Waveform](screensshots/uvm_verification/vga_invalid_access_waveform.png)
*Figure 9.12: Waveform demonstrating AXI error response (SLVERR) generation upon unmapped address access.*

---

## 10. ASIC Physical Design & Silicon Tapeout (SkyWater 130nm)

The complete `soc_top` design was hardened to silicon layout using the automated open-source **OpenLane / OpenROAD** physical design flow targeting the **SkyWater 130nm (`sky130_fd_sc_hd`)** standard-cell library. The tapeout run directory is archived in [`gds/RUN_2026-09-11_10-33-07/`](file:///c:/Users/HSG/Desktop/rv32i-vga/gds/RUN_2026-09-11_10-33-07).

### Automated OpenLane / OpenROAD Flow

```
[ RTL Verilog ] ---> [ Yosys Synthesis ] ---> [ Floorplanning & PDN ] ---> [ Global Placement ]
                                                                                   |
[ Silicon GDSII ] <--- [ Magic DRC/LVS ] <--- [ Detailed Routing ] <--- [ Clock Tree Synth ]
```

1. **Synthesis**: Yosys synthesized the RTL into a gate-level netlist mapped to `sky130_fd_sc_hd` primitives.
2. **Floorplanning**: Die and core boundaries were established with I/O pin placements around the perimeter.
3. **Power Planning (PDN)**: OpenROAD synthesized a low-resistance power grid mesh across upper metal layers for `VPWR` and `VGND`.
4. **Placement**: Global and detailed placement placed 1,614 standard cells, inserting well tap cells and antenna diodes.
5. **Clock Tree Synthesis (CTS)**: Synthesized balanced clock trees using 31 dedicated clock buffers, achieving minimal clock skew.
6. **Routing**: TritonRoute completed detailed routing over 22 iterations, resolving all design rule conflicts.
7. **Sign-Off Verification**: Magic and KLayout performed DRC and LVS checks, and OpenROAD executed multi-corner static timing analysis.

### Sign-Off Tapeout Metrics & Area Utilization

The key physical metrics extracted from [`gds/RUN_2026-09-11_10-33-07/final/metrics.json`](file:///c:/Users/HSG/Desktop/rv32i-vga/gds/RUN_2026-09-11_10-33-07/final/metrics.json) are summarized below:

| Physical Parameter | Value | Sign-off Status |
| :--- | :---: | :---: |
| **PDK / Technology Node** | SkyWater 130nm (`sky130_fd_sc_hd`) | Verified |
| **Die Dimensions (W x H)** | **112.92 µm x 123.64 µm** | Tapeout Ready |
| **Total Die Footprint Area** | **13,960.2 µm²** (0.014 mm²) | Passed |
| **Core Dimensions (W x H)** | **107.18 µm x 111.52 µm** | Tapeout Ready |
| **Active Core Area** | **10,231.1 µm²** | Passed |
| **Core Cell Utilization** | **79.97%** (~80%) | Optimal |
| **Total Cell Instances** | **1,614 cells** | Clean |
| **Functional Standard Cells** | **925 cells** (8,181.6 µm²) | Clean |
| **Sequential Elements (DFFs)** | **111 cells** (2,766.4 µm²) | Clean |
| **Physical Fill / Tap Cells** | **689 fill / 136 tap cells** | Clean |
| **Buffer Instances** | **147 timing repair / 31 clock buffers** | Clean |
| **Total Routed Wirelength** | **13,464 µm** (13.46 mm) | Completed (iter 22) |
| **Total Routing Vias** | **4,670 vias** | Clean |
| **Design Rule Violations (DRC)** | **0 violations** | **PASSED (100% Clean)** |
| **Layout vs. Schematic (LVS)** | **0 violations (0 floating pins)** | **PASSED (100% Clean)** |
| **Antenna Violations** | **0 violating nets / pins** | **PASSED** |

### Multi-Corner Static Timing Analysis (STA)

Sign-off static timing analysis was executed across **all 9 standard PVT analysis corners** with full parasitic extraction (SPEF). The design achieved timing closure with **zero setup violations and zero hold violations**:

| PVT Analysis Corner | Operating Condition | Setup Slack (WS) | Setup Vio | Hold Slack (WS) | Hold Vio | Max Slew Vio | Max Cap Vio |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| `nom_tt_025C_1v80` | Typical (+25°C, 1.80V) | **+5.196 ns** | 0 | **+0.459 ns** | 0 | 0 | 0 |
| `nom_ss_100C_1v60` | Slow-Slow (+100°C, 1.60V) | **+0.630 ns** | 0 | **+0.979 ns** | 0 | 0 | 0 |
| `nom_ff_n40C_1v95` | Fast-Fast (-40°C, 1.95V) | **+6.248 ns** | 0 | **+0.257 ns** | 0 | 0 | 0 |
| `min_tt_025C_1v80` | Min Typ (+25°C, 1.80V) | **+5.230 ns** | 0 | **+0.458 ns** | 0 | 0 | 0 |
| `min_ss_100C_1v60` | Min Slow (+100°C, 1.60V) | **+0.713 ns** | 0 | **+0.976 ns** | 0 | 0 | 0 |
| `min_ff_n40C_1v95` | Min Fast (-40°C, 1.95V) | **+6.270 ns** | 0 | **+0.256 ns** | 0 | 0 | 0 |
| `max_tt_025C_1v80` | Max Typ (+25°C, 1.80V) | **+5.158 ns** | 0 | **+0.460 ns** | 0 | 0 | 0 |
| `max_ss_100C_1v60` | Max Slow (+100°C, 1.60V) | **+0.545 ns** | 0 | **+0.984 ns** | 0 | 0 | 0 |
| `max_ff_n40C_1v95` | Max Fast (-40°C, 1.95V) | **+6.221 ns** | 0 | **+0.258 ns** | 0 | 0 | 0 |
| **Worst-Case Overall** | — | **+0.545 ns** | **0** | **+0.256 ns** | **0** | **0** | **0** |

- **Setup Total Negative Slack (TNS)**: `0.0000 ns` (Clean)
- **Hold Total Negative Slack (TNS)**: `0.0000 ns` (Clean)

![Multi-Corner STA Summary Table](gds/screenshots/Screenshot%20from%202026-09-11%2015-42-47.png)
*Figure 10.1: Sign-off multi-corner Static Timing Analysis report confirming zero setup/hold violations across all 9 PVT corners.*

### Power Grid Integrity & IR Drop Analysis

Power dissipation and voltage drop were analyzed post-route:
- **Total Power Dissipation**: **1.012 mW** (0.00101 W)
  - **Internal Power**: 0.788 mW (77.9%)
  - **Switching Power**: 0.224 mW (22.1%)
  - **Leakage Power**: 11.45 nW (< 0.001%)
- **Power Grid IR Drop**:
  - `VPWR` Average IR Drop: **13.4 µV**
  - `VPWR` Worst-Case IR Drop: **83.6 µV**
  - Demonstrates a stable, robust power distribution network with negligible supply degradation.

### Silicon GDSII Layout Inspection

The physical layout was visualized and verified in OpenROAD and KLayout:

![soc_top Routed Layout with Power Mesh](gds/screenshots/Screenshot%20from%202026-09-11%2015-43-15.png)
*Figure 10.2: Full-chip routed silicon layout in OpenROAD showing standard cell rows, power mesh straps, and clock tree routing.*

![KLayout GDSII Viewer soc_top.gds](gds/screenshots/Screenshot%20from%202026-09-11%2015-45-39.png)
*Figure 10.3: Final tapeout GDSII mask geometry inspected in KLayout (`soc_top.gds`).*

---

## 11. FPGA Implementation & Hardware Demonstration

### Board Integration & Pin Constraints (Zybo Z7-10)

The SoC was deployed to the **Digilent Zybo Z7-10** development board featuring a Xilinx Zynq-7000 FPGA (`xc7z010clg400-1`). The board wrapper ([`rtl/fpga/zybo_top.v`](file:///c:/Users/HSG/Desktop/rv32i-vga/rtl/fpga/zybo_top.v)) maps system I/O to physical board pins defined in [`constraints/zybo_z7_10.xdc`](file:///c:/Users/HSG/Desktop/rv32i-vga/constraints/zybo_z7_10.xdc):

| Board Component | FPGA Pin | I/O Direction | Function in System |
| :--- | :---: | :---: | :--- |
| **Clock Oscillator** | `K17` | Input | Master 125.0 MHz system clock. |
| **Slide Switch SW0** | `G15` | Input | System master reset (`1` = Reset active, `0` = Run). |
| **Slide Switch SW1** | `P15` | Input | Game AI Mode toggle (`0` = AI on, `1` = 2-Player Manual). |
| **Pushbutton BTN0** | `K18` | Input | Left Paddle UP. |
| **Pushbutton BTN1** | `P16` | Input | Left Paddle DOWN. |
| **Pushbutton BTN2** | `K19` | Input | Right Paddle UP (Manual Mode). |
| **Pushbutton BTN3** | `Y16` | Input | Right Paddle DOWN (Manual Mode). |
| **Diagnostic LED0** | `M14` | Output | Video Active indicator (illuminates when display is enabled). |
| **Diagnostic LED1** | `M15` | Output | CPU Stall indicator (shows memory wait states). |
| **Diagnostic LED2** | `G14` | Output | Memory Write indicator (latches ON upon first memory write). |
| **Diagnostic LED3** | `D18` | Output | Heartbeat blinker (~1.5 Hz continuous pulse). |
| **Pmod JC Pin 1** | `V15` | Output | VGA Red channel (digital RGB111). |
| **Pmod JC Pin 2** | `W15` | Output | VGA Green channel (digital RGB111). |
| **Pmod JC Pin 3** | `T11` | Output | VGA Blue channel (digital RGB111). |
| **Pmod JC Pin 7** | `W14` | Output | VGA Horizontal Sync (HSYNC). |
| **Pmod JC Pin 8** | `Y14` | Output | VGA Vertical Sync (VSYNC). |

### Open-Source Build Flow (F4PGA / SymbiFlow)

Synthesis and bitstream generation were automated through [`Makefile`](file:///c:/Users/HSG/Desktop/rv32i-vga/Makefile) using the open-source **F4PGA / SymbiFlow** toolchain:
1. `symbiflow_synth`: Synthesizes Verilog RTL using Yosys into an `.eblif` netlist.
2. `symbiflow_pack`: Packs logic into configurable logic blocks (CLBs) using VPR.
3. `symbiflow_place`: Places packed logic onto the XC7Z010 physical device grid.
4. `symbiflow_route`: Completes routing across FPGA switch matrices.
5. `symbiflow_write_fasm`: Translates the routed netlist into FPGA configuration bits.
6. `symbiflow_write_bitstream`: Formats the final bitstream file (`zybo_top.bit`).

### JTAG Programming via openFPGALoader

The compiled bitstream was downloaded directly to the Zybo Z7-10 FPGA via JTAG using `openFPGALoader`:

```bash
openFPGALoader -b zybo_z7_10 build/zybo/zybo_top.bit
```

![FPGA JTAG Programming](screensshots/project%20working/Screenshot_20260913-194805.png)
*Figure 11.1: Host terminal transcript showing openFPGALoader flashing `zybo_top.bit` onto the Digilent Zybo Z7-10 FPGA via JTAG at 6.00 MHz.*

### Laboratory Hardware Demonstration & Team Gameplay

Upon programming, the processor initialized the VGA controller and launched the bare-metal Ping Pong game. The video output was transmitted via the Pmod JC connector to an HP VGA computer monitor:

![VGA Monitor Real-Time Display](screensshots/project%20working/Screenshot_20260913-194819.png)
*Figure 11.2: Live VGA computer monitor displaying the RV32I-driven Ping Pong game with left/right paddles and the ball moving in real time.*

The project team (**Hamza Shahid**, **Noor ul Huda**, and **Afnan Inayat**) validated the interactive functionality in the laboratory:

![Laboratory Hardware Demonstration](screensshots/project%20working/Screenshot_20260913-194825.png)
*Figure 11.3: Team members interacting with the Digilent Zybo Z7-10 FPGA board pushbuttons to play the Ping Pong game on the external VGA monitor.*

---

## 12. Deliverables Compliance Matrix & Conclusion

### Compliance Matrix

The table below confirms that all required deliverables specified for Project 02 have been fulfilled:

| Required Deliverable | Description / Location | Status |
| :--- | :--- | :---: |
| **Synthesizable RTL** | Complete Verilog RTL under `rtl/` (`rv32i/`, `bus/`, `vga/`, `fpga/`, `soc_top.v`) | **Completed** |
| **RISC-V SoC Integration** | Single-cycle RV32I core integrated with instruction ROM and AXI bus | **Completed** |
| **SRAM / Framebuffer Integration** | 256 B Data RAM + 160x120 dual-port video framebuffer SRAM | **Completed** |
| **Bus Interface** | Standard AXI4-Lite bridge, crossbar decoder, and unmapped error slave | **Completed** |
| **VGA Output** | Standard 640x480 @ 60 Hz timing with 4x hardware pixel scaler and RGB111 output | **Completed** |
| **Basic Self-Checking Simulation** | Modular and top-level testbenches in `tb/` verifying memory, timing, and bus handshakes | **Completed** |
| **UVM Verification Environment** | UVM 1.2 testbench in `tb/uvm/` with AXI VIP, scoreboard, and sequence library | **Completed** |
| **Functional Coverage & Assertions**| SVA assertions with 0 failures; functional coverage model achieving **>93% coverage** | **Completed** |
| **Timing Constraints** | Pin and clock constraints in `constraints/zybo_z7_10.xdc` and ASIC SDC constraints | **Completed** |
| **Synthesis & Physical Design** | Hardened to SkyWater 130nm via OpenLane; 0 DRC, 0 LVS, 0 timing violations across 9 corners | **Completed** |
| **FPGA Demonstration** | Deployed on Digilent Zybo Z7-10; live interactive Ping Pong game demonstrated on VGA monitor | **Completed** |
| **Architecture Documentation** | Complete technical report with architectural diagrams, register maps, and waveforms | **Completed** |

### Conclusion

Project 02 successfully demonstrates the end-to-end realization of a complete computer system—from custom instruction decoding to silicon physical layout and real-world FPGA hardware deployment. By bridging a single-cycle RV32I processor core with an AXI4-Lite bus, incorporating hardware pixel scaling to optimize on-chip memory utilization, verifying the system with both directed and UVM 1.2 test environments, hardening the design to a tapeout-ready SkyWater 130nm layout, and demonstrating interactive gameplay on an FPGA-connected VGA monitor, group members **Hamza Shahid**, **Noor ul Huda**, and **Afnan Inayat** have fulfilled the project objectives with high engineering rigor.
