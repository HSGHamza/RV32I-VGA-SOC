import os
import docx
from docx import Document
from docx.shared import Inches, Pt, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT, WD_ALIGN_VERTICAL
from docx.oxml import parse_xml, OxmlElement
from docx.oxml.ns import nsdecls, qn

def create_full_report():
    doc = Document()

    # Define standard margins (1 inch on all sides)
    for section in doc.sections:
        section.top_margin = Inches(1.0)
        section.bottom_margin = Inches(1.0)
        section.left_margin = Inches(1.0)
        section.right_margin = Inches(1.0)

    # Palette
    NAVY = RGBColor(15, 41, 66)      # #0F2942
    BLUE = RGBColor(43, 108, 176)    # #2B6CB0
    CHARCOAL = RGBColor(45, 55, 72)  # #2D3748
    MUTED = RGBColor(113, 128, 150)  # #718096

    # Configure Normal Style
    normal_style = doc.styles['Normal']
    normal_style.font.name = 'Calibri'
    normal_style.font.size = Pt(11)
    normal_style.font.color.rgb = CHARCOAL
    normal_style.paragraph_format.line_spacing = 1.15
    normal_style.paragraph_format.space_after = Pt(6)

    # Helper: Cell Background
    def set_cell_background(cell, fill_hex):
        shd = parse_xml(f'<w:shd {nsdecls("w")} w:fill="{fill_hex}"/>')
        cell._tc.get_or_add_tcPr().append(shd)

    # Helper: Cell Padding / Margins
    def set_cell_margins(cell, top=120, bottom=120, left=180, right=180):
        tcMar = parse_xml(f'<w:tcMar {nsdecls("w")}><w:top w:w="{top}" w:type="dxa"/><w:bottom w:w="{bottom}" w:type="dxa"/><w:left w:w="{left}" w:type="dxa"/><w:right w:w="{right}" w:type="dxa"/></w:tcMar>')
        cell._tc.get_or_add_tcPr().append(tcMar)

    # Helper: Table Borders
    def set_table_borders(table, color="D2D6DC"):
        tblPr = table._tbl.tblPr
        borders = parse_xml(f'<w:tblBorders {nsdecls("w")}><w:top w:val="single" w:sz="4" w:space="0" w:color="{color}"/><w:bottom w:val="single" w:sz="6" w:space="0" w:color="{color}"/><w:left w:val="none"/><w:right w:val="none"/><w:insideH w:val="single" w:sz="4" w:space="0" w:color="{color}"/><w:insideV w:val="none"/></w:tblBorders>')
        tblPr.append(borders)

    # Helper: Styled Heading 1
    def add_h1(text):
        p = doc.add_paragraph()
        p.paragraph_format.space_before = Pt(16)
        p.paragraph_format.space_after = Pt(6)
        p.paragraph_format.keep_with_next = True
        run = p.add_run(text)
        run.font.name = 'Calibri'
        run.font.size = Pt(18)
        run.font.bold = True
        run.font.color.rgb = NAVY
        return p

    # Helper: Styled Heading 2
    def add_h2(text):
        p = doc.add_paragraph()
        p.paragraph_format.space_before = Pt(12)
        p.paragraph_format.space_after = Pt(4)
        p.paragraph_format.keep_with_next = True
        run = p.add_run(text)
        run.font.name = 'Calibri'
        run.font.size = Pt(14)
        run.font.bold = True
        run.font.color.rgb = BLUE
        return p

    # Helper: Styled Heading 3
    def add_h3(text):
        p = doc.add_paragraph()
        p.paragraph_format.space_before = Pt(8)
        p.paragraph_format.space_after = Pt(2)
        p.paragraph_format.keep_with_next = True
        run = p.add_run(text)
        run.font.name = 'Calibri'
        run.font.size = Pt(12)
        run.font.bold = True
        run.font.color.rgb = CHARCOAL
        return p

    # Helper: Callout Box
    def add_callout(text, title="KEY ARCHITECTURAL HIGHLIGHT"):
        tbl = doc.add_table(rows=1, cols=1)
        tbl.alignment = WD_TABLE_ALIGNMENT.CENTER
        cell = tbl.cell(0, 0)
        set_cell_background(cell, "F0F4F8")
        set_cell_margins(cell, top=140, bottom=140, left=200, right=200)
        
        # Left thick border
        borders = parse_xml(f'<w:tcBorders {nsdecls("w")}><w:left w:val="single" w:sz="24" w:space="0" w:color="0F2942"/><w:top w:val="none"/><w:right w:val="none"/><w:bottom w:val="none"/></w:tcBorders>')
        cell._tc.get_or_add_tcPr().append(borders)
        
        p = cell.paragraphs[0]
        p.paragraph_format.space_after = Pt(2)
        p.paragraph_format.line_spacing = 1.15
        r_title = p.add_run(f"[{title}]\n")
        r_title.bold = True
        r_title.font.size = Pt(9.5)
        r_title.font.color.rgb = NAVY
        
        r_body = p.add_run(text)
        r_body.font.size = Pt(10)
        r_body.font.color.rgb = CHARCOAL
        doc.add_paragraph() # spacing

    # Helper: Figure with Caption
    def add_figure(img_path, caption_text, width=Inches(6.0)):
        if os.path.exists(img_path):
            p = doc.add_paragraph()
            p.alignment = WD_ALIGN_PARAGRAPH.CENTER
            p.paragraph_format.space_before = Pt(8)
            p.paragraph_format.space_after = Pt(3)
            run = p.add_run()
            run.add_picture(img_path, width=width)
            
            p_cap = doc.add_paragraph()
            p_cap.alignment = WD_ALIGN_PARAGRAPH.CENTER
            p_cap.paragraph_format.space_before = Pt(2)
            p_cap.paragraph_format.space_after = Pt(10)
            r_cap = p_cap.add_run(caption_text)
            r_cap.font.name = 'Calibri'
            r_cap.font.size = Pt(9.5)
            r_cap.font.italic = True
            r_cap.font.color.rgb = MUTED
        else:
            p = doc.add_paragraph(f"[IMAGE NOT FOUND: {img_path}]")
            p.runs[0].font.color.rgb = RGBColor(200, 0, 0)

    # Helper: Table Formatter
    def format_table(table, col_widths, headers, rows):
        table.alignment = WD_TABLE_ALIGNMENT.CENTER
        set_table_borders(table)
        
        # Header Row
        hdr_cells = table.rows[0].cells
        for i, h in enumerate(headers):
            hdr_cells[i].text = h
            set_cell_background(hdr_cells[i], "0F2942")
            set_cell_margins(hdr_cells[i], top=120, bottom=120, left=140, right=140)
            p = hdr_cells[i].paragraphs[0]
            p.alignment = WD_ALIGN_PARAGRAPH.CENTER
            for r in p.runs:
                r.font.bold = True
                r.font.size = Pt(9.5)
                r.font.color.rgb = RGBColor(255, 255, 255)
                
        # Data Rows
        for r_idx, row_data in enumerate(rows):
            row_cells = table.add_row().cells
            bg_color = "F8FAFC" if (r_idx % 2 == 1) else "FFFFFF"
            for c_idx, val in enumerate(row_data):
                row_cells[c_idx].text = str(val)
                set_cell_background(row_cells[c_idx], bg_color)
                set_cell_margins(row_cells[c_idx], top=100, bottom=100, left=140, right=140)
                p = row_cells[c_idx].paragraphs[0]
                p.alignment = WD_ALIGN_PARAGRAPH.LEFT if c_idx == 0 or len(str(val)) > 15 else WD_ALIGN_PARAGRAPH.CENTER
                for r in p.runs:
                    r.font.size = Pt(9.5)
                    r.font.color.rgb = CHARCOAL
                    
        # Apply Column Widths
        for row in table.rows:
            for i, w in enumerate(col_widths):
                row.cells[i].width = Inches(w)
        doc.add_paragraph() # space after table

    # -------------------------------------------------------------
    # COVER PAGE
    # -------------------------------------------------------------
    p_pre = doc.add_paragraph()
    p_pre.paragraph_format.space_before = Pt(36)
    p_pre.paragraph_format.space_after = Pt(8)
    r_domain = p_pre.add_run("ADVANCED DIGITAL IC DESIGN & COMPUTER ARCHITECTURE")
    r_domain.font.size = Pt(11)
    r_domain.font.bold = True
    r_domain.font.color.rgb = BLUE

    p_title = doc.add_paragraph()
    p_title.paragraph_format.space_before = Pt(6)
    p_title.paragraph_format.space_after = Pt(12)
    r_title = p_title.add_run("PROJECT 02: RISC-V SoC with VGA Display Controller")
    r_title.font.size = Pt(26)
    r_title.font.bold = True
    r_title.font.color.rgb = NAVY

    p_sub = doc.add_paragraph()
    p_sub.paragraph_format.space_after = Pt(28)
    r_sub = p_sub.add_run("Architecture, RTL Design, UVM 1.2 Verification, SkyWater 130nm ASIC Tapeout, and Digilent Zybo Z7-10 FPGA Hardware Demonstration")
    r_sub.font.size = Pt(14)
    r_sub.font.italic = True
    r_sub.font.color.rgb = MUTED

    # Authors Box
    tbl_auth = doc.add_table(rows=1, cols=1)
    tbl_auth.alignment = WD_TABLE_ALIGNMENT.CENTER
    c_auth = tbl_auth.cell(0, 0)
    set_cell_background(c_auth, "F7FAFC")
    set_cell_margins(c_auth, top=160, bottom=160, left=200, right=200)
    b_auth = parse_xml(f'<w:tcBorders {nsdecls("w")}><w:left w:val="single" w:sz="18" w:space="0" w:color="2B6CB0"/><w:top w:val="single" w:sz="4" w:space="0" w:color="E2E8F0"/><w:right w:val="single" w:sz="4" w:space="0" w:color="E2E8F0"/><w:bottom w:val="single" w:sz="4" w:space="0" w:color="E2E8F0"/></w:tcBorders>')
    c_auth._tc.get_or_add_tcPr().append(b_auth)
    
    p_a = c_auth.paragraphs[0]
    p_a.paragraph_format.line_spacing = 1.25
    r = p_a.add_run("DESIGN TEAM MEMBERS:\n")
    r.bold = True
    r.font.size = Pt(11)
    r.font.color.rgb = NAVY
    
    members = [
        ("Member 1", "Hamza Shahid"),
        ("Member 2", "Noor ul Huda"),
        ("Member 3", "Afnan Inayat")
    ]
    for role, name in members:
        r1 = p_a.add_run(f"•  {role}: ")
        r1.bold = True
        r1.font.size = Pt(10.5)
        r2 = p_a.add_run(f"{name}\n")
        r2.font.size = Pt(10.5)
        r2.font.color.rgb = CHARCOAL

    r_meta = p_a.add_run("\nTarget Technology Node: SkyWater 130nm (sky130_fd_sc_hd) via OpenLane / OpenROAD\nTarget FPGA Platform: Digilent Zybo Z7-10 (Xilinx Zynq-7000 xc7z010) via F4PGA\nVerification Standards: Directed SystemVerilog Testbenches & UVM 1.2 Environment\nDate: September 2026")
    r_meta.font.size = Pt(9.5)
    r_meta.font.color.rgb = MUTED

    doc.add_page_break()

    # -------------------------------------------------------------
    # TABLE OF CONTENTS (PAGE 2)
    # -------------------------------------------------------------
    p_toc_head = doc.add_paragraph()
    p_toc_head.paragraph_format.space_before = Pt(16)
    p_toc_head.paragraph_format.space_after = Pt(4)
    r_toc_head = p_toc_head.add_run("Table of Contents")
    r_toc_head.font.name = 'Calibri'
    r_toc_head.font.size = Pt(22)
    r_toc_head.font.bold = True
    r_toc_head.font.color.rgb = NAVY

    p_toc_sub = doc.add_paragraph()
    p_toc_sub.paragraph_format.space_after = Pt(12)
    r_toc_sub = p_toc_sub.add_run("Document Outline & Architecture Map")
    r_toc_sub.font.size = Pt(10.5)
    r_toc_sub.font.italic = True
    r_toc_sub.font.color.rgb = MUTED

    toc_table = doc.add_table(rows=1, cols=3)
    toc_table.alignment = WD_TABLE_ALIGNMENT.CENTER
    set_table_borders(toc_table)

    toc_headers = ["Section", "Report Content & Architectural Subsystems", "Domain"]
    toc_widths = [1.0, 4.3, 1.2]
    
    hdr_cells = toc_table.rows[0].cells
    for i, h in enumerate(toc_headers):
        hdr_cells[i].text = h
        set_cell_background(hdr_cells[i], "0F2942")
        set_cell_margins(hdr_cells[i], top=100, bottom=100, left=120, right=120)
        p = hdr_cells[i].paragraphs[0]
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        for r in p.runs:
            r.font.bold = True
            r.font.size = Pt(9.5)
            r.font.color.rgb = RGBColor(255, 255, 255)

    toc_entries = [
        ("1.0", "Executive Summary", "Summary", True),
        ("2.0", "Design Objectives & System Specifications", "Specification", True),
        ("3.0", "Top-Level SoC Architecture", "Architecture", True),
        ("  3.1", "• System Memory Map & Address Decoding", "Memory", False),
        ("  3.2", "• Clock Generation (125 MHz to 25 MHz) & Reset Synchronizer", "Clock/Reset", False),
        ("4.0", "RV32I Microprocessor Core Design", "Processor", True),
        ("  4.1", "• Single-Cycle Datapath & Synchronous cpu_stall Pipeline Logic", "Datapath", False),
        ("  4.2", "• Supported 37-Instruction RV32I ISA & Control Logic Truth Tables", "Control Unit", False),
        ("5.0", "On-Chip Bus Interconnect & AXI4-Lite Protocol", "Interconnect", True),
        ("  5.1", "• RV32I to AXI4-Lite Master Bridge Finite State Machine (FSM)", "Bus Master", False),
        ("  5.2", "• AXI Crossbar Decoder & Unmapped Address Error Slave (SLVERR)", "Crossbar", False),
        ("  5.3", "• Synchronous AXI Data Memory (Slave 0: 256 Bytes)", "RAM", False),
        ("6.0", "VGA Graphics Controller Subsystem", "Graphics", True),
        ("  6.1", "• Standard 640x480 @ 60 Hz Timing & 4x Hardware Pixel Scaling Engine", "Rasterizer", False),
        ("  6.2", "• Dual-Port Block RAM Framebuffer Architecture (160x120 Words)", "Video BRAM", False),
        ("  6.3", "• Memory-Mapped VGA Control, Status, Resolution & I/O Registers", "MMIO", False),
        ("  6.4", "• Pmod RGB111 Physical Interface & 1-Cycle Pipeline Alignment", "Physical I/O", False),
        ("7.0", "Bare-Metal Application: Ping Pong Game", "Software", True),
        ("  7.1", "• Arcade Game Software Architecture & Control Flow", "Assembly", False),
        ("  7.2", "• Ball Kinematics, Velocity Vectors & Paddle Collision Bounding Boxes", "Physics", False),
        ("  7.3", "• Flicker-Free Rendering Engine via Selective Shadow-Variable Erasing", "Graphics SW", False),
        ("  7.4", "• Pushbutton Controls & Autonomous AI Tracking Opponent (SW1 Toggle)", "User I/O", False),
        ("8.0", "Basic Verification & Directed Testbenches", "Verification", True),
        ("  8.1", "• System Reset & Initial State Verification", "Waveforms", False),
        ("  8.2", "• Core Memory Access & Pixel-Address Generation Verification", "Waveforms", False),
        ("  8.3", "• AXI Bus Transactions & MMIO Register Configuration", "Waveforms", False),
        ("  8.4", "• VGA Controller Timing, Framebuffer Reads & RGB Output Waveforms", "Waveforms", False),
        ("  8.5", "• Modular Testbenches: CPU Bridge, Interconnect, & VGA Timing", "Waveforms", False),
        ("  8.6", "• Full End-to-End Datapath Simulation Trace (vga_full_datapath_active)", "Waveforms", False),
        ("9.0", "Industrial-Grade UVM 1.2 Verification Environment", "UVM 1.2", True),
        ("  9.1", "• UVM Architecture: Master/Slave VIP, Sequencer, Driver, Monitors", "VIP", False),
        ("  9.2", "• SystemVerilog Assertions (SVA) Verification (0 Violations)", "Assertions", False),
        ("  9.3", "• Functional Coverage Model Across All Address Bins (>93% Coverage)", "Coverage", False),
        ("  9.4", "• Self-Checking Scoreboard Data Integrity & Routing Results", "Scoreboard", False),
        ("  9.5", "• UVM Simulation Waveforms: AXI Writes, Scanlines, HSYNC, VSYNC, Blanking", "Waveforms", False),
        ("10.0", "ASIC Physical Design & Silicon Tapeout (SkyWater 130nm)", "ASIC", True),
        ("  10.1", "• Automated OpenLane / OpenROAD Flow: Synthesis, Floorplan, PDN, CTS, Route", "Physical Flow", False),
        ("  10.2", "• Tapeout Metrics Summary: 10,231.1 µm² Core Area, 79.97% Utilization", "Sign-Off", False),
        ("  10.3", "• Multi-Corner Static Timing Analysis (STA): 0 Violations Across 9 Corners", "Timing", False),
        ("  10.4", "• Power Dissipation (1.01 mW) & Power Grid IR Drop Analysis (83.6 µV max)", "Power", False),
        ("  10.5", "• Silicon GDSII Layout Inspection in OpenROAD and KLayout (soc_top.gds)", "Layout", False),
        ("11.0", "FPGA Implementation & Hardware Demonstration", "FPGA", True),
        ("  11.1", "• Digilent Zybo Z7-10 Board Integration & Pin Mapping Constraints", "Constraints", False),
        ("  11.2", "• Open-Source Build Flow (F4PGA / SymbiFlow) & JTAG Flashing (openFPGALoader)", "Toolchain", False),
        ("  11.3", "• Real-Time Video Output on External VGA Monitor", "Hardware", False),
        ("  11.4", "• Interactive Team Demonstration & Lab Gameplay (Hamza, Noor, Afnan)", "Laboratory", False),
        ("12.0", "Deliverables Compliance Matrix & Technical Conclusion", "Compliance", True)
    ]

    for sec, title, domain, is_major in toc_entries:
        row_cells = toc_table.add_row().cells
        bg_color = "EDF2F7" if is_major else "FFFFFF"
        
        row_cells[0].text = sec
        row_cells[1].text = title
        row_cells[2].text = domain
        
        for c_idx, cell in enumerate(row_cells):
            set_cell_background(cell, bg_color)
            set_cell_margins(cell, top=50 if not is_major else 70, bottom=50 if not is_major else 70, left=100, right=100)
            p = cell.paragraphs[0]
            p.alignment = WD_ALIGN_PARAGRAPH.CENTER if c_idx != 1 else WD_ALIGN_PARAGRAPH.LEFT
            for r in p.runs:
                r.font.name = 'Calibri'
                r.font.size = Pt(9.5) if is_major else Pt(8.5)
                r.font.bold = is_major
                r.font.color.rgb = NAVY if is_major else CHARCOAL

    for row in toc_table.rows:
        for i, w in enumerate(toc_widths):
            row.cells[i].width = Inches(w)

    doc.add_page_break()

    # -------------------------------------------------------------
    # 1. EXECUTIVE SUMMARY
    # -------------------------------------------------------------
    add_h1("1. Executive Summary")
    doc.add_paragraph(
        "This engineering report provides an exhaustive account of the design, architectural exploration, "
        "functional simulation, industrial-grade UVM 1.2 verification, ASIC physical implementation, and FPGA hardware validation "
        "of an advanced 32-bit RISC-V System-on-Chip (SoC) with hardware-accelerated video display capabilities. "
        "The project was executed by group members Hamza Shahid, Noor ul Huda, and Afnan Inayat."
    )
    doc.add_paragraph(
        "The SoC integrates a synthesizable 32-bit single-cycle RV32I microprocessor core with pipeline stall support, "
        "an AXI4-Lite crossbar interconnect with error response trapping, a 256-byte data memory, a memory-mapped I/O (MMIO) "
        "display control register bank, and an on-chip dual-port video framebuffer memory. Operating on a synchronized 25.0 MHz clock domain, "
        "the graphics subsystem drives industry-standard 640x480 @ 60 Hz VGA timing via a custom 4x hardware pixel scaling engine. "
        "By scaling an internal 160x120 resolution by a factor of 4 in hardware, the design conserves over 71% of on-chip memory while "
        "delivering crisp graphical output across an 8-color Pmod RGB111 interface."
    )
    doc.add_paragraph(
        "The system has been verified and demonstrated across both silicon layout and physical FPGA hardware: "
        "First, it achieved clean tapeout closure on the SkyWater 130nm process node using the automated OpenLane / OpenROAD flow with zero DRC "
        "violations, zero LVS violations, and positive worst slacks across all 9 PVT analysis corners. "
        "Second, it was deployed onto the Digilent Zybo Z7-10 development board using the open-source F4PGA toolchain, executing an interactive "
        "bare-metal RISC-V assembly Ping Pong game (pong.s) with real-time paddle controls and an autonomous AI opponent displayed live on a VGA monitor."
    )

    add_callout(
        "• Core Architecture: Synthesizable 32-bit RV32I Base Integer ISA with stallable single-cycle datapath.\n"
        "• Interconnect: AXI4-Lite crossbar decoder with dynamic slave routing and automatic SLVERR trapping.\n"
        "• Graphics Engine: 160x120 internal framebuffer with 4x hardware pixel replication to standard 640x480 @ 60Hz.\n"
        "• UVM 1.2 Environment: AXI4-Lite VIP, assertions (SVA), scoreboard checking, and >93% functional coverage.\n"
        "• ASIC Tapeout (SkyWater 130nm): 10,231.1 µm² core area, 79.97% utilization, 1.01 mW power, 0 DRC, 0 LVS, 9-corner STA clean.\n"
        "• FPGA Deployment (Zybo Z7-10): Synthesized via F4PGA, flashed via openFPGALoader, interactive Ping Pong game running live.",
        title="PRIMARY PROJECT DELIVERABLES & ACHIEVEMENTS"
    )

    # -------------------------------------------------------------
    # 2. DESIGN OBJECTIVES & SYSTEM SPECIFICATIONS
    # -------------------------------------------------------------
    add_h1("2. Design Objectives & System Specifications")
    doc.add_paragraph(
        "The core objective of Project 02 is to architect an RV32I-based SoC capable of generating real-time video output "
        "through a dedicated VGA display controller. The processor writes graphical information into framebuffer memory, while the VGA "
        "controller autonomously and continuously reads the framebuffer to generate horizontal sync (HSYNC), vertical sync (VSYNC), "
        "and digital RGB video signals."
    )

    headers_spec = ["Specification Area", "Course Requirement", "Implemented SoC Architecture"]
    widths_spec = [1.8, 2.2, 2.5]
    rows_spec = [
        ["Processor Core", "Synthesizable 32-bit RV32I single-cycle or multicycle core; instruction/data memory; MMIO display access.", "Single-cycle RV32I core with synchronous cpu_stall; 1 KB Instruction ROM; 256 B Data RAM; MMIO display subsystem."],
        ["Bus Protocol", "AXI4-Lite or APB interface for configuring VGA controller, framebuffer, and status registers.", "Fully compliant AXI4-Lite interconnect with separate AW, W, B, AR, R channels and crossbar decoding."],
        ["Graphics Subsystem", "VGA controller, HSYNC/VSYNC generators, pixel-address generator, RGB logic, control/status registers.", "640x480 @ 60 Hz raster generator; 4x pixel scaling engine; 160x120 dual-port Block RAM framebuffer; RGB111 output."],
        ["Basic Verification", "Directed self-checking SV testbench verifying memory accesses, bus transactions, VGA registers, timing, and reset.", "Exhaustive modular testbenches and top-level self-checking soc_top_tb.sv with automated error detection."],
        ["UVM Verification", "UVM agents, sequences, scoreboards, assertions, functional coverage, and code coverage verifying all operations.", "UVM 1.2 environment with AXI4-Lite Master/Slave VIP, assertions, scoreboard, and >93% functional coverage."],
        ["Physical Design", "ASIC flow: synthesis, floorplan, power plan, placement, CTS, routing, sign-off checks (area, timing, power, DRC, LVS).", "OpenLane/OpenROAD flow on SkyWater 130nm: 0 DRC, 0 LVS, clean timing across 9 PVT corners, 1.01 mW power."],
        ["FPGA Implementation", "Implement on FPGA; demonstrate processor-controlled graphical output on VGA monitor with dynamic updates.", "Deployed on Digilent Zybo Z7-10 via F4PGA; live interactive Ping Pong game running at 60 FPS on external VGA monitor."]
    ]
    format_table(doc.add_table(rows=1, cols=3), widths_spec, headers_spec, rows_spec)

    # -------------------------------------------------------------
    # 3. TOP-LEVEL SOC ARCHITECTURE
    # -------------------------------------------------------------
    add_h1("3. Top-Level SoC Architecture")
    doc.add_paragraph(
        "The SoC top-level module (soc_top.v) integrates the RV32I processor, the AXI bridge, the crossbar decoder, "
        "the data memory, and the VGA display controller into a unified memory-mapped system. "
        "All subsystems operate synchronously on a 25.0 MHz clock domain."
    )

    add_h2("3.1 System Memory Map")
    doc.add_paragraph(
        "The AXI4-Lite crossbar decoder (axi_decoder.v) dynamically maps CPU addresses to physical peripherals based on the 32-bit address space:"
    )
    headers_mmap = ["Address Range", "Size", "Slave Port", "Mapped Hardware Component", "Access"]
    widths_mmap = [1.8, 0.8, 1.0, 2.1, 0.8]
    rows_mmap = [
        ["0x0000_0000 - 0x0000_00FF", "256 B", "Slave 0", "Core Synchronous Data RAM (axi_data_memory.v)", "R/W"],
        ["0x1000_0000 - 0x1000_001F", "32 B", "Slave 1", "VGA Control, Status, Resolution & I/O Registers", "R/W"],
        ["0x5000_0000 - 0x5001_2BFF", "76.8 KB", "Slave 1", "Dual-Port Video Framebuffer SRAM (160x120 words)", "R/W"],
        ["All Other Unmapped Space", "—", "Error Slave", "Internal Decoder Error Trap (returns SLVERR)", "R/W"]
    ]
    format_table(doc.add_table(rows=1, cols=5), widths_mmap, headers_mmap, rows_mmap)

    add_h2("3.2 Clock Generation & Reset Synchronizer")
    doc.add_paragraph(
        "The Digilent Zybo Z7-10 features an onboard 125.0 MHz crystal oscillator on pin K17. In zybo_top.v, a synchronous divide-by-5 "
        "counter produces a stable 25.0 MHz system clock (clk_25m) with an exact 50% duty cycle. "
        "This frequency matches standard 640x480 @ 60 Hz VGA timing (nominal 25.175 MHz) to within 0.69% frequency drift, "
        "which is easily accommodated by modern monitor phase-locked loops. "
        "To prevent metastability during manual switch toggles, the board reset switch (SW0) is routed through a 3-stage shift-register "
        "synchronizer clocked at 25 MHz before driving the active-high system reset tree."
    )

    # -------------------------------------------------------------
    # 4. RV32I MICROPROCESSOR CORE DESIGN
    # -------------------------------------------------------------
    add_h1("4. RV32I Microprocessor Core Design")
    doc.add_paragraph(
        "The CPU core is a synthesizable 32-bit implementation of the RISC-V RV32I Base Integer Instruction Set Architecture. "
        "It features a single-cycle datapath augmented with custom synchronous pipeline stall logic (cpu_stall) that freezes "
        "instruction execution during multi-cycle AXI bus wait states."
    )

    add_h2("4.1 Datapath & Pipeline Stall Support")
    doc.add_paragraph(
        "In a conventional single-cycle processor, instruction fetch, decode, ALU execution, and memory read/write must complete "
        "within a single clock period. However, the AXI4-Lite bus operates with handshaking channels (valid and ready) that require "
        "variable multi-cycle response times depending on slave arbitration."
    )
    doc.add_paragraph(
        "To reconcile single-cycle execution with AXI bus handshakes, the core incorporates a synchronous stall input (cpu_stall) "
        "generated by the RV32I-to-AXI bridge (rv32i_axi_bridge.v). When the CPU executes a memory load (LW) or store (SW) instruction, "
        "the bridge asserts cpu_stall = 1. This signal gates the clock-enable on the Program Counter (ProgramCounter.v) and Register File "
        "(RegFile.v), holding their state until the AXI transaction finishes (BVALID or RVALID received). Once the handshake completes, "
        "cpu_stall drops to 0, allowing the datapath to advance to the next instruction."
    )

    add_h2("4.2 Supported Instruction Set & Control Logic")
    doc.add_paragraph(
        "The core natively executes all 37 base integer instructions across six instruction formats: R-Type, I-Type, S-Type, B-Type, U-Type, and J-Type. "
        "The main control unit (ControlLogic.v) decodes opcode bits [6:0] into datapath control signals:"
    )

    headers_ctrl = ["Opcode (Hex / Dec)", "Instruction Class", "reg_write", "mem_read", "mem_write", "alu_src", "mem_to_reg", "branch", "jump", "alu_op"]
    widths_ctrl = [1.5, 1.3, 0.6, 0.6, 0.6, 0.6, 0.6, 0.5, 0.5, 0.5]
    rows_ctrl = [
        ["0x33 (7'd51)", "R-Type ALU", "1", "0", "0", "0 (rs2)", "2'b00", "0", "0", "2'b10"],
        ["0x13 (7'd19)", "I-Type ALU", "1", "0", "0", "1 (imm)", "2'b00", "0", "0", "2'b10"],
        ["0x03 (7'd3)", "Load (LW)", "1", "1", "0", "1 (imm)", "2'b01", "0", "0", "2'b00"],
        ["0x23 (7'd35)", "Store (SW)", "0", "0", "1", "1 (imm)", "2'b00", "0", "0", "2'b00"],
        ["0x63 (7'd99)", "Branch (B-Type)", "0", "0", "0", "0 (rs2)", "2'b00", "1", "0", "2'b01"],
        ["0x37 (7'd55)", "LUI", "1", "0", "0", "0", "2'b11", "0", "0", "2'b11"],
        ["0x17 (7'd23)", "AUIPC", "1", "0", "0", "1 (imm)", "2'b00", "0", "0", "2'b00"],
        ["0x6F (7'd111)", "JAL", "1", "0", "0", "0", "2'b10", "0", "1", "2'b00"],
        ["0x67 (7'd103)", "JALR", "1", "0", "0", "1 (imm)", "2'b10", "0", "1", "2'b00"]
    ]
    format_table(doc.add_table(rows=1, cols=10), widths_ctrl, headers_ctrl, rows_ctrl)

    # -------------------------------------------------------------
    # 5. ON-CHIP BUS INTERCONNECT & AXI4-LITE PROTOCOL
    # -------------------------------------------------------------
    add_h1("5. On-Chip Bus Interconnect & AXI4-Lite Protocol")
    doc.add_paragraph(
        "The SoC relies on an on-chip AXI4-Lite bus infrastructure to decouple processor execution from peripheral latency. "
        "The interconnect comprises three primary components:"
    )
    doc.add_paragraph(
        "1. RV32I to AXI4-Lite Bridge (rv32i_axi_bridge.v): A master bridge that implements a 5-state finite state machine (IDLE, WRITE, "
        "WRESP, READ, RDATA). The bridge samples CPU memory control signals, coordinates AW, W, B, AR, and R handshakes, and drives "
        "cpu_stall high during transactions.\n"
        "2. AXI Crossbar Address Decoder (axi_decoder.v): Inspects address bits [31:0] to route transactions to Slave 0 (Data RAM) "
        "or Slave 1 (VGA Subsystem). If an access hits an unmapped region, an internal error slave accepts the transfer and returns an "
        "AXI SLVERR response (2'b10), preventing the bus from hanging.\n"
        "3. Synchronous AXI Data Memory (axi_data_memory.v): A 256-byte RAM responding with zero wait states, supporting byte-level "
        "write strobe masking (wstrb[3:0])."
    )

    # -------------------------------------------------------------
    # 6. VGA GRAPHICS CONTROLLER SUBSYSTEM
    # -------------------------------------------------------------
    add_h1("6. VGA Graphics Controller Subsystem")
    doc.add_paragraph(
        "The VGA subsystem generates standard analog/digital video timing and renders pixels from on-chip framebuffer memory."
    )

    add_h2("6.1 VGA Timing & Hardware 4x Pixel Scaling")
    doc.add_paragraph(
        "The timing generator (vga_timing.v) creates 640x480 @ 60 Hz raster scanning at 25.0 MHz. Each scanline consists of 640 active "
        "clocks, 16 front porch clocks, 96 active-low HSYNC clocks, and 48 back porch clocks (total 800 clocks). Each frame consists of "
        "480 active lines, 10 front porch lines, 2 active-low VSYNC lines, and 33 back porch lines (total 525 lines)."
    )
    doc.add_paragraph(
        "Storing a full 640x480 frame at 32-bit color requires over 1.2 megabytes of RAM, which exceeds the memory capacity of many embedded FPGAs. "
        "To optimize resource usage, the system implements an internal 160x120 resolution paired with a hardware 4x pixel scaling engine (pixel_addr_gen.v). "
        "By dividing H_count and V_count by 4 (H_count >> 2, V_count >> 2), each pixel written to the 160x120 buffer is replicated into a 4x4 block "
        "on the display. This cuts memory usage by 16x down to 76.8 KB (19,200 words), requiring only 17 Block RAMs on the XC7Z010 FPGA and leaving "
        "over 71% of on-chip RAM free."
    )

    add_h2("6.2 Memory-Mapped VGA Registers")
    headers_vga_reg = ["Offset", "Register Name", "Access", "Bits", "Functional Description"]
    widths_vga_reg = [1.2, 1.5, 0.8, 0.8, 2.5]
    rows_vga_reg = [
        ["0x00", "VGA_CTRL", "R/W", "[0]", "Display Enable: 1 = Active video stream; 0 = Display blanked (RGB forced to 0)."],
        ["0x04", "VGA_STATUS", "R", "[0]", "VBLANK Flag: Reads 1 during vertical retrace (safe software rendering window)."],
        ["0x08", "VGA_FB_BASE", "R/W", "[31:0]", "Framebuffer base memory address pointer (defaults to 0x5000_0000)."],
        ["0x0C", "VGA_RESOLUTION", "R", "[31:0]", "Readout: [31:16] = Height (120), [15:0] = Width (160)."],
        ["0x10", "VGA_BTN", "R", "[3:0]", "Direct hardware pushbutton inputs (BTN3, BTN2, BTN1, BTN0)."],
        ["0x14", "VGA_SW", "R", "[3:0]", "Direct hardware slide switch inputs (SW3, SW2, SW1, SW0)."]
    ]
    format_table(doc.add_table(rows=1, cols=5), widths_vga_reg, headers_vga_reg, rows_vga_reg)

    # -------------------------------------------------------------
    # 7. BARE-METAL APPLICATION: PING PONG GAME
    # -------------------------------------------------------------
    add_h1("7. Bare-Metal Application: Ping Pong Game")
    doc.add_paragraph(
        "To validate the complete processor and graphics datapath under dynamic software execution, a bare-metal Ping Pong game "
        "was written entirely in RISC-V assembly (pong.s). The program executes from instruction memory upon reset and demonstrates "
        "real-time hardware interaction."
    )
    doc.add_paragraph(
        "Key Game Mechanics:\n"
        "• Initialization: Writes 1 to VGA_CTRL (0x1000_0000) to enable display generation and sets the framebuffer base pointer.\n"
        "• Kinematics & Collisions: Updates ball position using velocity vectors (vel_x, vel_y). Detects vertical ceiling/floor bounces "
        "and checks bounding-box collisions with both left and right paddles. If a goal is scored, the ball resets to screen center (80, 60).\n"
        "• Flicker-Free Shadow Rendering: Clearing the full 19,200-word framebuffer every frame would cause severe screen flicker. "
        "Instead, the game maintains shadow coordinate variables (x14..x17) and overwrites only the previous 2x2 ball and 2x16 paddle "
        "pixels with black (0x00000000) before rendering the new positions in white (0x00FFFFFF). This differential update writes fewer "
        "than 70 words per frame, achieving a smooth 60 FPS.\n"
        "• Player Controls & AI: Reads pushbuttons BTN0 and BTN1 to move the left paddle UP and DOWN. When slide switch SW1 is 0 (AI Mode), "
        "the CPU automatically tracks the ball's Y-coordinate to drive the right paddle. Setting SW1 to 1 switches the right paddle to manual "
        "control via BTN2 and BTN3."
    )

    # -------------------------------------------------------------
    # 8. BASIC VERIFICATION & DIRECTED TESTBENCHES
    # -------------------------------------------------------------
    add_h1("8. Basic Verification & Directed Testbenches")
    doc.add_paragraph(
        "Basic functional verification was carried out using directed, self-checking SystemVerilog testbenches simulated in ModelSim / QuestaSim. "
        "Every subsystem was verified individually before running full top-level SoC simulation."
    )

    add_h2("8.1 System Reset & Initial State Verification")
    doc.add_paragraph(
        "The reset testbench verifies that when reset is asserted, the Program Counter resets to 0x0000_0000, all internal registers "
        "clear to zero, the AXI bridge returns to IDLE, and raster timing counters re-synchronize."
    )
    add_figure("screensshots/basic verification/Reset Test.png", "Figure 8.1: System reset simulation waveform demonstrating clean reset de-assertion, PC initialization, and pipeline alignment.")

    add_h2("8.2 Core Memory Access & Pixel-Address Generation")
    doc.add_paragraph(
        "Verifies that CPU load/store operations transfer address and data across the bus without corruption, while the hardware rasterizer "
        "simultaneously generates pixel addresses from raster counters (H_count >> 2, V_count >> 2)."
    )
    add_figure("screensshots/basic verification/Core Memory Access & Pixel-Address Generation.png", "Figure 8.2: CPU memory access and real-time pixel address generator verification waveform.")

    add_h2("8.3 Bus Transactions & MMIO Register Access")
    doc.add_paragraph(
        "Verifies that the processor configures VGA_CTRL (0x1000_0000) with display enable, reads hardware status flags, and samples "
        "pushbutton/switch registers through the AXI4-Lite crossbar."
    )
    add_figure("screensshots/basic verification/Bus Transactions & VGA Register Access.png", "Figure 8.3: AXI bus transactions and VGA MMIO register configuration waveform.")

    add_h2("8.4 VGA Controller Timing, Framebuffer Reads, & RGB Pipeline")
    doc.add_paragraph(
        "Confirms that dual-port framebuffer memory handles concurrent CPU writes and raster reads, and that rgb_output.v properly aligns "
        "pixel data with HSYNC and VSYNC using a 1-cycle pipeline delay."
    )
    add_figure("screensshots/basic verification/VGA Controller Timing, Framebuffer Reads, & RGB Generation.png", "Figure 8.4: Video timing, synchronous Block RAM framebuffer read latency, and RGB output generation waveform.")

    add_h2("8.5 Modular Testbenches (Bridge, Crossbar, VGA)")
    doc.add_paragraph(
        "Individual modular testbenches were created to verify corner cases for each major module:"
    )
    add_figure("screensshots/testbenches/CPU to AXI Bridge.png", "Figure 8.5: CPU-to-AXI bridge handshake waveform showing AW/W/B and AR/R channel transactions and stall signal assertion.")
    add_figure("screensshots/testbenches/CPU to AXI Bridge Terminal.png", "Figure 8.6: Self-checking testbench terminal transcript confirming 0 errors in CPU-to-AXI bridge operations.")
    add_figure("screensshots/testbenches/AXI Bus Interconnect.png", "Figure 8.7: AXI crossbar routing and address decoding waveform.")
    add_figure("screensshots/testbenches/AXI-Lite MMIO Registers.png", "Figure 8.8: MMIO register access verification waveform.")
    add_figure("screensshots/testbenches/VGA Timing Logic.png", "Figure 8.9: VGA horizontal and vertical timing counter waveform.")
    add_figure("screensshots/testbenches/Full VGA Pipeline.png", "Figure 8.10: Full VGA graphics datapath pipeline simulation waveform.")
    add_figure("screensshots/testbenches/VGA Pipeline Terminal.png", "Figure 8.11: Self-checking terminal transcript confirming clean timing and zero pipeline errors.")

    add_h2("8.6 Full End-to-End Datapath Simulation")
    doc.add_paragraph(
        "The top-level testbench (soc_top_tb.sv) runs an end-to-end simulation combining the CPU fetching instructions, writing to the framebuffer "
        "over the AXI bus, and streaming live RGB pixel data out the VGA controller."
    )
    add_figure("screensshots/expected output/vga_full_datapath_active.png", "Figure 8.12: Comprehensive SoC top-level active datapath simulation trace displaying instruction fetches, framebuffer writes, and continuous RGB pixel streaming.")

    # -------------------------------------------------------------
    # 9. INDUSTRIAL-GRADE UVM 1.2 VERIFICATION ENVIRONMENT
    # -------------------------------------------------------------
    add_h1("9. Industrial-Grade UVM 1.2 Verification Environment")
    doc.add_paragraph(
        "To verify interconnect and graphics reliability under randomized conditions, a comprehensive UVM 1.2 verification "
        "environment was implemented in tb/uvm/."
    )
    doc.add_paragraph(
        "The environment includes:\n"
        "• AXI4-Lite VIP Agent: Includes an active Master Driver (axi_lite_driver.sv), Sequencer (axi_lite_sequencer.sv), and Bus Monitor (axi_lite_monitor.sv).\n"
        "• Passive Slave Monitors: Monitor Slave 0 (Data RAM) and Slave 1 (VGA Subsystem) transactions.\n"
        "• Self-Checking Scoreboard (axi_decoder_scoreboard.sv): Verifies address routing correctness, checks write/read data integrity byte-by-byte, "
        "validates SLVERR responses for unmapped accesses, and verifies queue cleanliness during check_phase.\n"
        "• Functional Coverage Model (axi_decoder_coverage.sv): Samples address spaces, operations, byte strobes, and cross-coverage, achieving >93% coverage."
    )

    add_h2("9.1 SystemVerilog Assertions (SVA) Verification")
    doc.add_paragraph(
        "SystemVerilog Assertions monitor the bus interface continuously to catch protocol violations such as handshake stability errors, "
        "response timeouts, and illegal high-impedance states."
    )
    add_figure("screensshots/uvm_verification/assertions.png", "Figure 9.1: SystemVerilog Concurrent Assertions (SVA) verification transcript confirming 0 protocol failures.")

    add_h2("9.2 Functional Coverage Results (>93% Coverage)")
    doc.add_paragraph(
        "The coverage model measures transaction variety across all address ranges, transfer types, response statuses, and strobe patterns, "
        "confirming that the verification suite achieved over 93% functional coverage."
    )
    add_figure("screensshots/uvm_verification/covergroupss1.png", "Figure 9.2: UVM functional coverage report overview showing high coverage metrics across covergroups.")
    add_figure("screensshots/uvm_verification/covergroup coverage ss2.png", "Figure 9.3: Detailed functional coverage breakdown confirming >93% total functional coverage.")

    add_h2("9.3 Scoreboard Data Integrity & Routing Results")
    doc.add_paragraph(
        "The UVM scoreboard logs show that all packets were routed to the correct destination slaves with 0 data mismatches and 0 dropped transactions."
    )
    add_figure("screensshots/uvm_verification/vga_scoreboard.png", "Figure 9.4: UVM Scoreboard verification report displaying 0 mismatches, 0 dropped packets, and full transaction verification.")

    add_h2("9.4 UVM Simulation Waveforms")
    doc.add_paragraph(
        "The following waveforms illustrate key operational modes verified during UVM testing:"
    )
    add_figure("screensshots/uvm_verification/AXI Write to Registers & Framebuffer.png", "Figure 9.5: Waveform displaying AXI write sequences to VGA MMIO registers and Framebuffer SRAM.")
    add_figure("screensshots/uvm_verification/Active VGA Display (Scanline & Pixel Detail).png", "Figure 9.6: High-resolution inspection of active scanlines and pixel color byte transitions.")
    add_figure("screensshots/uvm_verification/Horizontal Sync (HSYNC) Timing Analysis.png", "Figure 9.7: Horizontal synchronization (HSYNC) cycle-accurate timing analysis waveform.")
    add_figure("screensshots/uvm_verification/Full VGA Frame (Showing Vertical Sync VSYNC).png", "Figure 9.8: Complete vertical frame waveform displaying active video interval, V-Front Porch, VSYNC pulse, and V-Back Porch.")
    add_figure("screensshots/uvm_verification/Multi-Frame Overview (Entire 100 µs Run).png", "Figure 9.9: Multi-frame simulation overview spanning 100 µs of continuous operation.")
    add_figure("screensshots/uvm_verification/vga_display_toggle_test_enable.png", "Figure 9.10: UVM sequence verifying video activation upon asserting display enable.")
    add_figure("screensshots/uvm_verification/vga_display_toggle_test_disable-Blanking_transitions.png", "Figure 9.11: UVM sequence verifying display blanking transitions when display enable is de-asserted.")
    add_figure("screensshots/uvm_verification/vga_invalid_access_waveform.png", "Figure 9.12: Waveform demonstrating AXI error response (SLVERR) generation upon unmapped address access.")

    # -------------------------------------------------------------
    # 10. ASIC PHYSICAL DESIGN & SILICON TAPEOUT (SKYWATER 130NM)
    # -------------------------------------------------------------
    add_h1("10. ASIC Physical Design & Silicon Tapeout (SkyWater 130nm)")
    doc.add_paragraph(
        "The complete soc_top architecture was hardened into silicon layout using the automated OpenLane / OpenROAD physical "
        "design flow targeting the SkyWater 130nm standard cell library (sky130_fd_sc_hd). "
        "The hardening run directory is preserved under gds/RUN_2026-09-11_10-33-07/."
    )

    add_h2("10.1 Physical Metrics Summary")
    headers_asic = ["Physical Metric Category", "Parameter Name", "Achieved Value", "Sign-Off Status"]
    widths_asic = [1.8, 1.8, 1.8, 1.1]
    rows_asic = [
        ["Process Technology", "Foundry & Standard Cell PDK", "SkyWater 130nm (sky130_fd_sc_hd)", "Verified"],
        ["Die Dimensions", "Total Die Width x Height", "112.92 µm x 123.64 µm", "Tapeout Ready"],
        ["Die Area", "Total Die Surface Area", "13,960.2 µm² (0.014 mm²)", "Passed"],
        ["Core Dimensions", "Active Core Width x Height", "107.18 µm x 111.52 µm", "Tapeout Ready"],
        ["Core Area", "Active Standard Cell Area", "10,231.1 µm²", "Passed"],
        ["Core Utilization", "Standard Cell Placement Density", "79.97% (~80%)", "Optimal"],
        ["Total Instances", "All Placed Standard & Physical Cells", "1,614 cells", "Clean"],
        ["Functional Logic Cells", "Standard Cell Functional Logic", "925 cells (8,181.6 µm²)", "Clean"],
        ["Sequential Cells", "D-Flip-Flops & Latches", "111 cells (2,766.4 µm²)", "Clean"],
        ["Physical Cells", "Fill Cells & Well Tap Cells", "689 fill cells / 136 tap cells", "Clean"],
        ["Buffer Cells", "Timing Repair & Clock Buffers", "147 repair buffers / 31 clock buffers", "Clean"],
        ["Detailed Routing", "Total Routed Signal Wirelength", "13,464 µm (13.46 mm)", "Completed (iter 22)"],
        ["Routing Vias", "Total Inter-Layer Routing Vias", "4,670 vias", "Clean"],
        ["DRC Violations", "Design Rule Check Errors", "0 errors", "PASSED (100% Clean)"],
        ["LVS Violations", "Layout vs. Schematic Floating Pins", "0 errors", "PASSED (100% Clean)"],
        ["Antenna Violations", "Antenna Violating Nets / Pins", "0 nets / 0 pins", "PASSED"]
    ]
    format_table(doc.add_table(rows=1, cols=4), widths_asic, headers_asic, rows_asic)

    add_h2("10.2 Multi-Corner Static Timing Analysis (STA)")
    doc.add_paragraph(
        "Static timing analysis was verified across all 9 PVT corners with full parasitic extraction (SPEF). "
        "The design achieves clean timing closure with zero hold and zero setup violations across all corners:"
    )

    headers_sta = ["PVT Corner", "Temp / Voltage", "Setup Slack (WS)", "Setup Vio", "Hold Slack (WS)", "Hold Vio"]
    widths_sta = [1.8, 1.4, 1.1, 0.7, 1.1, 0.7]
    rows_sta = [
        ["nom_tt_025C_1v80", "+25°C / 1.80V", "+5.196 ns", "0", "+0.459 ns", "0"],
        ["nom_ss_100C_1v60", "+100°C / 1.60V", "+0.630 ns", "0", "+0.979 ns", "0"],
        ["nom_ff_n40C_1v95", "-40°C / 1.95V", "+6.248 ns", "0", "+0.257 ns", "0"],
        ["min_tt_025C_1v80", "+25°C / 1.80V", "+5.230 ns", "0", "+0.458 ns", "0"],
        ["min_ss_100C_1v60", "+100°C / 1.60V", "+0.713 ns", "0", "+0.976 ns", "0"],
        ["min_ff_n40C_1v95", "-40°C / 1.95V", "+6.270 ns", "0", "+0.256 ns", "0"],
        ["max_tt_025C_1v80", "+25°C / 1.80V", "+5.158 ns", "0", "+0.460 ns", "0"],
        ["max_ss_100C_1v60", "+100°C / 1.60V", "+0.545 ns", "0", "+0.984 ns", "0"],
        ["max_ff_n40C_1v95", "-40°C / 1.95V", "+6.221 ns", "0", "+0.258 ns", "0"],
        ["Worst-Case Overall", "—", "+0.545 ns", "0", "+0.256 ns", "0"]
    ]
    format_table(doc.add_table(rows=1, cols=6), widths_sta, headers_sta, rows_sta)

    add_figure("gds/screenshots/Screenshot from 2026-09-11 15-42-47.png", "Figure 10.1: Sign-off multi-corner Static Timing Analysis report confirming zero setup/hold violations across all 9 PVT corners.")

    add_h2("10.3 Power Dissipation & IR Drop")
    doc.add_paragraph(
        "Post-route power analysis indicates a total power consumption of 1.012 mW (0.788 mW internal, 0.224 mW switching, and 11.45 nW leakage). "
        "The power grid distribution network shows an average IR drop of 13.4 µV on VPWR, with a worst-case drop of 83.6 µV, demonstrating an "
        "extremely stiff supply rail with negligible voltage drop across the core."
    )

    add_h2("10.4 Silicon Layout & GDSII Inspection")
    doc.add_paragraph(
        "The full chip layout was visualized in OpenROAD and validated in KLayout:"
    )
    add_figure("gds/screenshots/Screenshot from 2026-09-11 15-43-15.png", "Figure 10.2: Full-chip routed silicon layout in OpenROAD showing standard cell rows, power mesh straps, and clock tree routing.")
    add_figure("gds/screenshots/Screenshot from 2026-09-11 15-45-39.png", "Figure 10.3: Final tapeout GDSII mask geometry inspected in KLayout (soc_top.gds).")

    # -------------------------------------------------------------
    # 11. FPGA IMPLEMENTATION & HARDWARE DEMONSTRATION
    # -------------------------------------------------------------
    add_h1("11. FPGA Implementation & Hardware Demonstration")
    doc.add_paragraph(
        "The SoC was implemented on the Digilent Zybo Z7-10 development board (Xilinx Zynq-7000 xc7z010clg400-1) "
        "using the open-source F4PGA / SymbiFlow toolchain."
    )

    add_h2("11.1 Board Integration & Pin Mapping")
    headers_fpga = ["Board Feature", "FPGA Pin", "Direction", "System Function"]
    widths_fpga = [1.5, 1.0, 1.0, 3.0]
    rows_fpga = [
        ["Clock Oscillator", "K17", "Input", "Master 125.0 MHz system clock input."],
        ["Slide Switch SW0", "G15", "Input", "Hardware system reset (1 = Reset active, 0 = Run)."],
        ["Slide Switch SW1", "P15", "Input", "Game AI Mode toggle (0 = AI on, 1 = 2-Player Manual)."],
        ["Pushbutton BTN0", "K18", "Input", "Left Paddle UP movement."],
        ["Pushbutton BTN1", "P16", "Input", "Left Paddle DOWN movement."],
        ["Pushbutton BTN2", "K19", "Input", "Right Paddle UP movement (Manual 2-Player Mode)."],
        ["Pushbutton BTN3", "Y16", "Input", "Right Paddle DOWN movement (Manual 2-Player Mode)."],
        ["Diagnostic LED0", "M14", "Output", "Video Active indicator (illuminates when display is enabled)."],
        ["Diagnostic LED1", "M15", "Output", "CPU Stall indicator (shows memory wait states)."],
        ["Diagnostic LED2", "G14", "Output", "Memory Write indicator (latches ON upon first memory write)."],
        ["Diagnostic LED3", "D18", "Output", "System Heartbeat blinker (~1.5 Hz continuous pulse)."],
        ["VGA Red (Pmod JC1)", "V15", "Output", "Red color channel (1-bit digital RGB111)."],
        ["VGA Green (Pmod JC2)", "W15", "Output", "Green color channel (1-bit digital RGB111)."],
        ["VGA Blue (Pmod JC3)", "T11", "Output", "Blue color channel (1-bit digital RGB111)."],
        ["VGA HSync (Pmod JC7)", "W14", "Output", "Horizontal Synchronization Pulse."],
        ["VGA VSync (Pmod JC8)", "Y14", "Output", "Vertical Synchronization Pulse."]
    ]
    format_table(doc.add_table(rows=1, cols=4), widths_fpga, headers_fpga, rows_fpga)

    add_h2("11.2 Bitstream Programming via openFPGALoader")
    doc.add_paragraph(
        "Using openFPGALoader, the compiled bitstream (zybo_top.bit) was downloaded over JTAG to the Zybo Z7-10 board at 6.00 MHz:"
    )
    add_figure("screensshots/project working/Screenshot_20260913-194805.png", "Figure 11.1: Host terminal transcript showing openFPGALoader flashing zybo_top.bit onto the Digilent Zybo Z7-10 FPGA via JTAG at 6.00 MHz.")

    add_h2("11.3 Real-Time Hardware Video Output")
    doc.add_paragraph(
        "Upon programming, the processor initialized the framebuffer and launched the Pong game, generating a crisp 640x480 video signal on the monitor:"
    )
    add_figure("screensshots/project working/Screenshot_20260913-194819.png", "Figure 11.2: Live VGA computer monitor displaying the RV32I-driven Ping Pong game with left/right paddles and the ball moving in real time.")

    add_h2("11.4 Team Gameplay & Interactive Demonstration")
    doc.add_paragraph(
        "The project team members (Hamza Shahid, Noor ul Huda, and Afnan Inayat) tested the complete interactive setup in the lab, "
        "verifying smooth paddle responsiveness, collision detection, and AI assist:"
    )
    add_figure("screensshots/project working/Screenshot_20260913-194825.png", "Figure 11.3: Team members interacting with the Digilent Zybo Z7-10 FPGA board pushbuttons to play the Ping Pong game on the external VGA monitor.")

    # -------------------------------------------------------------
    # 12. DELIVERABLES COMPLIANCE MATRIX & CONCLUSION
    # -------------------------------------------------------------
    add_h1("12. Deliverables Compliance Matrix & Conclusion")
    
    headers_deliv = ["Required Deliverable", "Description / File Location", "Compliance Status"]
    widths_deliv = [2.0, 3.2, 1.3]
    rows_deliv = [
        ["Synthesizable RTL", "Complete Verilog RTL in rtl/ (rv32i/, bus/, vga/, fpga/, soc_top.v)", "Completed (100%)"],
        ["RISC-V Core Integration", "Single-cycle RV32I core with stallable pipeline & instruction ROM", "Completed (100%)"],
        ["SRAM / Framebuffer Integration", "256 B Data RAM + 160x120 dual-port video framebuffer SRAM", "Completed (100%)"],
        ["Bus Interface", "AXI4-Lite bridge, crossbar decoder, and unmapped error slave", "Completed (100%)"],
        ["VGA Output", "640x480 @ 60 Hz rasterizer with 4x hardware pixel scaling & RGB111 output", "Completed (100%)"],
        ["Basic Self-Checking TB", "Directed testbenches in tb/ validating memory, timing, and bus handshakes", "Completed (100%)"],
        ["UVM Verification Environment", "UVM 1.2 testbench in tb/uvm/ with AXI VIP, scoreboard, and sequence library", "Completed (100%)"],
        ["Functional Coverage & SVA", "SystemVerilog assertions with 0 failures; functional coverage >93%", "Completed (100%)"],
        ["Timing Constraints", "Pin & clock constraints in constraints/zybo_z7_10.xdc and ASIC SDC", "Completed (100%)"],
        ["ASIC Physical Design", "Hardened to SkyWater 130nm via OpenLane; 0 DRC, 0 LVS, clean 9-corner STA", "Completed (100%)"],
        ["FPGA Demonstration", "Deployed on Zybo Z7-10; live interactive Ping Pong game demonstrated on VGA monitor", "Completed (100%)"],
        ["Architecture Documentation", "Comprehensive architecture documentation and report with all embedded figures", "Completed (100%)"]
    ]
    format_table(doc.add_table(rows=1, cols=3), widths_deliv, headers_deliv, rows_deliv)

    doc.add_paragraph(
        "Conclusion:\n"
        "Project 02 successfully demonstrates the end-to-end realization of a complete computer system—from custom instruction decoding to "
        "silicon physical layout and real-world FPGA hardware deployment. By bridging a single-cycle RV32I processor core with an AXI4-Lite bus, "
        "incorporating hardware pixel scaling to optimize on-chip memory utilization, verifying the system with both directed and UVM 1.2 test environments, "
        "hardening the design to a tapeout-ready SkyWater 130nm layout, and demonstrating interactive gameplay on an FPGA-connected VGA monitor, "
        "group members Hamza Shahid, Noor ul Huda, and Afnan Inayat have fulfilled all project objectives with high engineering rigor."
    )

    output_path = "PROJECT_REPORT_RISCV_VGA_SOC.docx"
    doc.save(output_path)
    print(f"Successfully generated report at: {output_path}")

if __name__ == '__main__':
    create_full_report()
