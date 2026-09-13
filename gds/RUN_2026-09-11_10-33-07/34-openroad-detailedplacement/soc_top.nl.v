module soc_top (Hsync,
    Vsync,
    clk,
    cpu_stall,
    display_enable,
    mem_read,
    mem_write,
    reset,
    blue,
    green,
    mem_addr,
    mem_wdata,
    pcRegister,
    red);
 output Hsync;
 output Vsync;
 input clk;
 output cpu_stall;
 output display_enable;
 output mem_read;
 output mem_write;
 input reset;
 output [7:0] blue;
 output [7:0] green;
 output [31:0] mem_addr;
 output [31:0] mem_wdata;
 output [31:0] pcRegister;
 output [7:0] red;

 wire net2;
 wire net3;
 wire _0000_;
 wire _0001_;
 wire _0002_;
 wire _0003_;
 wire _0004_;
 wire _0005_;
 wire _0006_;
 wire _0007_;
 wire _0008_;
 wire _0009_;
 wire _0010_;
 wire _0011_;
 wire _0012_;
 wire _0013_;
 wire _0014_;
 wire _0015_;
 wire _0016_;
 wire _0017_;
 wire _0018_;
 wire _0019_;
 wire _0020_;
 wire _0021_;
 wire _0022_;
 wire _0023_;
 wire _0024_;
 wire _0025_;
 wire _0026_;
 wire _0027_;
 wire _0028_;
 wire _0029_;
 wire _0030_;
 wire _0031_;
 wire _0032_;
 wire _0033_;
 wire _0034_;
 wire _0035_;
 wire _0036_;
 wire _0037_;
 wire _0038_;
 wire _0039_;
 wire _0040_;
 wire _0041_;
 wire _0042_;
 wire _0043_;
 wire _0044_;
 wire _0045_;
 wire _0046_;
 wire _0047_;
 wire _0048_;
 wire _0049_;
 wire _0050_;
 wire _0051_;
 wire _0052_;
 wire _0053_;
 wire _0054_;
 wire _0055_;
 wire _0056_;
 wire _0057_;
 wire _0058_;
 wire _0059_;
 wire _0060_;
 wire _0061_;
 wire _0062_;
 wire _0063_;
 wire _0064_;
 wire _0065_;
 wire _0066_;
 wire _0067_;
 wire _0068_;
 wire _0069_;
 wire _0070_;
 wire _0071_;
 wire _0072_;
 wire _0073_;
 wire _0074_;
 wire _0075_;
 wire _0076_;
 wire _0077_;
 wire _0078_;
 wire _0079_;
 wire _0080_;
 wire _0081_;
 wire _0082_;
 wire _0083_;
 wire _0084_;
 wire _0085_;
 wire _0086_;
 wire _0087_;
 wire _0088_;
 wire _0089_;
 wire _0090_;
 wire _0091_;
 wire _0092_;
 wire _0093_;
 wire _0094_;
 wire _0095_;
 wire _0096_;
 wire _0097_;
 wire _0098_;
 wire _0099_;
 wire _0100_;
 wire _0101_;
 wire _0102_;
 wire _0103_;
 wire _0104_;
 wire _0105_;
 wire _0106_;
 wire _0107_;
 wire _0108_;
 wire _0109_;
 wire _0110_;
 wire _0111_;
 wire _0112_;
 wire _0113_;
 wire _0114_;
 wire _0115_;
 wire _0116_;
 wire _0117_;
 wire _0118_;
 wire _0119_;
 wire _0120_;
 wire _0121_;
 wire _0122_;
 wire _0123_;
 wire _0124_;
 wire _0125_;
 wire _0126_;
 wire _0127_;
 wire _0128_;
 wire _0129_;
 wire _0130_;
 wire _0131_;
 wire _0132_;
 wire _0133_;
 wire _0134_;
 wire _0135_;
 wire _0136_;
 wire _0137_;
 wire _0138_;
 wire _0139_;
 wire _0140_;
 wire _0141_;
 wire _0142_;
 wire _0143_;
 wire _0144_;
 wire _0145_;
 wire _0146_;
 wire _0147_;
 wire _0148_;
 wire _0149_;
 wire _0150_;
 wire _0151_;
 wire _0152_;
 wire _0153_;
 wire _0154_;
 wire _0155_;
 wire _0156_;
 wire _0157_;
 wire _0158_;
 wire _0159_;
 wire _0160_;
 wire _0161_;
 wire _0162_;
 wire _0163_;
 wire _0164_;
 wire _0165_;
 wire _0166_;
 wire _0167_;
 wire _0168_;
 wire _0169_;
 wire _0170_;
 wire _0171_;
 wire _0172_;
 wire _0173_;
 wire _0174_;
 wire _0175_;
 wire _0176_;
 wire _0177_;
 wire _0178_;
 wire _0179_;
 wire _0180_;
 wire _0181_;
 wire _0182_;
 wire _0183_;
 wire _0184_;
 wire _0185_;
 wire _0186_;
 wire _0187_;
 wire _0188_;
 wire _0189_;
 wire _0190_;
 wire _0191_;
 wire _0192_;
 wire _0193_;
 wire _0194_;
 wire _0195_;
 wire _0196_;
 wire _0197_;
 wire _0198_;
 wire _0199_;
 wire _0200_;
 wire _0201_;
 wire _0202_;
 wire _0203_;
 wire _0204_;
 wire _0205_;
 wire _0206_;
 wire _0207_;
 wire _0208_;
 wire _0209_;
 wire _0210_;
 wire _0211_;
 wire _0212_;
 wire _0213_;
 wire _0214_;
 wire _0215_;
 wire _0216_;
 wire _0217_;
 wire _0218_;
 wire _0219_;
 wire _0220_;
 wire _0221_;
 wire _0222_;
 wire _0223_;
 wire _0224_;
 wire _0225_;
 wire _0226_;
 wire _0227_;
 wire _0228_;
 wire _0229_;
 wire _0230_;
 wire _0231_;
 wire _0232_;
 wire _0233_;
 wire _0234_;
 wire _0235_;
 wire _0236_;
 wire _0237_;
 wire _0238_;
 wire _0239_;
 wire _0240_;
 wire _0241_;
 wire _0242_;
 wire _0243_;
 wire _0244_;
 wire _0245_;
 wire _0246_;
 wire _0247_;
 wire _0248_;
 wire _0249_;
 wire _0250_;
 wire _0251_;
 wire _0252_;
 wire _0253_;
 wire _0254_;
 wire _0255_;
 wire _0256_;
 wire _0257_;
 wire _0258_;
 wire _0259_;
 wire _0260_;
 wire _0261_;
 wire _0262_;
 wire _0263_;
 wire _0264_;
 wire _0265_;
 wire _0266_;
 wire _0267_;
 wire _0268_;
 wire _0269_;
 wire _0270_;
 wire _0271_;
 wire _0272_;
 wire _0273_;
 wire _0274_;
 wire _0275_;
 wire _0276_;
 wire _0277_;
 wire _0278_;
 wire _0279_;
 wire _0280_;
 wire _0281_;
 wire _0282_;
 wire _0283_;
 wire _0284_;
 wire _0285_;
 wire _0286_;
 wire _0287_;
 wire _0288_;
 wire _0289_;
 wire _0290_;
 wire _0291_;
 wire _0292_;
 wire _0293_;
 wire _0294_;
 wire _0295_;
 wire _0296_;
 wire _0297_;
 wire _0298_;
 wire _0299_;
 wire _0300_;
 wire _0301_;
 wire _0302_;
 wire _0303_;
 wire _0304_;
 wire _0305_;
 wire _0306_;
 wire _0307_;
 wire _0308_;
 wire _0309_;
 wire _0310_;
 wire _0311_;
 wire _0312_;
 wire _0313_;
 wire _0314_;
 wire _0315_;
 wire _0316_;
 wire _0317_;
 wire _0318_;
 wire _0319_;
 wire _0320_;
 wire _0321_;
 wire _0322_;
 wire _0323_;
 wire _0324_;
 wire _0325_;
 wire _0326_;
 wire _0327_;
 wire _0328_;
 wire _0329_;
 wire _0330_;
 wire _0331_;
 wire _0332_;
 wire _0333_;
 wire _0334_;
 wire _0335_;
 wire _0336_;
 wire _0337_;
 wire _0338_;
 wire _0339_;
 wire _0340_;
 wire _0341_;
 wire _0342_;
 wire _0343_;
 wire _0344_;
 wire _0345_;
 wire _0346_;
 wire _0347_;
 wire _0348_;
 wire _0349_;
 wire _0350_;
 wire _0351_;
 wire _0352_;
 wire _0353_;
 wire _0354_;
 wire _0355_;
 wire _0356_;
 wire _0357_;
 wire _0358_;
 wire _0359_;
 wire _0360_;
 wire _0361_;
 wire _0362_;
 wire _0363_;
 wire _0364_;
 wire _0365_;
 wire _0366_;
 wire _0367_;
 wire _0368_;
 wire _0369_;
 wire _0370_;
 wire _0371_;
 wire _0372_;
 wire _0373_;
 wire _0374_;
 wire _0375_;
 wire _0376_;
 wire _0377_;
 wire _0378_;
 wire _0379_;
 wire _0380_;
 wire _0381_;
 wire _0382_;
 wire _0383_;
 wire _0384_;
 wire _0385_;
 wire _0386_;
 wire _0387_;
 wire _0388_;
 wire _0389_;
 wire _0390_;
 wire _0391_;
 wire _0392_;
 wire _0393_;
 wire _0394_;
 wire _0395_;
 wire _0396_;
 wire _0397_;
 wire _0398_;
 wire _0399_;
 wire _0400_;
 wire _0401_;
 wire _0402_;
 wire _0403_;
 wire net64;
 wire net65;
 wire net66;
 wire net67;
 wire net68;
 wire net69;
 wire net70;
 wire net71;
 wire net4;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net80;
 wire m_axi_arready;
 wire m_axi_arvalid;
 wire m_axi_awvalid;
 wire m_axi_bready;
 wire m_axi_rready;
 wire m_axi_wvalid;
 wire net81;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;
 wire net100;
 wire net82;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net110;
 wire net83;
 wire net111;
 wire net112;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net88;
 wire net89;
 wire net90;
 wire net113;
 wire net114;
 wire net124;
 wire net125;
 wire net126;
 wire net127;
 wire net128;
 wire net129;
 wire net130;
 wire net131;
 wire net132;
 wire net133;
 wire net115;
 wire net134;
 wire net135;
 wire net136;
 wire net137;
 wire net138;
 wire net139;
 wire net140;
 wire net141;
 wire net142;
 wire net143;
 wire net116;
 wire net144;
 wire net145;
 wire net117;
 wire net118;
 wire net119;
 wire net120;
 wire net121;
 wire net122;
 wire net123;
 wire net146;
 wire net147;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net148;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net149;
 wire net150;
 wire net151;
 wire net152;
 wire net153;
 wire net154;
 wire net155;
 wire net1;
 wire s0_axi_bvalid;
 wire s0_axi_rvalid;
 wire s1_axi_arready;
 wire s1_axi_awready;
 wire s1_axi_bvalid;
 wire s1_axi_rvalid;
 wire s1_axi_wready;
 wire \u_axi_bridge.state[0] ;
 wire \u_axi_bridge.state[1] ;
 wire \u_axi_bridge.state[2] ;
 wire \u_axi_decoder.aw_latched ;
 wire \u_axi_decoder.rd_state[1] ;
 wire \u_axi_decoder.rd_state[2] ;
 wire \u_axi_decoder.rd_state[3] ;
 wire \u_axi_decoder.rd_state[4] ;
 wire \u_axi_decoder.rd_target_owner[1] ;
 wire \u_axi_decoder.rd_target_owner[2] ;
 wire \u_axi_decoder.s0_arvalid_reg ;
 wire \u_axi_decoder.s0_awvalid_reg ;
 wire \u_axi_decoder.s0_wvalid_reg ;
 wire \u_axi_decoder.s1_arvalid_reg ;
 wire \u_axi_decoder.s1_awvalid_reg ;
 wire \u_axi_decoder.s1_wvalid_reg ;
 wire \u_axi_decoder.unmapped_bvalid_reg ;
 wire \u_axi_decoder.unmapped_rvalid_reg ;
 wire \u_axi_decoder.w_latched ;
 wire \u_axi_decoder.wr_state[0] ;
 wire \u_axi_decoder.wr_state[1] ;
 wire \u_axi_decoder.wr_state[2] ;
 wire \u_axi_decoder.wr_state[3] ;
 wire \u_axi_decoder.wr_state[4] ;
 wire \u_axi_decoder.wr_target_owner[1] ;
 wire \u_axi_decoder.wr_target_owner[2] ;
 wire \u_data_memory.aw_latched ;
 wire \u_data_memory.w_latched ;
 wire \u_vga_controller.H_count[0] ;
 wire \u_vga_controller.H_count[10] ;
 wire \u_vga_controller.H_count[11] ;
 wire \u_vga_controller.H_count[12] ;
 wire \u_vga_controller.H_count[13] ;
 wire \u_vga_controller.H_count[14] ;
 wire \u_vga_controller.H_count[15] ;
 wire \u_vga_controller.H_count[1] ;
 wire \u_vga_controller.H_count[2] ;
 wire \u_vga_controller.H_count[3] ;
 wire \u_vga_controller.H_count[4] ;
 wire \u_vga_controller.H_count[5] ;
 wire \u_vga_controller.H_count[6] ;
 wire \u_vga_controller.H_count[7] ;
 wire \u_vga_controller.H_count[8] ;
 wire \u_vga_controller.H_count[9] ;
 wire \u_vga_controller.V_count[0] ;
 wire \u_vga_controller.V_count[10] ;
 wire \u_vga_controller.V_count[11] ;
 wire \u_vga_controller.V_count[12] ;
 wire \u_vga_controller.V_count[13] ;
 wire \u_vga_controller.V_count[14] ;
 wire \u_vga_controller.V_count[15] ;
 wire \u_vga_controller.V_count[1] ;
 wire \u_vga_controller.V_count[2] ;
 wire \u_vga_controller.V_count[3] ;
 wire \u_vga_controller.V_count[4] ;
 wire \u_vga_controller.V_count[5] ;
 wire \u_vga_controller.V_count[6] ;
 wire \u_vga_controller.V_count[7] ;
 wire \u_vga_controller.V_count[8] ;
 wire \u_vga_controller.V_count[9] ;
 wire \u_vga_controller.raw_hsync ;
 wire \u_vga_controller.raw_vsync ;
 wire \u_vga_registers.aw_latched ;
 wire \u_vga_registers.rd_state[0] ;
 wire \u_vga_registers.rd_state[3] ;
 wire \u_vga_registers.w_latched ;
 wire \u_vga_registers.wr_state[0] ;
 wire \u_vga_registers.wr_state[1] ;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net;

 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_37 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_47 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_48 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_49 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Right_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_50 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Right_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_51 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_52 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_53 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Left_54 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Right_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Left_55 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Right_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Left_56 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Right_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_38 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Left_57 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Right_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Left_58 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Right_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Left_59 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Right_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_23_Left_60 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_23_Right_23 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_24_Left_61 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_24_Right_24 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_25_Left_62 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_25_Right_25 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_26_Left_63 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_26_Right_26 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_27_Left_64 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_27_Right_27 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_28_Left_65 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_28_Right_28 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_29_Left_66 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_29_Right_29 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_39 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_30_Left_67 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_30_Right_30 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_31_Left_68 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_31_Right_31 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_32_Left_69 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_32_Right_32 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_33_Left_70 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_33_Right_33 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_34_Left_71 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_34_Right_34 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_35_Left_72 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_35_Right_35 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_36_Left_73 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_36_Right_36 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_40 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_41 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_42 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_43 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_44 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_45 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_46 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_112 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_113 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_114 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_115 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_116 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_117 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_118 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_119 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_120 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_121 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_122 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_123 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_124 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_125 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_126 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_127 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_128 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_129 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_130 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_131 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_132 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_133 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_134 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_135 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_136 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_137 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_138 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_139 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_140 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_141 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_142 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_143 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_144 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_145 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_146 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_147 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_148 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_149 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_150 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_151 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_152 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_153 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_154 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_155 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_156 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_157 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_158 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_159 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_160 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_161 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_162 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_163 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_164 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_165 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_166 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_167 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_168 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_169 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_170 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_171 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_172 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_173 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_174 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_175 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_176 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_177 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_178 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_179 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_180 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_181 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_182 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_183 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_184 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_185 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_186 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_187 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_188 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_189 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_190 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_191 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_192 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_193 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_194 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_195 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_196 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_197 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_198 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_199 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_200 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_201 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_202 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_203 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_204 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_205 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_206 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_207 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_208 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_209 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_91 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_92 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_93 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_94 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_95 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_96 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_97 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_100 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_101 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_98 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_99 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_102 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_103 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_104 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_105 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_106 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_107 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_108 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_109 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_110 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_111 ();
 sky130_fd_sc_hd__inv_2 _0404_ (.A(s1_axi_arready),
    .Y(_0190_));
 sky130_fd_sc_hd__inv_2 _0405_ (.A(s0_axi_bvalid),
    .Y(_0191_));
 sky130_fd_sc_hd__inv_2 _0406_ (.A(net24),
    .Y(_0192_));
 sky130_fd_sc_hd__inv_2 _0407_ (.A(net11),
    .Y(_0193_));
 sky130_fd_sc_hd__inv_2 _0408_ (.A(net10),
    .Y(_0194_));
 sky130_fd_sc_hd__inv_2 _0409_ (.A(\u_axi_decoder.wr_state[0] ),
    .Y(_0195_));
 sky130_fd_sc_hd__inv_2 _0410_ (.A(m_axi_arready),
    .Y(_0196_));
 sky130_fd_sc_hd__inv_2 _0411_ (.A(\u_axi_decoder.rd_state[3] ),
    .Y(_0197_));
 sky130_fd_sc_hd__inv_2 _0412_ (.A(\u_axi_decoder.wr_state[2] ),
    .Y(_0198_));
 sky130_fd_sc_hd__inv_2 _0413_ (.A(s1_axi_awready),
    .Y(_0199_));
 sky130_fd_sc_hd__inv_2 _0414_ (.A(\u_axi_decoder.wr_state[3] ),
    .Y(_0200_));
 sky130_fd_sc_hd__inv_2 _0415_ (.A(s1_axi_wready),
    .Y(_0201_));
 sky130_fd_sc_hd__inv_2 _0416_ (.A(\u_vga_registers.wr_state[1] ),
    .Y(_0202_));
 sky130_fd_sc_hd__inv_2 _0417_ (.A(\u_vga_controller.H_count[0] ),
    .Y(_0018_));
 sky130_fd_sc_hd__inv_2 _0418_ (.A(net49),
    .Y(_0038_));
 sky130_fd_sc_hd__nand2_2 _0419_ (.A(\u_axi_decoder.s1_awvalid_reg ),
    .B(\u_axi_decoder.wr_state[3] ),
    .Y(_0203_));
 sky130_fd_sc_hd__a31o_2 _0420_ (.A1(\u_axi_decoder.s1_awvalid_reg ),
    .A2(s1_axi_awready),
    .A3(\u_axi_decoder.wr_state[3] ),
    .B1(\u_vga_registers.aw_latched ),
    .X(_0204_));
 sky130_fd_sc_hd__nand2_2 _0421_ (.A(\u_axi_decoder.s1_wvalid_reg ),
    .B(\u_axi_decoder.wr_state[3] ),
    .Y(_0205_));
 sky130_fd_sc_hd__a31o_2 _0422_ (.A1(\u_axi_decoder.s1_wvalid_reg ),
    .A2(\u_axi_decoder.wr_state[3] ),
    .A3(s1_axi_wready),
    .B1(\u_vga_registers.w_latched ),
    .X(_0206_));
 sky130_fd_sc_hd__nand2_2 _0423_ (.A(_0204_),
    .B(_0206_),
    .Y(_0207_));
 sky130_fd_sc_hd__nand2_2 _0424_ (.A(\u_axi_decoder.wr_state[4] ),
    .B(\u_axi_decoder.wr_target_owner[1] ),
    .Y(_0208_));
 sky130_fd_sc_hd__and3_2 _0425_ (.A(s1_axi_bvalid),
    .B(\u_axi_decoder.wr_state[4] ),
    .C(\u_axi_decoder.wr_target_owner[1] ),
    .X(_0209_));
 sky130_fd_sc_hd__and3_2 _0426_ (.A(m_axi_bready),
    .B(\u_vga_registers.wr_state[1] ),
    .C(_0209_),
    .X(_0210_));
 sky130_fd_sc_hd__nand3_2 _0427_ (.A(m_axi_bready),
    .B(\u_vga_registers.wr_state[1] ),
    .C(_0209_),
    .Y(_0211_));
 sky130_fd_sc_hd__nand2_2 _0428_ (.A(_0202_),
    .B(\u_vga_registers.wr_state[0] ),
    .Y(_0212_));
 sky130_fd_sc_hd__a22o_2 _0429_ (.A1(\u_vga_registers.wr_state[0] ),
    .A2(_0207_),
    .B1(_0211_),
    .B2(_0212_),
    .X(_0213_));
 sky130_fd_sc_hd__and3_2 _0430_ (.A(\u_vga_registers.wr_state[0] ),
    .B(_0204_),
    .C(_0206_),
    .X(_0214_));
 sky130_fd_sc_hd__a22o_2 _0431_ (.A1(s1_axi_bvalid),
    .A2(_0213_),
    .B1(_0214_),
    .B2(_0202_),
    .X(_0187_));
 sky130_fd_sc_hd__and3_2 _0432_ (.A(s1_axi_arready),
    .B(\u_axi_decoder.s1_arvalid_reg ),
    .C(\u_axi_decoder.rd_state[3] ),
    .X(_0215_));
 sky130_fd_sc_hd__nand2b_2 _0433_ (.A_N(_0215_),
    .B(\u_vga_registers.rd_state[0] ),
    .Y(_0216_));
 sky130_fd_sc_hd__nand2_2 _0434_ (.A(\u_axi_decoder.rd_state[4] ),
    .B(\u_axi_decoder.rd_target_owner[1] ),
    .Y(_0217_));
 sky130_fd_sc_hd__and3_2 _0435_ (.A(s1_axi_rvalid),
    .B(\u_axi_decoder.rd_state[4] ),
    .C(\u_axi_decoder.rd_target_owner[1] ),
    .X(_0218_));
 sky130_fd_sc_hd__and2_2 _0436_ (.A(m_axi_rready),
    .B(_0218_),
    .X(_0219_));
 sky130_fd_sc_hd__nand2_2 _0437_ (.A(m_axi_rready),
    .B(_0218_),
    .Y(_0220_));
 sky130_fd_sc_hd__nand2_2 _0438_ (.A(\u_vga_registers.rd_state[3] ),
    .B(_0220_),
    .Y(_0221_));
 sky130_fd_sc_hd__mux2_1 _0439_ (.A0(\u_vga_registers.rd_state[3] ),
    .A1(_0215_),
    .S(\u_vga_registers.rd_state[0] ),
    .X(_0222_));
 sky130_fd_sc_hd__a21oi_2 _0440_ (.A1(_0221_),
    .A2(_0222_),
    .B1(s1_axi_rvalid),
    .Y(_0223_));
 sky130_fd_sc_hd__a31oi_2 _0441_ (.A1(\u_vga_registers.rd_state[3] ),
    .A2(_0216_),
    .A3(_0219_),
    .B1(_0223_),
    .Y(_0186_));
 sky130_fd_sc_hd__a21oi_2 _0442_ (.A1(_0221_),
    .A2(_0222_),
    .B1(_0190_),
    .Y(_0224_));
 sky130_fd_sc_hd__a31o_2 _0443_ (.A1(\u_vga_registers.rd_state[3] ),
    .A2(_0216_),
    .A3(_0219_),
    .B1(_0224_),
    .X(_0185_));
 sky130_fd_sc_hd__nand2_2 _0444_ (.A(\u_vga_controller.V_count[3] ),
    .B(\u_vga_controller.V_count[2] ),
    .Y(_0225_));
 sky130_fd_sc_hd__and4_2 _0445_ (.A(\u_vga_controller.V_count[5] ),
    .B(\u_vga_controller.V_count[4] ),
    .C(\u_vga_controller.V_count[3] ),
    .D(\u_vga_controller.V_count[2] ),
    .X(_0226_));
 sky130_fd_sc_hd__and3_2 _0446_ (.A(\u_vga_controller.V_count[7] ),
    .B(\u_vga_controller.V_count[1] ),
    .C(\u_vga_controller.V_count[0] ),
    .X(_0227_));
 sky130_fd_sc_hd__and3_2 _0447_ (.A(\u_vga_controller.V_count[6] ),
    .B(_0226_),
    .C(_0227_),
    .X(_0228_));
 sky130_fd_sc_hd__and3_2 _0448_ (.A(\u_vga_controller.H_count[0] ),
    .B(\u_vga_controller.H_count[1] ),
    .C(\u_vga_controller.H_count[2] ),
    .X(_0229_));
 sky130_fd_sc_hd__and2_2 _0449_ (.A(\u_vga_controller.H_count[3] ),
    .B(_0229_),
    .X(_0230_));
 sky130_fd_sc_hd__nand4_2 _0450_ (.A(\u_vga_controller.H_count[0] ),
    .B(\u_vga_controller.H_count[1] ),
    .C(\u_vga_controller.H_count[3] ),
    .D(\u_vga_controller.H_count[2] ),
    .Y(_0231_));
 sky130_fd_sc_hd__nand2b_2 _0451_ (.A_N(\u_vga_controller.H_count[5] ),
    .B(\u_vga_controller.H_count[4] ),
    .Y(_0232_));
 sky130_fd_sc_hd__or4b_2 _0452_ (.A(\u_vga_controller.H_count[7] ),
    .B(_0232_),
    .C(\u_vga_controller.H_count[6] ),
    .D_N(\u_vga_controller.H_count[8] ),
    .X(_0233_));
 sky130_fd_sc_hd__or3b_2 _0453_ (.A(\u_vga_controller.H_count[10] ),
    .B(\u_vga_controller.H_count[11] ),
    .C_N(\u_vga_controller.H_count[9] ),
    .X(_0234_));
 sky130_fd_sc_hd__or4_2 _0454_ (.A(\u_vga_controller.H_count[13] ),
    .B(\u_vga_controller.H_count[12] ),
    .C(\u_vga_controller.H_count[14] ),
    .D(\u_vga_controller.H_count[15] ),
    .X(_0235_));
 sky130_fd_sc_hd__nor4_4 _0455_ (.A(_0231_),
    .B(_0233_),
    .C(_0234_),
    .D(_0235_),
    .Y(_0236_));
 sky130_fd_sc_hd__nand4_2 _0456_ (.A(\u_vga_controller.V_count[9] ),
    .B(\u_vga_controller.V_count[8] ),
    .C(_0228_),
    .D(net39),
    .Y(_0237_));
 sky130_fd_sc_hd__or3b_2 _0457_ (.A(_0234_),
    .B(\u_vga_controller.H_count[6] ),
    .C_N(\u_vga_controller.H_count[8] ),
    .X(_0238_));
 sky130_fd_sc_hd__or4_2 _0458_ (.A(\u_vga_controller.H_count[7] ),
    .B(_0231_),
    .C(_0232_),
    .D(_0235_),
    .X(_0239_));
 sky130_fd_sc_hd__nor2_2 _0459_ (.A(_0238_),
    .B(_0239_),
    .Y(_0240_));
 sky130_fd_sc_hd__and3_2 _0460_ (.A(\u_vga_controller.V_count[8] ),
    .B(_0228_),
    .C(_0240_),
    .X(_0241_));
 sky130_fd_sc_hd__and3_2 _0461_ (.A(\u_vga_controller.V_count[10] ),
    .B(\u_vga_controller.V_count[9] ),
    .C(_0241_),
    .X(_0242_));
 sky130_fd_sc_hd__and2_2 _0462_ (.A(\u_vga_controller.V_count[11] ),
    .B(_0242_),
    .X(_0243_));
 sky130_fd_sc_hd__and3_2 _0463_ (.A(\u_vga_controller.V_count[13] ),
    .B(\u_vga_controller.V_count[12] ),
    .C(_0243_),
    .X(_0244_));
 sky130_fd_sc_hd__nand2_2 _0464_ (.A(\u_vga_controller.V_count[14] ),
    .B(_0244_),
    .Y(_0245_));
 sky130_fd_sc_hd__xnor2_2 _0465_ (.A(\u_vga_controller.V_count[15] ),
    .B(_0245_),
    .Y(_0184_));
 sky130_fd_sc_hd__or2_2 _0466_ (.A(\u_vga_controller.V_count[14] ),
    .B(_0244_),
    .X(_0246_));
 sky130_fd_sc_hd__and2_2 _0467_ (.A(_0245_),
    .B(_0246_),
    .X(_0183_));
 sky130_fd_sc_hd__a21oi_2 _0468_ (.A1(\u_vga_controller.V_count[12] ),
    .A2(_0243_),
    .B1(\u_vga_controller.V_count[13] ),
    .Y(_0247_));
 sky130_fd_sc_hd__nor2_2 _0469_ (.A(_0244_),
    .B(_0247_),
    .Y(_0182_));
 sky130_fd_sc_hd__xor2_2 _0470_ (.A(\u_vga_controller.V_count[12] ),
    .B(_0243_),
    .X(_0181_));
 sky130_fd_sc_hd__xor2_2 _0471_ (.A(\u_vga_controller.V_count[11] ),
    .B(_0242_),
    .X(_0180_));
 sky130_fd_sc_hd__and2b_2 _0472_ (.A_N(\u_vga_controller.V_count[10] ),
    .B(_0237_),
    .X(_0248_));
 sky130_fd_sc_hd__nor2_2 _0473_ (.A(_0242_),
    .B(_0248_),
    .Y(_0179_));
 sky130_fd_sc_hd__or4b_2 _0474_ (.A(\u_vga_controller.V_count[8] ),
    .B(\u_vga_controller.V_count[7] ),
    .C(\u_vga_controller.V_count[6] ),
    .D_N(\u_vga_controller.V_count[9] ),
    .X(_0249_));
 sky130_fd_sc_hd__or4_2 _0475_ (.A(\u_vga_controller.V_count[11] ),
    .B(\u_vga_controller.V_count[10] ),
    .C(_0225_),
    .D(_0249_),
    .X(_0250_));
 sky130_fd_sc_hd__or4_2 _0476_ (.A(\u_vga_controller.V_count[5] ),
    .B(\u_vga_controller.V_count[4] ),
    .C(\u_vga_controller.V_count[1] ),
    .D(\u_vga_controller.V_count[0] ),
    .X(_0251_));
 sky130_fd_sc_hd__or4_2 _0477_ (.A(\u_vga_controller.V_count[15] ),
    .B(\u_vga_controller.V_count[14] ),
    .C(\u_vga_controller.V_count[13] ),
    .D(\u_vga_controller.V_count[12] ),
    .X(_0252_));
 sky130_fd_sc_hd__nor3_2 _0478_ (.A(_0250_),
    .B(_0251_),
    .C(_0252_),
    .Y(_0253_));
 sky130_fd_sc_hd__nand2_2 _0479_ (.A(net39),
    .B(_0253_),
    .Y(_0254_));
 sky130_fd_sc_hd__o211a_2 _0480_ (.A1(\u_vga_controller.V_count[9] ),
    .A2(_0241_),
    .B1(_0254_),
    .C1(_0237_),
    .X(_0178_));
 sky130_fd_sc_hd__a21oi_2 _0481_ (.A1(_0228_),
    .A2(net39),
    .B1(\u_vga_controller.V_count[8] ),
    .Y(_0255_));
 sky130_fd_sc_hd__nor2_2 _0482_ (.A(_0241_),
    .B(_0255_),
    .Y(_0177_));
 sky130_fd_sc_hd__and3_2 _0483_ (.A(\u_vga_controller.V_count[1] ),
    .B(\u_vga_controller.V_count[0] ),
    .C(_0240_),
    .X(_0256_));
 sky130_fd_sc_hd__and3_2 _0484_ (.A(\u_vga_controller.V_count[3] ),
    .B(\u_vga_controller.V_count[2] ),
    .C(_0256_),
    .X(_0257_));
 sky130_fd_sc_hd__and2_2 _0485_ (.A(\u_vga_controller.V_count[4] ),
    .B(_0257_),
    .X(_0258_));
 sky130_fd_sc_hd__nand2_2 _0486_ (.A(\u_vga_controller.V_count[5] ),
    .B(_0258_),
    .Y(_0259_));
 sky130_fd_sc_hd__and3_2 _0487_ (.A(\u_vga_controller.V_count[6] ),
    .B(\u_vga_controller.V_count[5] ),
    .C(_0258_),
    .X(_0260_));
 sky130_fd_sc_hd__nand2_2 _0488_ (.A(\u_vga_controller.V_count[0] ),
    .B(net38),
    .Y(_0261_));
 sky130_fd_sc_hd__and4_2 _0489_ (.A(\u_vga_controller.V_count[2] ),
    .B(\u_vga_controller.V_count[1] ),
    .C(\u_vga_controller.V_count[0] ),
    .D(net38),
    .X(_0262_));
 sky130_fd_sc_hd__nand2_2 _0490_ (.A(\u_vga_controller.V_count[3] ),
    .B(_0262_),
    .Y(_0263_));
 sky130_fd_sc_hd__xor2_2 _0491_ (.A(\u_vga_controller.V_count[7] ),
    .B(_0260_),
    .X(_0176_));
 sky130_fd_sc_hd__xnor2_2 _0492_ (.A(\u_vga_controller.V_count[6] ),
    .B(_0259_),
    .Y(_0175_));
 sky130_fd_sc_hd__xor2_2 _0493_ (.A(\u_vga_controller.V_count[5] ),
    .B(_0258_),
    .X(_0174_));
 sky130_fd_sc_hd__nor2_2 _0494_ (.A(\u_vga_controller.V_count[4] ),
    .B(_0257_),
    .Y(_0264_));
 sky130_fd_sc_hd__nor2_2 _0495_ (.A(_0258_),
    .B(_0264_),
    .Y(_0173_));
 sky130_fd_sc_hd__or2_2 _0496_ (.A(\u_vga_controller.V_count[3] ),
    .B(_0262_),
    .X(_0265_));
 sky130_fd_sc_hd__and3_2 _0497_ (.A(_0254_),
    .B(_0263_),
    .C(_0265_),
    .X(_0172_));
 sky130_fd_sc_hd__nor2_2 _0498_ (.A(\u_vga_controller.V_count[2] ),
    .B(_0256_),
    .Y(_0266_));
 sky130_fd_sc_hd__nor2_2 _0499_ (.A(_0262_),
    .B(_0266_),
    .Y(_0267_));
 sky130_fd_sc_hd__and2_2 _0500_ (.A(_0254_),
    .B(_0267_),
    .X(_0171_));
 sky130_fd_sc_hd__a21oi_2 _0501_ (.A1(\u_vga_controller.V_count[0] ),
    .A2(net38),
    .B1(\u_vga_controller.V_count[1] ),
    .Y(_0268_));
 sky130_fd_sc_hd__nor2_2 _0502_ (.A(_0256_),
    .B(_0268_),
    .Y(_0170_));
 sky130_fd_sc_hd__or2_2 _0503_ (.A(\u_vga_controller.V_count[0] ),
    .B(net38),
    .X(_0269_));
 sky130_fd_sc_hd__and3_2 _0504_ (.A(_0254_),
    .B(_0261_),
    .C(_0269_),
    .X(_0169_));
 sky130_fd_sc_hd__and4b_2 _0505_ (.A_N(\u_data_memory.aw_latched ),
    .B(_0191_),
    .C(\u_axi_decoder.s0_awvalid_reg ),
    .D(\u_axi_decoder.wr_state[2] ),
    .X(_0270_));
 sky130_fd_sc_hd__nor2_2 _0506_ (.A(\u_data_memory.aw_latched ),
    .B(_0270_),
    .Y(_0271_));
 sky130_fd_sc_hd__and4b_2 _0507_ (.A_N(\u_data_memory.w_latched ),
    .B(_0191_),
    .C(\u_axi_decoder.s0_wvalid_reg ),
    .D(\u_axi_decoder.wr_state[2] ),
    .X(_0272_));
 sky130_fd_sc_hd__nor2_2 _0508_ (.A(\u_data_memory.w_latched ),
    .B(_0272_),
    .Y(_0273_));
 sky130_fd_sc_hd__o21ba_2 _0509_ (.A1(s0_axi_bvalid),
    .A2(_0271_),
    .B1_N(_0273_),
    .X(_0168_));
 sky130_fd_sc_hd__o21ba_2 _0510_ (.A1(s0_axi_bvalid),
    .A2(_0273_),
    .B1_N(_0271_),
    .X(_0167_));
 sky130_fd_sc_hd__a31o_2 _0511_ (.A1(m_axi_bready),
    .A2(\u_axi_decoder.wr_state[4] ),
    .A3(\u_axi_decoder.wr_target_owner[2] ),
    .B1(_0191_),
    .X(_0274_));
 sky130_fd_sc_hd__o31ai_2 _0512_ (.A1(s0_axi_bvalid),
    .A2(_0271_),
    .A3(_0273_),
    .B1(_0274_),
    .Y(_0166_));
 sky130_fd_sc_hd__nand2b_2 _0513_ (.A_N(s0_axi_rvalid),
    .B(\u_axi_decoder.s0_arvalid_reg ),
    .Y(_0275_));
 sky130_fd_sc_hd__and3b_2 _0514_ (.A_N(s0_axi_rvalid),
    .B(\u_axi_decoder.s0_arvalid_reg ),
    .C(\u_axi_decoder.rd_state[2] ),
    .X(_0276_));
 sky130_fd_sc_hd__inv_2 _0515_ (.A(_0276_),
    .Y(_0277_));
 sky130_fd_sc_hd__nand3_2 _0516_ (.A(m_axi_rready),
    .B(\u_axi_decoder.rd_state[4] ),
    .C(\u_axi_decoder.rd_target_owner[2] ),
    .Y(_0278_));
 sky130_fd_sc_hd__a21o_2 _0517_ (.A1(s0_axi_rvalid),
    .A2(_0278_),
    .B1(_0276_),
    .X(_0165_));
 sky130_fd_sc_hd__and3_2 _0518_ (.A(\u_axi_decoder.unmapped_bvalid_reg ),
    .B(m_axi_bready),
    .C(\u_axi_decoder.wr_state[1] ),
    .X(_0279_));
 sky130_fd_sc_hd__a21boi_2 _0519_ (.A1(_0195_),
    .A2(_0279_),
    .B1_N(\u_axi_decoder.unmapped_bvalid_reg ),
    .Y(_0164_));
 sky130_fd_sc_hd__o31a_2 _0520_ (.A1(\u_axi_decoder.wr_state[0] ),
    .A2(_0200_),
    .A3(_0201_),
    .B1(\u_axi_decoder.s1_wvalid_reg ),
    .X(_0163_));
 sky130_fd_sc_hd__o31a_2 _0521_ (.A1(\u_axi_decoder.wr_state[0] ),
    .A2(_0199_),
    .A3(_0200_),
    .B1(\u_axi_decoder.s1_awvalid_reg ),
    .X(_0162_));
 sky130_fd_sc_hd__a21oi_2 _0522_ (.A1(m_axi_awvalid),
    .A2(\u_axi_decoder.wr_state[0] ),
    .B1(\u_axi_decoder.aw_latched ),
    .Y(_0280_));
 sky130_fd_sc_hd__a21oi_2 _0523_ (.A1(m_axi_wvalid),
    .A2(\u_axi_decoder.wr_state[0] ),
    .B1(\u_axi_decoder.w_latched ),
    .Y(_0281_));
 sky130_fd_sc_hd__nor3_2 _0524_ (.A(_0195_),
    .B(_0280_),
    .C(_0281_),
    .Y(_0282_));
 sky130_fd_sc_hd__and2_2 _0525_ (.A(_0198_),
    .B(_0282_),
    .X(_0283_));
 sky130_fd_sc_hd__o21a_2 _0526_ (.A1(_0280_),
    .A2(_0281_),
    .B1(\u_axi_decoder.wr_state[0] ),
    .X(_0284_));
 sky130_fd_sc_hd__a21oi_2 _0527_ (.A1(\u_axi_decoder.wr_state[0] ),
    .A2(_0198_),
    .B1(_0272_),
    .Y(_0285_));
 sky130_fd_sc_hd__o21a_2 _0528_ (.A1(_0284_),
    .A2(_0285_),
    .B1(\u_axi_decoder.s0_wvalid_reg ),
    .X(_0286_));
 sky130_fd_sc_hd__or2_2 _0529_ (.A(_0283_),
    .B(_0286_),
    .X(_0161_));
 sky130_fd_sc_hd__a21oi_2 _0530_ (.A1(\u_axi_decoder.wr_state[0] ),
    .A2(_0198_),
    .B1(_0270_),
    .Y(_0287_));
 sky130_fd_sc_hd__o21a_2 _0531_ (.A1(_0284_),
    .A2(_0287_),
    .B1(\u_axi_decoder.s0_awvalid_reg ),
    .X(_0288_));
 sky130_fd_sc_hd__or2_2 _0532_ (.A(_0283_),
    .B(_0288_),
    .X(_0160_));
 sky130_fd_sc_hd__nand2_2 _0533_ (.A(m_axi_rready),
    .B(\u_axi_decoder.rd_state[1] ),
    .Y(_0289_));
 sky130_fd_sc_hd__o21a_2 _0534_ (.A1(m_axi_arready),
    .A2(_0289_),
    .B1(\u_axi_decoder.unmapped_rvalid_reg ),
    .X(_0159_));
 sky130_fd_sc_hd__o31a_2 _0535_ (.A1(_0190_),
    .A2(m_axi_arready),
    .A3(_0197_),
    .B1(\u_axi_decoder.s1_arvalid_reg ),
    .X(_0158_));
 sky130_fd_sc_hd__nand2_2 _0536_ (.A(m_axi_arvalid),
    .B(m_axi_arready),
    .Y(_0290_));
 sky130_fd_sc_hd__nor2_2 _0537_ (.A(\u_axi_decoder.rd_state[2] ),
    .B(_0290_),
    .Y(_0291_));
 sky130_fd_sc_hd__nor2_2 _0538_ (.A(m_axi_arvalid),
    .B(_0196_),
    .Y(_0292_));
 sky130_fd_sc_hd__o22a_2 _0539_ (.A1(\u_axi_decoder.s0_arvalid_reg ),
    .A2(_0291_),
    .B1(_0292_),
    .B2(_0277_),
    .X(_0157_));
 sky130_fd_sc_hd__a22o_2 _0540_ (.A1(\u_axi_decoder.unmapped_rvalid_reg ),
    .A2(\u_axi_decoder.rd_state[1] ),
    .B1(\u_axi_decoder.rd_state[4] ),
    .B2(\u_axi_decoder.rd_target_owner[2] ),
    .X(_0293_));
 sky130_fd_sc_hd__nand3b_2 _0541_ (.A_N(s0_axi_rvalid),
    .B(\u_axi_decoder.rd_state[4] ),
    .C(\u_axi_decoder.rd_target_owner[2] ),
    .Y(_0294_));
 sky130_fd_sc_hd__a31o_2 _0542_ (.A1(_0217_),
    .A2(_0293_),
    .A3(_0294_),
    .B1(_0218_),
    .X(_0295_));
 sky130_fd_sc_hd__or2_2 _0543_ (.A(\u_axi_bridge.state[1] ),
    .B(\u_axi_bridge.state[0] ),
    .X(_0296_));
 sky130_fd_sc_hd__or3b_2 _0544_ (.A(\u_axi_bridge.state[1] ),
    .B(\u_axi_bridge.state[0] ),
    .C_N(\u_axi_bridge.state[2] ),
    .X(_0297_));
 sky130_fd_sc_hd__nand2b_2 _0545_ (.A_N(\u_axi_bridge.state[2] ),
    .B(\u_axi_bridge.state[1] ),
    .Y(_0298_));
 sky130_fd_sc_hd__nand3b_2 _0546_ (.A_N(\u_axi_bridge.state[2] ),
    .B(\u_axi_bridge.state[1] ),
    .C(\u_axi_bridge.state[0] ),
    .Y(_0299_));
 sky130_fd_sc_hd__or3b_2 _0547_ (.A(m_axi_arready),
    .B(_0299_),
    .C_N(m_axi_arvalid),
    .X(_0300_));
 sky130_fd_sc_hd__a21oi_2 _0548_ (.A1(_0297_),
    .A2(_0300_),
    .B1(_0295_),
    .Y(_0301_));
 sky130_fd_sc_hd__or3b_2 _0549_ (.A(\u_axi_bridge.state[2] ),
    .B(\u_axi_bridge.state[1] ),
    .C_N(\u_axi_bridge.state[0] ),
    .X(_0302_));
 sky130_fd_sc_hd__nand2b_2 _0550_ (.A_N(\u_axi_decoder.w_latched ),
    .B(\u_axi_decoder.wr_state[0] ),
    .Y(_0303_));
 sky130_fd_sc_hd__o21a_2 _0551_ (.A1(_0302_),
    .A2(_0303_),
    .B1(m_axi_wvalid),
    .X(_0151_));
 sky130_fd_sc_hd__nand2b_2 _0552_ (.A_N(\u_axi_decoder.aw_latched ),
    .B(\u_axi_decoder.wr_state[0] ),
    .Y(_0304_));
 sky130_fd_sc_hd__a221o_2 _0553_ (.A1(m_axi_wvalid),
    .A2(_0303_),
    .B1(_0304_),
    .B2(m_axi_awvalid),
    .C1(_0302_),
    .X(_0305_));
 sky130_fd_sc_hd__a31o_2 _0554_ (.A1(_0296_),
    .A2(_0298_),
    .A3(_0305_),
    .B1(_0301_),
    .X(_0306_));
 sky130_fd_sc_hd__nor2_2 _0555_ (.A(_0295_),
    .B(_0299_),
    .Y(_0307_));
 sky130_fd_sc_hd__mux2_1 _0556_ (.A0(_0307_),
    .A1(\u_axi_bridge.state[2] ),
    .S(_0306_),
    .X(_0156_));
 sky130_fd_sc_hd__a22o_2 _0557_ (.A1(\u_axi_decoder.unmapped_bvalid_reg ),
    .A2(\u_axi_decoder.wr_state[1] ),
    .B1(\u_axi_decoder.wr_state[4] ),
    .B2(\u_axi_decoder.wr_target_owner[2] ),
    .X(_0308_));
 sky130_fd_sc_hd__nand3b_2 _0558_ (.A_N(s0_axi_bvalid),
    .B(\u_axi_decoder.wr_state[4] ),
    .C(\u_axi_decoder.wr_target_owner[2] ),
    .Y(_0309_));
 sky130_fd_sc_hd__a31oi_2 _0559_ (.A1(_0208_),
    .A2(_0308_),
    .A3(_0309_),
    .B1(_0209_),
    .Y(_0310_));
 sky130_fd_sc_hd__or3b_2 _0560_ (.A(\u_axi_bridge.state[2] ),
    .B(\u_axi_bridge.state[0] ),
    .C_N(\u_axi_bridge.state[1] ),
    .X(_0311_));
 sky130_fd_sc_hd__nand2_2 _0561_ (.A(_0305_),
    .B(_0311_),
    .Y(_0312_));
 sky130_fd_sc_hd__a22o_2 _0562_ (.A1(\u_axi_bridge.state[1] ),
    .A2(_0306_),
    .B1(_0310_),
    .B2(_0312_),
    .X(_0155_));
 sky130_fd_sc_hd__and2_2 _0563_ (.A(\u_axi_bridge.state[0] ),
    .B(_0306_),
    .X(_0154_));
 sky130_fd_sc_hd__nand2_2 _0564_ (.A(_0297_),
    .B(_0299_),
    .Y(_0313_));
 sky130_fd_sc_hd__a21boi_2 _0565_ (.A1(_0295_),
    .A2(_0313_),
    .B1_N(m_axi_rready),
    .Y(_0153_));
 sky130_fd_sc_hd__o21a_2 _0566_ (.A1(_0196_),
    .A2(_0299_),
    .B1(m_axi_arvalid),
    .X(_0152_));
 sky130_fd_sc_hd__o21a_2 _0567_ (.A1(_0302_),
    .A2(_0304_),
    .B1(m_axi_awvalid),
    .X(_0150_));
 sky130_fd_sc_hd__a21o_2 _0568_ (.A1(_0305_),
    .A2(_0311_),
    .B1(_0310_),
    .X(_0314_));
 sky130_fd_sc_hd__o2bb2a_2 _0569_ (.A1_N(_0295_),
    .A2_N(_0313_),
    .B1(_0296_),
    .B2(\u_axi_bridge.state[2] ),
    .X(_0315_));
 sky130_fd_sc_hd__nand2_2 _0570_ (.A(_0314_),
    .B(_0315_),
    .Y(_0316_));
 sky130_fd_sc_hd__inv_2 _0571_ (.A(_0316_),
    .Y(net4));
 sky130_fd_sc_hd__and2_2 _0572_ (.A(m_axi_bready),
    .B(_0314_),
    .X(_0119_));
 sky130_fd_sc_hd__a21boi_2 _0573_ (.A1(\u_axi_decoder.unmapped_bvalid_reg ),
    .A2(m_axi_bready),
    .B1_N(\u_axi_decoder.wr_state[1] ),
    .Y(_0002_));
 sky130_fd_sc_hd__a21oi_2 _0574_ (.A1(m_axi_bready),
    .A2(_0209_),
    .B1(_0202_),
    .Y(_0317_));
 sky130_fd_sc_hd__or2_2 _0575_ (.A(_0214_),
    .B(_0317_),
    .X(_0017_));
 sky130_fd_sc_hd__a21o_2 _0576_ (.A1(\u_vga_registers.wr_state[0] ),
    .A2(_0207_),
    .B1(_0210_),
    .X(_0016_));
 sky130_fd_sc_hd__a22o_2 _0577_ (.A1(\u_vga_registers.rd_state[0] ),
    .A2(_0215_),
    .B1(_0220_),
    .B2(\u_vga_registers.rd_state[3] ),
    .X(_0015_));
 sky130_fd_sc_hd__a21bo_2 _0578_ (.A1(\u_vga_registers.rd_state[3] ),
    .A2(_0219_),
    .B1_N(_0216_),
    .X(_0014_));
 sky130_fd_sc_hd__or2_2 _0579_ (.A(\u_axi_decoder.wr_target_owner[2] ),
    .B(_0282_),
    .X(_0013_));
 sky130_fd_sc_hd__and2b_2 _0580_ (.A_N(_0282_),
    .B(\u_axi_decoder.wr_target_owner[1] ),
    .X(_0012_));
 sky130_fd_sc_hd__nand2b_2 _0581_ (.A_N(_0310_),
    .B(m_axi_bready),
    .Y(_0318_));
 sky130_fd_sc_hd__a22o_2 _0582_ (.A1(\u_axi_decoder.s1_awvalid_reg ),
    .A2(_0199_),
    .B1(_0201_),
    .B2(\u_axi_decoder.s1_wvalid_reg ),
    .X(_0319_));
 sky130_fd_sc_hd__nor2_2 _0583_ (.A(_0200_),
    .B(_0319_),
    .Y(_0320_));
 sky130_fd_sc_hd__o21a_2 _0584_ (.A1(\u_data_memory.aw_latched ),
    .A2(s0_axi_bvalid),
    .B1(\u_axi_decoder.s0_awvalid_reg ),
    .X(_0321_));
 sky130_fd_sc_hd__o21a_2 _0585_ (.A1(\u_data_memory.w_latched ),
    .A2(s0_axi_bvalid),
    .B1(\u_axi_decoder.s0_wvalid_reg ),
    .X(_0322_));
 sky130_fd_sc_hd__nor2_2 _0586_ (.A(_0321_),
    .B(_0322_),
    .Y(_0323_));
 sky130_fd_sc_hd__a221o_2 _0587_ (.A1(\u_axi_decoder.wr_state[4] ),
    .A2(_0318_),
    .B1(_0323_),
    .B2(\u_axi_decoder.wr_state[2] ),
    .C1(_0320_),
    .X(_0011_));
 sky130_fd_sc_hd__o21bai_2 _0588_ (.A1(_0198_),
    .A2(_0323_),
    .B1_N(_0282_),
    .Y(_0010_));
 sky130_fd_sc_hd__or3b_2 _0589_ (.A(_0279_),
    .B(_0284_),
    .C_N(_0318_),
    .X(_0009_));
 sky130_fd_sc_hd__a21o_2 _0590_ (.A1(m_axi_arvalid),
    .A2(m_axi_arready),
    .B1(\u_axi_decoder.rd_target_owner[2] ),
    .X(_0008_));
 sky130_fd_sc_hd__and2_2 _0591_ (.A(\u_axi_decoder.rd_target_owner[1] ),
    .B(_0290_),
    .X(_0007_));
 sky130_fd_sc_hd__nand2_2 _0592_ (.A(m_axi_rready),
    .B(_0295_),
    .Y(_0324_));
 sky130_fd_sc_hd__a211o_2 _0593_ (.A1(\u_axi_decoder.rd_state[4] ),
    .A2(_0324_),
    .B1(_0276_),
    .C1(_0215_),
    .X(_0006_));
 sky130_fd_sc_hd__a21bo_2 _0594_ (.A1(\u_axi_decoder.rd_state[2] ),
    .A2(_0275_),
    .B1_N(_0290_),
    .X(_0005_));
 sky130_fd_sc_hd__and3_2 _0595_ (.A(\u_axi_decoder.unmapped_rvalid_reg ),
    .B(m_axi_rready),
    .C(\u_axi_decoder.rd_state[1] ),
    .X(_0325_));
 sky130_fd_sc_hd__a211o_2 _0596_ (.A1(m_axi_rready),
    .A2(_0295_),
    .B1(_0325_),
    .C1(_0292_),
    .X(_0004_));
 sky130_fd_sc_hd__a21o_2 _0597_ (.A1(s1_axi_awready),
    .A2(_0203_),
    .B1(_0210_),
    .X(_0035_));
 sky130_fd_sc_hd__a21o_2 _0598_ (.A1(s1_axi_wready),
    .A2(_0205_),
    .B1(_0210_),
    .X(_0036_));
 sky130_fd_sc_hd__and2_2 _0599_ (.A(_0204_),
    .B(_0211_),
    .X(_0034_));
 sky130_fd_sc_hd__and2_2 _0600_ (.A(_0206_),
    .B(_0211_),
    .X(_0037_));
 sky130_fd_sc_hd__xor2_2 _0601_ (.A(\u_vga_controller.H_count[0] ),
    .B(\u_vga_controller.H_count[1] ),
    .X(_0025_));
 sky130_fd_sc_hd__a21oi_2 _0602_ (.A1(\u_vga_controller.H_count[0] ),
    .A2(\u_vga_controller.H_count[1] ),
    .B1(\u_vga_controller.H_count[2] ),
    .Y(_0326_));
 sky130_fd_sc_hd__nor2_2 _0603_ (.A(_0229_),
    .B(_0326_),
    .Y(_0026_));
 sky130_fd_sc_hd__xor2_2 _0604_ (.A(\u_vga_controller.H_count[3] ),
    .B(_0229_),
    .X(_0027_));
 sky130_fd_sc_hd__xnor2_2 _0605_ (.A(\u_vga_controller.H_count[4] ),
    .B(_0231_),
    .Y(_0028_));
 sky130_fd_sc_hd__a21oi_2 _0606_ (.A1(\u_vga_controller.H_count[4] ),
    .A2(_0230_),
    .B1(\u_vga_controller.H_count[5] ),
    .Y(_0327_));
 sky130_fd_sc_hd__and3_2 _0607_ (.A(\u_vga_controller.H_count[5] ),
    .B(\u_vga_controller.H_count[4] ),
    .C(_0230_),
    .X(_0328_));
 sky130_fd_sc_hd__nor3_2 _0608_ (.A(net40),
    .B(_0327_),
    .C(_0328_),
    .Y(_0029_));
 sky130_fd_sc_hd__nand2_2 _0609_ (.A(\u_vga_controller.H_count[6] ),
    .B(_0328_),
    .Y(_0329_));
 sky130_fd_sc_hd__or2_2 _0610_ (.A(\u_vga_controller.H_count[6] ),
    .B(_0328_),
    .X(_0330_));
 sky130_fd_sc_hd__and2_2 _0611_ (.A(_0329_),
    .B(_0330_),
    .X(_0030_));
 sky130_fd_sc_hd__xnor2_2 _0612_ (.A(\u_vga_controller.H_count[7] ),
    .B(_0329_),
    .Y(_0031_));
 sky130_fd_sc_hd__a31oi_2 _0613_ (.A1(\u_vga_controller.H_count[7] ),
    .A2(\u_vga_controller.H_count[6] ),
    .A3(_0328_),
    .B1(\u_vga_controller.H_count[8] ),
    .Y(_0331_));
 sky130_fd_sc_hd__and4_2 _0614_ (.A(\u_vga_controller.H_count[7] ),
    .B(\u_vga_controller.H_count[6] ),
    .C(\u_vga_controller.H_count[8] ),
    .D(_0328_),
    .X(_0332_));
 sky130_fd_sc_hd__nor3_2 _0615_ (.A(net40),
    .B(_0331_),
    .C(_0332_),
    .Y(_0032_));
 sky130_fd_sc_hd__and2_2 _0616_ (.A(\u_vga_controller.H_count[9] ),
    .B(_0332_),
    .X(_0333_));
 sky130_fd_sc_hd__nor2_2 _0617_ (.A(_0236_),
    .B(_0333_),
    .Y(_0334_));
 sky130_fd_sc_hd__o21a_2 _0618_ (.A1(\u_vga_controller.H_count[9] ),
    .A2(_0332_),
    .B1(_0334_),
    .X(_0033_));
 sky130_fd_sc_hd__xor2_2 _0619_ (.A(\u_vga_controller.H_count[10] ),
    .B(_0333_),
    .X(_0019_));
 sky130_fd_sc_hd__and3_2 _0620_ (.A(\u_vga_controller.H_count[10] ),
    .B(\u_vga_controller.H_count[11] ),
    .C(_0333_),
    .X(_0335_));
 sky130_fd_sc_hd__a21oi_2 _0621_ (.A1(\u_vga_controller.H_count[10] ),
    .A2(_0333_),
    .B1(\u_vga_controller.H_count[11] ),
    .Y(_0336_));
 sky130_fd_sc_hd__nor2_2 _0622_ (.A(_0335_),
    .B(_0336_),
    .Y(_0020_));
 sky130_fd_sc_hd__xor2_2 _0623_ (.A(\u_vga_controller.H_count[12] ),
    .B(_0335_),
    .X(_0021_));
 sky130_fd_sc_hd__and3_2 _0624_ (.A(\u_vga_controller.H_count[13] ),
    .B(\u_vga_controller.H_count[12] ),
    .C(_0335_),
    .X(_0337_));
 sky130_fd_sc_hd__a21oi_2 _0625_ (.A1(\u_vga_controller.H_count[12] ),
    .A2(_0335_),
    .B1(\u_vga_controller.H_count[13] ),
    .Y(_0338_));
 sky130_fd_sc_hd__nor2_2 _0626_ (.A(_0337_),
    .B(_0338_),
    .Y(_0022_));
 sky130_fd_sc_hd__nand2_2 _0627_ (.A(\u_vga_controller.H_count[14] ),
    .B(_0337_),
    .Y(_0339_));
 sky130_fd_sc_hd__xor2_2 _0628_ (.A(\u_vga_controller.H_count[14] ),
    .B(_0337_),
    .X(_0023_));
 sky130_fd_sc_hd__xnor2_2 _0629_ (.A(\u_vga_controller.H_count[15] ),
    .B(_0339_),
    .Y(_0024_));
 sky130_fd_sc_hd__nor2_2 _0630_ (.A(_0002_),
    .B(_0318_),
    .Y(_0340_));
 sky130_fd_sc_hd__nor2_2 _0631_ (.A(_0281_),
    .B(_0340_),
    .Y(_0188_));
 sky130_fd_sc_hd__nor2_2 _0632_ (.A(_0280_),
    .B(_0340_),
    .Y(_0189_));
 sky130_fd_sc_hd__nor3_2 _0633_ (.A(\u_vga_controller.H_count[5] ),
    .B(\u_vga_controller.H_count[4] ),
    .C(\u_vga_controller.H_count[6] ),
    .Y(_0341_));
 sky130_fd_sc_hd__a311o_2 _0634_ (.A1(\u_vga_controller.H_count[5] ),
    .A2(\u_vga_controller.H_count[4] ),
    .A3(\u_vga_controller.H_count[6] ),
    .B1(_0235_),
    .C1(_0341_),
    .X(_0342_));
 sky130_fd_sc_hd__or4b_2 _0635_ (.A(\u_vga_controller.H_count[8] ),
    .B(_0234_),
    .C(_0342_),
    .D_N(\u_vga_controller.H_count[7] ),
    .X(\u_vga_controller.raw_hsync ));
 sky130_fd_sc_hd__or4bb_2 _0636_ (.A(\u_vga_controller.V_count[9] ),
    .B(\u_vga_controller.V_count[4] ),
    .C_N(\u_vga_controller.V_count[5] ),
    .D_N(\u_vga_controller.V_count[8] ),
    .X(_0343_));
 sky130_fd_sc_hd__or4bb_2 _0637_ (.A(\u_vga_controller.V_count[11] ),
    .B(\u_vga_controller.V_count[10] ),
    .C_N(\u_vga_controller.V_count[7] ),
    .D_N(\u_vga_controller.V_count[6] ),
    .X(_0344_));
 sky130_fd_sc_hd__nand3b_2 _0638_ (.A_N(\u_vga_controller.V_count[2] ),
    .B(\u_vga_controller.V_count[1] ),
    .C(\u_vga_controller.V_count[3] ),
    .Y(_0345_));
 sky130_fd_sc_hd__or4_2 _0639_ (.A(_0252_),
    .B(_0343_),
    .C(_0344_),
    .D(_0345_),
    .X(\u_vga_controller.raw_vsync ));
 sky130_fd_sc_hd__and2_2 _0640_ (.A(\u_axi_decoder.wr_state[3] ),
    .B(_0319_),
    .X(_0003_));
 sky130_fd_sc_hd__a21oi_2 _0641_ (.A1(s1_axi_arready),
    .A2(\u_axi_decoder.s1_arvalid_reg ),
    .B1(_0197_),
    .Y(_0001_));
 sky130_fd_sc_hd__a21boi_2 _0642_ (.A1(\u_axi_decoder.unmapped_rvalid_reg ),
    .A2(m_axi_rready),
    .B1_N(\u_axi_decoder.rd_state[1] ),
    .Y(_0000_));
 sky130_fd_sc_hd__a21oi_2 _0643_ (.A1(net25),
    .A2(_0316_),
    .B1(net42),
    .Y(_0346_));
 sky130_fd_sc_hd__o21a_2 _0644_ (.A1(net25),
    .A2(_0316_),
    .B1(_0346_),
    .X(_0120_));
 sky130_fd_sc_hd__a21oi_2 _0645_ (.A1(net25),
    .A2(_0316_),
    .B1(net28),
    .Y(_0347_));
 sky130_fd_sc_hd__a31o_2 _0646_ (.A1(net28),
    .A2(net25),
    .A3(_0316_),
    .B1(net42),
    .X(_0348_));
 sky130_fd_sc_hd__nor2_2 _0647_ (.A(_0347_),
    .B(_0348_),
    .Y(_0121_));
 sky130_fd_sc_hd__a31oi_2 _0648_ (.A1(net28),
    .A2(net25),
    .A3(_0316_),
    .B1(net29),
    .Y(_0349_));
 sky130_fd_sc_hd__and4_2 _0649_ (.A(net29),
    .B(net28),
    .C(net25),
    .D(_0316_),
    .X(_0350_));
 sky130_fd_sc_hd__nor3_2 _0650_ (.A(net42),
    .B(_0349_),
    .C(_0350_),
    .Y(_0122_));
 sky130_fd_sc_hd__and4_2 _0651_ (.A(net30),
    .B(net29),
    .C(net28),
    .D(net25),
    .X(_0351_));
 sky130_fd_sc_hd__and2_2 _0652_ (.A(_0316_),
    .B(_0351_),
    .X(_0352_));
 sky130_fd_sc_hd__nor2_2 _0653_ (.A(net42),
    .B(_0352_),
    .Y(_0353_));
 sky130_fd_sc_hd__o21a_2 _0654_ (.A1(net30),
    .A2(_0350_),
    .B1(_0353_),
    .X(_0123_));
 sky130_fd_sc_hd__a21oi_2 _0655_ (.A1(net31),
    .A2(_0352_),
    .B1(net41),
    .Y(_0354_));
 sky130_fd_sc_hd__o21a_2 _0656_ (.A1(net31),
    .A2(_0352_),
    .B1(_0354_),
    .X(_0124_));
 sky130_fd_sc_hd__a21oi_2 _0657_ (.A1(net31),
    .A2(_0352_),
    .B1(net32),
    .Y(_0355_));
 sky130_fd_sc_hd__and3_2 _0658_ (.A(net32),
    .B(net31),
    .C(_0352_),
    .X(_0356_));
 sky130_fd_sc_hd__nor3_2 _0659_ (.A(net41),
    .B(_0355_),
    .C(_0356_),
    .Y(_0125_));
 sky130_fd_sc_hd__and4_2 _0660_ (.A(net33),
    .B(net32),
    .C(net31),
    .D(_0352_),
    .X(_0357_));
 sky130_fd_sc_hd__nor2_2 _0661_ (.A(net41),
    .B(_0357_),
    .Y(_0358_));
 sky130_fd_sc_hd__o21a_2 _0662_ (.A1(net33),
    .A2(_0356_),
    .B1(_0358_),
    .X(_0126_));
 sky130_fd_sc_hd__nor2_2 _0663_ (.A(net34),
    .B(_0357_),
    .Y(_0359_));
 sky130_fd_sc_hd__and4_2 _0664_ (.A(net34),
    .B(net33),
    .C(net32),
    .D(net31),
    .X(_0360_));
 sky130_fd_sc_hd__and3_2 _0665_ (.A(_0316_),
    .B(_0351_),
    .C(_0360_),
    .X(_0361_));
 sky130_fd_sc_hd__nor3_2 _0666_ (.A(net43),
    .B(_0359_),
    .C(_0361_),
    .Y(_0127_));
 sky130_fd_sc_hd__o21ai_2 _0667_ (.A1(net5),
    .A2(_0361_),
    .B1(_0038_),
    .Y(_0362_));
 sky130_fd_sc_hd__a21oi_2 _0668_ (.A1(net5),
    .A2(_0361_),
    .B1(_0362_),
    .Y(_0128_));
 sky130_fd_sc_hd__a21oi_2 _0669_ (.A1(net5),
    .A2(_0361_),
    .B1(net6),
    .Y(_0363_));
 sky130_fd_sc_hd__and3_2 _0670_ (.A(net6),
    .B(net5),
    .C(_0361_),
    .X(_0364_));
 sky130_fd_sc_hd__nor3_2 _0671_ (.A(net43),
    .B(_0363_),
    .C(_0364_),
    .Y(_0129_));
 sky130_fd_sc_hd__and3_2 _0672_ (.A(net7),
    .B(net6),
    .C(net5),
    .X(_0365_));
 sky130_fd_sc_hd__nand2_2 _0673_ (.A(_0361_),
    .B(_0365_),
    .Y(_0366_));
 sky130_fd_sc_hd__o211a_2 _0674_ (.A1(net7),
    .A2(_0364_),
    .B1(_0366_),
    .C1(_0038_),
    .X(_0130_));
 sky130_fd_sc_hd__a21oi_2 _0675_ (.A1(_0361_),
    .A2(_0365_),
    .B1(net8),
    .Y(_0367_));
 sky130_fd_sc_hd__and3_2 _0676_ (.A(net8),
    .B(_0361_),
    .C(_0365_),
    .X(_0368_));
 sky130_fd_sc_hd__nor3_2 _0677_ (.A(net43),
    .B(_0367_),
    .C(_0368_),
    .Y(_0131_));
 sky130_fd_sc_hd__and2_2 _0678_ (.A(net9),
    .B(net8),
    .X(_0369_));
 sky130_fd_sc_hd__nand4_2 _0679_ (.A(_0351_),
    .B(_0360_),
    .C(_0365_),
    .D(_0369_),
    .Y(_0370_));
 sky130_fd_sc_hd__or2_2 _0680_ (.A(net4),
    .B(_0370_),
    .X(_0371_));
 sky130_fd_sc_hd__and4_2 _0681_ (.A(_0351_),
    .B(_0360_),
    .C(_0365_),
    .D(_0369_),
    .X(_0372_));
 sky130_fd_sc_hd__o211a_2 _0682_ (.A1(net9),
    .A2(_0368_),
    .B1(_0371_),
    .C1(_0038_),
    .X(_0132_));
 sky130_fd_sc_hd__and3_2 _0683_ (.A(net10),
    .B(_0316_),
    .C(_0372_),
    .X(_0373_));
 sky130_fd_sc_hd__a21o_2 _0684_ (.A1(_0194_),
    .A2(_0371_),
    .B1(_0373_),
    .X(_0374_));
 sky130_fd_sc_hd__nor2_2 _0685_ (.A(net43),
    .B(_0374_),
    .Y(_0133_));
 sky130_fd_sc_hd__a2111oi_2 _0686_ (.A1(_0314_),
    .A2(_0315_),
    .B1(_0370_),
    .C1(_0194_),
    .D1(_0193_),
    .Y(_0375_));
 sky130_fd_sc_hd__nor2_2 _0687_ (.A(net43),
    .B(_0375_),
    .Y(_0376_));
 sky130_fd_sc_hd__o21a_2 _0688_ (.A1(net11),
    .A2(_0373_),
    .B1(_0376_),
    .X(_0134_));
 sky130_fd_sc_hd__nor2_2 _0689_ (.A(net12),
    .B(net37),
    .Y(_0377_));
 sky130_fd_sc_hd__and3_2 _0690_ (.A(net12),
    .B(net11),
    .C(_0373_),
    .X(_0378_));
 sky130_fd_sc_hd__nor3_2 _0691_ (.A(net46),
    .B(_0377_),
    .C(_0378_),
    .Y(_0135_));
 sky130_fd_sc_hd__a31o_2 _0692_ (.A1(net13),
    .A2(net12),
    .A3(net36),
    .B1(net46),
    .X(_0379_));
 sky130_fd_sc_hd__o21ba_2 _0693_ (.A1(net13),
    .A2(_0378_),
    .B1_N(_0379_),
    .X(_0136_));
 sky130_fd_sc_hd__a21oi_2 _0694_ (.A1(net13),
    .A2(_0378_),
    .B1(net14),
    .Y(_0380_));
 sky130_fd_sc_hd__and4_2 _0695_ (.A(net14),
    .B(net13),
    .C(net12),
    .D(net36),
    .X(_0381_));
 sky130_fd_sc_hd__nor3_2 _0696_ (.A(net46),
    .B(_0380_),
    .C(_0381_),
    .Y(_0137_));
 sky130_fd_sc_hd__a21oi_2 _0697_ (.A1(net15),
    .A2(_0381_),
    .B1(net47),
    .Y(_0382_));
 sky130_fd_sc_hd__o21a_2 _0698_ (.A1(net15),
    .A2(_0381_),
    .B1(_0382_),
    .X(_0138_));
 sky130_fd_sc_hd__a21oi_2 _0699_ (.A1(net15),
    .A2(_0381_),
    .B1(net16),
    .Y(_0383_));
 sky130_fd_sc_hd__and3_2 _0700_ (.A(net16),
    .B(net15),
    .C(_0381_),
    .X(_0384_));
 sky130_fd_sc_hd__nor3_2 _0701_ (.A(net47),
    .B(_0383_),
    .C(_0384_),
    .Y(_0139_));
 sky130_fd_sc_hd__and4_2 _0702_ (.A(net17),
    .B(net16),
    .C(net15),
    .D(_0381_),
    .X(_0385_));
 sky130_fd_sc_hd__nor2_2 _0703_ (.A(net47),
    .B(_0385_),
    .Y(_0386_));
 sky130_fd_sc_hd__o21a_2 _0704_ (.A1(net17),
    .A2(_0384_),
    .B1(_0386_),
    .X(_0140_));
 sky130_fd_sc_hd__a21oi_2 _0705_ (.A1(net18),
    .A2(_0385_),
    .B1(net46),
    .Y(_0387_));
 sky130_fd_sc_hd__o21a_2 _0706_ (.A1(net18),
    .A2(_0385_),
    .B1(_0387_),
    .X(_0141_));
 sky130_fd_sc_hd__a21oi_2 _0707_ (.A1(net18),
    .A2(_0385_),
    .B1(net19),
    .Y(_0388_));
 sky130_fd_sc_hd__and3_2 _0708_ (.A(net19),
    .B(net18),
    .C(_0385_),
    .X(_0389_));
 sky130_fd_sc_hd__nor3_2 _0709_ (.A(net47),
    .B(_0388_),
    .C(_0389_),
    .Y(_0142_));
 sky130_fd_sc_hd__and4_2 _0710_ (.A(net20),
    .B(net19),
    .C(net18),
    .D(_0385_),
    .X(_0390_));
 sky130_fd_sc_hd__nor2_2 _0711_ (.A(net47),
    .B(net35),
    .Y(_0391_));
 sky130_fd_sc_hd__o21a_2 _0712_ (.A1(net20),
    .A2(_0389_),
    .B1(_0391_),
    .X(_0143_));
 sky130_fd_sc_hd__a21oi_2 _0713_ (.A1(net21),
    .A2(net35),
    .B1(net51),
    .Y(_0392_));
 sky130_fd_sc_hd__o21a_2 _0714_ (.A1(net21),
    .A2(net35),
    .B1(_0392_),
    .X(_0144_));
 sky130_fd_sc_hd__a21oi_2 _0715_ (.A1(net21),
    .A2(net35),
    .B1(net22),
    .Y(_0393_));
 sky130_fd_sc_hd__a31o_2 _0716_ (.A1(net22),
    .A2(net21),
    .A3(net35),
    .B1(net51),
    .X(_0394_));
 sky130_fd_sc_hd__nor2_2 _0717_ (.A(_0393_),
    .B(_0394_),
    .Y(_0145_));
 sky130_fd_sc_hd__a31o_2 _0718_ (.A1(net22),
    .A2(net21),
    .A3(net35),
    .B1(net23),
    .X(_0395_));
 sky130_fd_sc_hd__and3_2 _0719_ (.A(net23),
    .B(net22),
    .C(net21),
    .X(_0396_));
 sky130_fd_sc_hd__nand2_2 _0720_ (.A(net35),
    .B(_0396_),
    .Y(_0397_));
 sky130_fd_sc_hd__and3_2 _0721_ (.A(_0038_),
    .B(_0395_),
    .C(_0397_),
    .X(_0146_));
 sky130_fd_sc_hd__a31o_2 _0722_ (.A1(net24),
    .A2(net35),
    .A3(_0396_),
    .B1(net51),
    .X(_0398_));
 sky130_fd_sc_hd__a21oi_2 _0723_ (.A1(_0192_),
    .A2(_0397_),
    .B1(_0398_),
    .Y(_0147_));
 sky130_fd_sc_hd__a31o_2 _0724_ (.A1(net24),
    .A2(net35),
    .A3(_0396_),
    .B1(net26),
    .X(_0399_));
 sky130_fd_sc_hd__and2_2 _0725_ (.A(net26),
    .B(net24),
    .X(_0400_));
 sky130_fd_sc_hd__a31o_2 _0726_ (.A1(net35),
    .A2(_0396_),
    .A3(_0400_),
    .B1(net51),
    .X(_0401_));
 sky130_fd_sc_hd__and2b_2 _0727_ (.A_N(_0401_),
    .B(_0399_),
    .X(_0148_));
 sky130_fd_sc_hd__nand4_2 _0728_ (.A(net27),
    .B(_0390_),
    .C(_0396_),
    .D(_0400_),
    .Y(_0402_));
 sky130_fd_sc_hd__a31o_2 _0729_ (.A1(_0390_),
    .A2(_0396_),
    .A3(_0400_),
    .B1(net27),
    .X(_0403_));
 sky130_fd_sc_hd__and3_2 _0730_ (.A(_0038_),
    .B(_0402_),
    .C(_0403_),
    .X(_0149_));
 sky130_fd_sc_hd__inv_2 _0731_ (.A(net48),
    .Y(_0039_));
 sky130_fd_sc_hd__inv_2 _0732_ (.A(net45),
    .Y(_0040_));
 sky130_fd_sc_hd__inv_2 _0733_ (.A(net60),
    .Y(_0041_));
 sky130_fd_sc_hd__inv_2 _0734_ (.A(net54),
    .Y(_0042_));
 sky130_fd_sc_hd__inv_2 _0735_ (.A(net52),
    .Y(_0043_));
 sky130_fd_sc_hd__inv_2 _0736_ (.A(net52),
    .Y(_0044_));
 sky130_fd_sc_hd__inv_2 _0737_ (.A(net53),
    .Y(_0045_));
 sky130_fd_sc_hd__inv_2 _0738_ (.A(net53),
    .Y(_0046_));
 sky130_fd_sc_hd__inv_2 _0739_ (.A(net53),
    .Y(_0047_));
 sky130_fd_sc_hd__inv_2 _0740_ (.A(net53),
    .Y(_0048_));
 sky130_fd_sc_hd__inv_2 _0741_ (.A(net53),
    .Y(_0049_));
 sky130_fd_sc_hd__inv_2 _0742_ (.A(net55),
    .Y(_0050_));
 sky130_fd_sc_hd__inv_2 _0743_ (.A(net55),
    .Y(_0051_));
 sky130_fd_sc_hd__inv_2 _0744_ (.A(net55),
    .Y(_0052_));
 sky130_fd_sc_hd__inv_2 _0745_ (.A(net42),
    .Y(_0053_));
 sky130_fd_sc_hd__inv_2 _0746_ (.A(net44),
    .Y(_0054_));
 sky130_fd_sc_hd__inv_2 _0747_ (.A(net53),
    .Y(_0055_));
 sky130_fd_sc_hd__inv_2 _0748_ (.A(net57),
    .Y(_0056_));
 sky130_fd_sc_hd__inv_2 _0749_ (.A(net45),
    .Y(_0057_));
 sky130_fd_sc_hd__inv_2 _0750_ (.A(net55),
    .Y(_0058_));
 sky130_fd_sc_hd__inv_2 _0751_ (.A(net41),
    .Y(_0059_));
 sky130_fd_sc_hd__inv_2 _0752_ (.A(net42),
    .Y(_0060_));
 sky130_fd_sc_hd__inv_2 _0753_ (.A(net43),
    .Y(_0061_));
 sky130_fd_sc_hd__inv_2 _0754_ (.A(net59),
    .Y(_0062_));
 sky130_fd_sc_hd__inv_2 _0755_ (.A(net59),
    .Y(_0063_));
 sky130_fd_sc_hd__inv_2 _0756_ (.A(net61),
    .Y(_0064_));
 sky130_fd_sc_hd__inv_2 _0757_ (.A(net61),
    .Y(_0065_));
 sky130_fd_sc_hd__inv_2 _0758_ (.A(net62),
    .Y(_0066_));
 sky130_fd_sc_hd__inv_2 _0759_ (.A(net62),
    .Y(_0067_));
 sky130_fd_sc_hd__inv_2 _0760_ (.A(net61),
    .Y(_0068_));
 sky130_fd_sc_hd__inv_2 _0761_ (.A(net61),
    .Y(_0069_));
 sky130_fd_sc_hd__inv_2 _0762_ (.A(net59),
    .Y(_0070_));
 sky130_fd_sc_hd__inv_2 _0763_ (.A(net59),
    .Y(_0071_));
 sky130_fd_sc_hd__inv_2 _0764_ (.A(net60),
    .Y(_0072_));
 sky130_fd_sc_hd__inv_2 _0765_ (.A(net58),
    .Y(_0073_));
 sky130_fd_sc_hd__inv_2 _0766_ (.A(net60),
    .Y(_0074_));
 sky130_fd_sc_hd__inv_2 _0767_ (.A(net60),
    .Y(_0075_));
 sky130_fd_sc_hd__inv_2 _0768_ (.A(net61),
    .Y(_0076_));
 sky130_fd_sc_hd__inv_2 _0769_ (.A(net61),
    .Y(_0077_));
 sky130_fd_sc_hd__inv_2 _0770_ (.A(net57),
    .Y(_0078_));
 sky130_fd_sc_hd__inv_2 _0771_ (.A(net54),
    .Y(_0079_));
 sky130_fd_sc_hd__inv_2 _0772_ (.A(net45),
    .Y(_0080_));
 sky130_fd_sc_hd__inv_2 _0773_ (.A(net45),
    .Y(_0081_));
 sky130_fd_sc_hd__inv_2 _0774_ (.A(net45),
    .Y(_0082_));
 sky130_fd_sc_hd__inv_2 _0775_ (.A(net44),
    .Y(_0083_));
 sky130_fd_sc_hd__inv_2 _0776_ (.A(net45),
    .Y(_0084_));
 sky130_fd_sc_hd__inv_2 _0777_ (.A(net45),
    .Y(_0085_));
 sky130_fd_sc_hd__inv_2 _0778_ (.A(net57),
    .Y(_0086_));
 sky130_fd_sc_hd__inv_2 _0779_ (.A(net63),
    .Y(_0087_));
 sky130_fd_sc_hd__inv_2 _0780_ (.A(net54),
    .Y(_0088_));
 sky130_fd_sc_hd__inv_2 _0781_ (.A(net55),
    .Y(_0089_));
 sky130_fd_sc_hd__inv_2 _0782_ (.A(net55),
    .Y(_0090_));
 sky130_fd_sc_hd__inv_2 _0783_ (.A(net57),
    .Y(_0091_));
 sky130_fd_sc_hd__inv_2 _0784_ (.A(net55),
    .Y(_0092_));
 sky130_fd_sc_hd__inv_2 _0785_ (.A(net57),
    .Y(_0093_));
 sky130_fd_sc_hd__inv_2 _0786_ (.A(net57),
    .Y(_0094_));
 sky130_fd_sc_hd__inv_2 _0787_ (.A(net52),
    .Y(_0095_));
 sky130_fd_sc_hd__inv_2 _0788_ (.A(net52),
    .Y(_0096_));
 sky130_fd_sc_hd__inv_2 _0789_ (.A(net58),
    .Y(_0097_));
 sky130_fd_sc_hd__inv_2 _0790_ (.A(net58),
    .Y(_0098_));
 sky130_fd_sc_hd__inv_2 _0791_ (.A(net48),
    .Y(_0099_));
 sky130_fd_sc_hd__inv_2 _0792_ (.A(net58),
    .Y(_0100_));
 sky130_fd_sc_hd__inv_2 _0793_ (.A(net46),
    .Y(_0101_));
 sky130_fd_sc_hd__inv_2 _0794_ (.A(net49),
    .Y(_0102_));
 sky130_fd_sc_hd__inv_2 _0795_ (.A(net49),
    .Y(_0103_));
 sky130_fd_sc_hd__inv_2 _0796_ (.A(net49),
    .Y(_0104_));
 sky130_fd_sc_hd__inv_2 _0797_ (.A(net50),
    .Y(_0105_));
 sky130_fd_sc_hd__inv_2 _0798_ (.A(net50),
    .Y(_0106_));
 sky130_fd_sc_hd__inv_2 _0799_ (.A(net62),
    .Y(_0107_));
 sky130_fd_sc_hd__inv_2 _0800_ (.A(net62),
    .Y(_0108_));
 sky130_fd_sc_hd__inv_2 _0801_ (.A(net62),
    .Y(_0109_));
 sky130_fd_sc_hd__inv_2 _0802_ (.A(net50),
    .Y(_0110_));
 sky130_fd_sc_hd__inv_2 _0803_ (.A(net59),
    .Y(_0111_));
 sky130_fd_sc_hd__inv_2 _0804_ (.A(net59),
    .Y(_0112_));
 sky130_fd_sc_hd__inv_2 _0805_ (.A(net49),
    .Y(_0113_));
 sky130_fd_sc_hd__inv_2 _0806_ (.A(net48),
    .Y(_0114_));
 sky130_fd_sc_hd__inv_2 _0807_ (.A(net49),
    .Y(_0115_));
 sky130_fd_sc_hd__inv_2 _0808_ (.A(net49),
    .Y(_0116_));
 sky130_fd_sc_hd__inv_2 _0809_ (.A(net50),
    .Y(_0117_));
 sky130_fd_sc_hd__inv_2 _0810_ (.A(net50),
    .Y(_0118_));
 sky130_fd_sc_hd__dfrtp_2 _0811_ (.CLK(clk),
    .D(_0119_),
    .RESET_B(_0038_),
    .Q(m_axi_bready));
 sky130_fd_sc_hd__dfstp_2 _0812_ (.CLK(clk),
    .D(_0016_),
    .SET_B(_0039_),
    .Q(\u_vga_registers.wr_state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _0813_ (.CLK(clk),
    .D(_0017_),
    .RESET_B(_0040_),
    .Q(\u_vga_registers.wr_state[1] ));
 sky130_fd_sc_hd__dfstp_2 _0814_ (.CLK(clk),
    .D(_0014_),
    .SET_B(_0041_),
    .Q(\u_vga_registers.rd_state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _0815_ (.CLK(clk),
    .D(_0015_),
    .RESET_B(_0042_),
    .Q(\u_vga_registers.rd_state[3] ));
 sky130_fd_sc_hd__dfxtp_2 _0816_ (.CLK(clk),
    .D(_0120_),
    .Q(net25));
 sky130_fd_sc_hd__dfxtp_2 _0817_ (.CLK(clk),
    .D(_0121_),
    .Q(net28));
 sky130_fd_sc_hd__dfxtp_2 _0818_ (.CLK(clk),
    .D(_0122_),
    .Q(net29));
 sky130_fd_sc_hd__dfxtp_2 _0819_ (.CLK(clk),
    .D(_0123_),
    .Q(net30));
 sky130_fd_sc_hd__dfxtp_2 _0820_ (.CLK(clk),
    .D(_0124_),
    .Q(net31));
 sky130_fd_sc_hd__dfxtp_2 _0821_ (.CLK(clk),
    .D(_0125_),
    .Q(net32));
 sky130_fd_sc_hd__dfxtp_2 _0822_ (.CLK(clk),
    .D(_0126_),
    .Q(net33));
 sky130_fd_sc_hd__dfxtp_2 _0823_ (.CLK(clk),
    .D(_0127_),
    .Q(net34));
 sky130_fd_sc_hd__dfxtp_2 _0824_ (.CLK(clk),
    .D(_0128_),
    .Q(net5));
 sky130_fd_sc_hd__dfxtp_2 _0825_ (.CLK(clk),
    .D(_0129_),
    .Q(net6));
 sky130_fd_sc_hd__dfxtp_2 _0826_ (.CLK(clk),
    .D(_0130_),
    .Q(net7));
 sky130_fd_sc_hd__dfxtp_2 _0827_ (.CLK(clk),
    .D(_0131_),
    .Q(net8));
 sky130_fd_sc_hd__dfxtp_2 _0828_ (.CLK(clk),
    .D(_0132_),
    .Q(net9));
 sky130_fd_sc_hd__dfxtp_2 _0829_ (.CLK(clk),
    .D(_0133_),
    .Q(net10));
 sky130_fd_sc_hd__dfxtp_2 _0830_ (.CLK(clk),
    .D(_0134_),
    .Q(net11));
 sky130_fd_sc_hd__dfxtp_2 _0831_ (.CLK(clk),
    .D(_0135_),
    .Q(net12));
 sky130_fd_sc_hd__dfxtp_2 _0832_ (.CLK(clk),
    .D(_0136_),
    .Q(net13));
 sky130_fd_sc_hd__dfxtp_2 _0833_ (.CLK(clk),
    .D(_0137_),
    .Q(net14));
 sky130_fd_sc_hd__dfxtp_2 _0834_ (.CLK(clk),
    .D(_0138_),
    .Q(net15));
 sky130_fd_sc_hd__dfxtp_2 _0835_ (.CLK(clk),
    .D(_0139_),
    .Q(net16));
 sky130_fd_sc_hd__dfxtp_2 _0836_ (.CLK(clk),
    .D(_0140_),
    .Q(net17));
 sky130_fd_sc_hd__dfxtp_2 _0837_ (.CLK(clk),
    .D(_0141_),
    .Q(net18));
 sky130_fd_sc_hd__dfxtp_2 _0838_ (.CLK(clk),
    .D(_0142_),
    .Q(net19));
 sky130_fd_sc_hd__dfxtp_2 _0839_ (.CLK(clk),
    .D(_0143_),
    .Q(net20));
 sky130_fd_sc_hd__dfxtp_2 _0840_ (.CLK(clk),
    .D(_0144_),
    .Q(net21));
 sky130_fd_sc_hd__dfxtp_2 _0841_ (.CLK(clk),
    .D(_0145_),
    .Q(net22));
 sky130_fd_sc_hd__dfxtp_2 _0842_ (.CLK(clk),
    .D(_0146_),
    .Q(net23));
 sky130_fd_sc_hd__dfxtp_2 _0843_ (.CLK(clk),
    .D(_0147_),
    .Q(net24));
 sky130_fd_sc_hd__dfxtp_2 _0844_ (.CLK(clk),
    .D(_0148_),
    .Q(net26));
 sky130_fd_sc_hd__dfxtp_2 _0845_ (.CLK(clk),
    .D(_0149_),
    .Q(net27));
 sky130_fd_sc_hd__dfrtp_2 _0846_ (.CLK(clk),
    .D(_0150_),
    .RESET_B(_0043_),
    .Q(m_axi_awvalid));
 sky130_fd_sc_hd__dfrtp_2 _0847_ (.CLK(clk),
    .D(_0151_),
    .RESET_B(_0044_),
    .Q(m_axi_wvalid));
 sky130_fd_sc_hd__dfrtp_2 _0848_ (.CLK(clk),
    .D(_0152_),
    .RESET_B(_0045_),
    .Q(m_axi_arvalid));
 sky130_fd_sc_hd__dfrtp_2 _0849_ (.CLK(clk),
    .D(_0153_),
    .RESET_B(_0046_),
    .Q(m_axi_rready));
 sky130_fd_sc_hd__dfrtp_2 _0850_ (.CLK(clk),
    .D(_0154_),
    .RESET_B(_0047_),
    .Q(\u_axi_bridge.state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _0851_ (.CLK(clk),
    .D(_0155_),
    .RESET_B(_0048_),
    .Q(\u_axi_bridge.state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _0852_ (.CLK(clk),
    .D(_0156_),
    .RESET_B(_0049_),
    .Q(\u_axi_bridge.state[2] ));
 sky130_fd_sc_hd__dfrtp_2 _0853_ (.CLK(clk),
    .D(_0157_),
    .RESET_B(_0050_),
    .Q(\u_axi_decoder.s0_arvalid_reg ));
 sky130_fd_sc_hd__dfrtp_2 _0854_ (.CLK(clk),
    .D(_0158_),
    .RESET_B(_0051_),
    .Q(\u_axi_decoder.s1_arvalid_reg ));
 sky130_fd_sc_hd__dfrtp_2 _0855_ (.CLK(clk),
    .D(_0159_),
    .RESET_B(_0052_),
    .Q(\u_axi_decoder.unmapped_rvalid_reg ));
 sky130_fd_sc_hd__dfrtp_2 _0856_ (.CLK(clk),
    .D(_0160_),
    .RESET_B(_0053_),
    .Q(\u_axi_decoder.s0_awvalid_reg ));
 sky130_fd_sc_hd__dfrtp_2 _0857_ (.CLK(clk),
    .D(_0161_),
    .RESET_B(_0054_),
    .Q(\u_axi_decoder.s0_wvalid_reg ));
 sky130_fd_sc_hd__dfrtp_2 _0858_ (.CLK(clk),
    .D(_0162_),
    .RESET_B(_0055_),
    .Q(\u_axi_decoder.s1_awvalid_reg ));
 sky130_fd_sc_hd__dfrtp_2 _0859_ (.CLK(clk),
    .D(_0163_),
    .RESET_B(_0056_),
    .Q(\u_axi_decoder.s1_wvalid_reg ));
 sky130_fd_sc_hd__dfrtp_2 _0860_ (.CLK(clk),
    .D(_0164_),
    .RESET_B(_0057_),
    .Q(\u_axi_decoder.unmapped_bvalid_reg ));
 sky130_fd_sc_hd__dfrtp_2 _0861_ (.CLK(clk),
    .D(_0165_),
    .RESET_B(_0058_),
    .Q(s0_axi_rvalid));
 sky130_fd_sc_hd__dfrtp_2 _0862_ (.CLK(clk),
    .D(_0166_),
    .RESET_B(_0059_),
    .Q(s0_axi_bvalid));
 sky130_fd_sc_hd__dfrtp_2 _0863_ (.CLK(clk),
    .D(_0167_),
    .RESET_B(_0060_),
    .Q(\u_data_memory.aw_latched ));
 sky130_fd_sc_hd__dfrtp_2 _0864_ (.CLK(clk),
    .D(_0168_),
    .RESET_B(_0061_),
    .Q(\u_data_memory.w_latched ));
 sky130_fd_sc_hd__dfrtp_2 _0865_ (.CLK(clk),
    .D(_0169_),
    .RESET_B(_0062_),
    .Q(\u_vga_controller.V_count[0] ));
 sky130_fd_sc_hd__dfrtp_2 _0866_ (.CLK(clk),
    .D(_0170_),
    .RESET_B(_0063_),
    .Q(\u_vga_controller.V_count[1] ));
 sky130_fd_sc_hd__dfrtp_2 _0867_ (.CLK(clk),
    .D(_0171_),
    .RESET_B(_0064_),
    .Q(\u_vga_controller.V_count[2] ));
 sky130_fd_sc_hd__dfrtp_2 _0868_ (.CLK(clk),
    .D(_0172_),
    .RESET_B(_0065_),
    .Q(\u_vga_controller.V_count[3] ));
 sky130_fd_sc_hd__dfrtp_2 _0869_ (.CLK(clk),
    .D(_0173_),
    .RESET_B(_0066_),
    .Q(\u_vga_controller.V_count[4] ));
 sky130_fd_sc_hd__dfrtp_2 _0870_ (.CLK(clk),
    .D(_0174_),
    .RESET_B(_0067_),
    .Q(\u_vga_controller.V_count[5] ));
 sky130_fd_sc_hd__dfrtp_2 _0871_ (.CLK(clk),
    .D(_0175_),
    .RESET_B(_0068_),
    .Q(\u_vga_controller.V_count[6] ));
 sky130_fd_sc_hd__dfrtp_2 _0872_ (.CLK(clk),
    .D(_0176_),
    .RESET_B(_0069_),
    .Q(\u_vga_controller.V_count[7] ));
 sky130_fd_sc_hd__dfrtp_2 _0873_ (.CLK(clk),
    .D(_0177_),
    .RESET_B(_0070_),
    .Q(\u_vga_controller.V_count[8] ));
 sky130_fd_sc_hd__dfrtp_2 _0874_ (.CLK(clk),
    .D(_0178_),
    .RESET_B(_0071_),
    .Q(\u_vga_controller.V_count[9] ));
 sky130_fd_sc_hd__dfrtp_2 _0875_ (.CLK(clk),
    .D(_0179_),
    .RESET_B(_0072_),
    .Q(\u_vga_controller.V_count[10] ));
 sky130_fd_sc_hd__dfrtp_2 _0876_ (.CLK(clk),
    .D(_0180_),
    .RESET_B(_0073_),
    .Q(\u_vga_controller.V_count[11] ));
 sky130_fd_sc_hd__dfrtp_2 _0877_ (.CLK(clk),
    .D(_0181_),
    .RESET_B(_0074_),
    .Q(\u_vga_controller.V_count[12] ));
 sky130_fd_sc_hd__dfrtp_2 _0878_ (.CLK(clk),
    .D(_0182_),
    .RESET_B(_0075_),
    .Q(\u_vga_controller.V_count[13] ));
 sky130_fd_sc_hd__dfrtp_2 _0879_ (.CLK(clk),
    .D(_0183_),
    .RESET_B(_0076_),
    .Q(\u_vga_controller.V_count[14] ));
 sky130_fd_sc_hd__dfrtp_2 _0880_ (.CLK(clk),
    .D(_0184_),
    .RESET_B(_0077_),
    .Q(\u_vga_controller.V_count[15] ));
 sky130_fd_sc_hd__dfstp_2 _0881_ (.CLK(clk),
    .D(_0185_),
    .SET_B(_0078_),
    .Q(s1_axi_arready));
 sky130_fd_sc_hd__dfrtp_2 _0882_ (.CLK(clk),
    .D(_0186_),
    .RESET_B(_0079_),
    .Q(s1_axi_rvalid));
 sky130_fd_sc_hd__dfrtp_2 _0883_ (.CLK(clk),
    .D(_0187_),
    .RESET_B(_0080_),
    .Q(s1_axi_bvalid));
 sky130_fd_sc_hd__dfrtp_2 _0884_ (.CLK(clk),
    .D(_0012_),
    .RESET_B(_0081_),
    .Q(\u_axi_decoder.wr_target_owner[1] ));
 sky130_fd_sc_hd__dfrtp_2 _0885_ (.CLK(clk),
    .D(_0013_),
    .RESET_B(_0082_),
    .Q(\u_axi_decoder.wr_target_owner[2] ));
 sky130_fd_sc_hd__dfstp_2 _0886_ (.CLK(clk),
    .D(_0009_),
    .SET_B(_0083_),
    .Q(\u_axi_decoder.wr_state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _0887_ (.CLK(clk),
    .D(_0002_),
    .RESET_B(_0084_),
    .Q(\u_axi_decoder.wr_state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _0888_ (.CLK(clk),
    .D(_0010_),
    .RESET_B(_0085_),
    .Q(\u_axi_decoder.wr_state[2] ));
 sky130_fd_sc_hd__dfrtp_2 _0889_ (.CLK(clk),
    .D(_0003_),
    .RESET_B(_0086_),
    .Q(\u_axi_decoder.wr_state[3] ));
 sky130_fd_sc_hd__dfrtp_2 _0890_ (.CLK(clk),
    .D(_0011_),
    .RESET_B(_0087_),
    .Q(\u_axi_decoder.wr_state[4] ));
 sky130_fd_sc_hd__dfrtp_2 _0891_ (.CLK(clk),
    .D(_0007_),
    .RESET_B(_0088_),
    .Q(\u_axi_decoder.rd_target_owner[1] ));
 sky130_fd_sc_hd__dfrtp_2 _0892_ (.CLK(clk),
    .D(_0008_),
    .RESET_B(_0089_),
    .Q(\u_axi_decoder.rd_target_owner[2] ));
 sky130_fd_sc_hd__dfstp_2 _0893_ (.CLK(clk),
    .D(_0004_),
    .SET_B(_0090_),
    .Q(m_axi_arready));
 sky130_fd_sc_hd__dfrtp_2 _0894_ (.CLK(clk),
    .D(_0000_),
    .RESET_B(_0091_),
    .Q(\u_axi_decoder.rd_state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _0895_ (.CLK(clk),
    .D(_0005_),
    .RESET_B(_0092_),
    .Q(\u_axi_decoder.rd_state[2] ));
 sky130_fd_sc_hd__dfrtp_2 _0896_ (.CLK(clk),
    .D(_0001_),
    .RESET_B(_0093_),
    .Q(\u_axi_decoder.rd_state[3] ));
 sky130_fd_sc_hd__dfrtp_2 _0897_ (.CLK(clk),
    .D(_0006_),
    .RESET_B(_0094_),
    .Q(\u_axi_decoder.rd_state[4] ));
 sky130_fd_sc_hd__dfrtp_2 _0898_ (.CLK(clk),
    .D(_0188_),
    .RESET_B(_0095_),
    .Q(\u_axi_decoder.w_latched ));
 sky130_fd_sc_hd__dfrtp_2 _0899_ (.CLK(clk),
    .D(_0189_),
    .RESET_B(_0096_),
    .Q(\u_axi_decoder.aw_latched ));
 sky130_fd_sc_hd__dfstp_2 _0900_ (.CLK(clk),
    .D(_0036_),
    .SET_B(_0097_),
    .Q(s1_axi_wready));
 sky130_fd_sc_hd__dfstp_2 _0901_ (.CLK(clk),
    .D(_0035_),
    .SET_B(_0098_),
    .Q(s1_axi_awready));
 sky130_fd_sc_hd__dfrtp_2 _0902_ (.CLK(clk),
    .D(_0037_),
    .RESET_B(_0099_),
    .Q(\u_vga_registers.w_latched ));
 sky130_fd_sc_hd__dfrtp_2 _0903_ (.CLK(clk),
    .D(_0034_),
    .RESET_B(_0100_),
    .Q(\u_vga_registers.aw_latched ));
 sky130_fd_sc_hd__dfrtp_2 _0904_ (.CLK(clk),
    .D(_0018_),
    .RESET_B(_0101_),
    .Q(\u_vga_controller.H_count[0] ));
 sky130_fd_sc_hd__dfrtp_2 _0905_ (.CLK(clk),
    .D(_0025_),
    .RESET_B(_0102_),
    .Q(\u_vga_controller.H_count[1] ));
 sky130_fd_sc_hd__dfrtp_2 _0906_ (.CLK(clk),
    .D(_0026_),
    .RESET_B(_0103_),
    .Q(\u_vga_controller.H_count[2] ));
 sky130_fd_sc_hd__dfrtp_2 _0907_ (.CLK(clk),
    .D(_0027_),
    .RESET_B(_0104_),
    .Q(\u_vga_controller.H_count[3] ));
 sky130_fd_sc_hd__dfrtp_2 _0908_ (.CLK(clk),
    .D(_0028_),
    .RESET_B(_0105_),
    .Q(\u_vga_controller.H_count[4] ));
 sky130_fd_sc_hd__dfrtp_2 _0909_ (.CLK(clk),
    .D(_0029_),
    .RESET_B(_0106_),
    .Q(\u_vga_controller.H_count[5] ));
 sky130_fd_sc_hd__dfrtp_2 _0910_ (.CLK(clk),
    .D(_0030_),
    .RESET_B(_0107_),
    .Q(\u_vga_controller.H_count[6] ));
 sky130_fd_sc_hd__dfrtp_2 _0911_ (.CLK(clk),
    .D(_0031_),
    .RESET_B(_0108_),
    .Q(\u_vga_controller.H_count[7] ));
 sky130_fd_sc_hd__dfrtp_2 _0912_ (.CLK(clk),
    .D(_0032_),
    .RESET_B(_0109_),
    .Q(\u_vga_controller.H_count[8] ));
 sky130_fd_sc_hd__dfrtp_2 _0913_ (.CLK(clk),
    .D(_0033_),
    .RESET_B(_0110_),
    .Q(\u_vga_controller.H_count[9] ));
 sky130_fd_sc_hd__dfrtp_2 _0914_ (.CLK(clk),
    .D(_0019_),
    .RESET_B(_0111_),
    .Q(\u_vga_controller.H_count[10] ));
 sky130_fd_sc_hd__dfrtp_2 _0915_ (.CLK(clk),
    .D(_0020_),
    .RESET_B(_0112_),
    .Q(\u_vga_controller.H_count[11] ));
 sky130_fd_sc_hd__dfrtp_2 _0916_ (.CLK(clk),
    .D(_0021_),
    .RESET_B(_0113_),
    .Q(\u_vga_controller.H_count[12] ));
 sky130_fd_sc_hd__dfrtp_2 _0917_ (.CLK(clk),
    .D(_0022_),
    .RESET_B(_0114_),
    .Q(\u_vga_controller.H_count[13] ));
 sky130_fd_sc_hd__dfrtp_2 _0918_ (.CLK(clk),
    .D(_0023_),
    .RESET_B(_0115_),
    .Q(\u_vga_controller.H_count[14] ));
 sky130_fd_sc_hd__dfrtp_2 _0919_ (.CLK(clk),
    .D(_0024_),
    .RESET_B(_0116_),
    .Q(\u_vga_controller.H_count[15] ));
 sky130_fd_sc_hd__dfstp_2 _0920_ (.CLK(clk),
    .D(\u_vga_controller.raw_hsync ),
    .SET_B(_0117_),
    .Q(net2));
 sky130_fd_sc_hd__dfstp_2 _0921_ (.CLK(clk),
    .D(\u_vga_controller.raw_vsync ),
    .SET_B(_0118_),
    .Q(net3));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout35 (.A(_0390_),
    .X(net35));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout41 (.A(net43),
    .X(net41));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout43 (.A(net44),
    .X(net43));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout44 (.A(net63),
    .X(net44));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout46 (.A(net51),
    .X(net46));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout48 (.A(net51),
    .X(net48));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout50 (.A(net51),
    .X(net50));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout51 (.A(net63),
    .X(net51));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout52 (.A(net57),
    .X(net52));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout54 (.A(net56),
    .X(net54));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout56 (.A(net63),
    .X(net56));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout58 (.A(net62),
    .X(net58));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout60 (.A(net62),
    .X(net60));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout62 (.A(net63),
    .X(net62));
 sky130_fd_sc_hd__clkdlybuf4s25_1 fanout63 (.A(net1),
    .X(net63));
 sky130_fd_sc_hd__clkdlybuf4s25_1 input1 (.A(reset),
    .X(net1));
 sky130_fd_sc_hd__buf_4 load_slew42 (.A(net41),
    .X(net42));
 sky130_fd_sc_hd__buf_4 load_slew45 (.A(net44),
    .X(net45));
 sky130_fd_sc_hd__buf_2 load_slew47 (.A(net46),
    .X(net47));
 sky130_fd_sc_hd__clkbuf_4 load_slew49 (.A(net48),
    .X(net49));
 sky130_fd_sc_hd__buf_4 load_slew53 (.A(net52),
    .X(net53));
 sky130_fd_sc_hd__clkbuf_4 load_slew55 (.A(net54),
    .X(net55));
 sky130_fd_sc_hd__clkbuf_4 load_slew57 (.A(net56),
    .X(net57));
 sky130_fd_sc_hd__buf_4 load_slew59 (.A(net58),
    .X(net59));
 sky130_fd_sc_hd__buf_4 load_slew61 (.A(net60),
    .X(net61));
 sky130_fd_sc_hd__clkdlybuf4s25_1 max_cap36 (.A(net37),
    .X(net36));
 sky130_fd_sc_hd__buf_1 max_cap37 (.A(_0375_),
    .X(net37));
 sky130_fd_sc_hd__clkbuf_2 max_cap38 (.A(net39),
    .X(net38));
 sky130_fd_sc_hd__clkbuf_2 max_cap40 (.A(_0236_),
    .X(net40));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output10 (.A(net10),
    .X(pcRegister[15]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output11 (.A(net11),
    .X(pcRegister[16]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output12 (.A(net12),
    .X(pcRegister[17]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output13 (.A(net13),
    .X(pcRegister[18]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output14 (.A(net14),
    .X(pcRegister[19]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output15 (.A(net15),
    .X(pcRegister[20]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output16 (.A(net16),
    .X(pcRegister[21]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output17 (.A(net17),
    .X(pcRegister[22]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output18 (.A(net18),
    .X(pcRegister[23]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output19 (.A(net19),
    .X(pcRegister[24]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output2 (.A(net2),
    .X(Hsync));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output20 (.A(net20),
    .X(pcRegister[25]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output21 (.A(net21),
    .X(pcRegister[26]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output22 (.A(net22),
    .X(pcRegister[27]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output23 (.A(net23),
    .X(pcRegister[28]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output24 (.A(net24),
    .X(pcRegister[29]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output25 (.A(net25),
    .X(pcRegister[2]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output26 (.A(net26),
    .X(pcRegister[30]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output27 (.A(net27),
    .X(pcRegister[31]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output28 (.A(net28),
    .X(pcRegister[3]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output29 (.A(net29),
    .X(pcRegister[4]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output3 (.A(net3),
    .X(Vsync));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output30 (.A(net30),
    .X(pcRegister[5]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output31 (.A(net31),
    .X(pcRegister[6]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output32 (.A(net32),
    .X(pcRegister[7]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output33 (.A(net33),
    .X(pcRegister[8]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output34 (.A(net34),
    .X(pcRegister[9]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output4 (.A(net4),
    .X(cpu_stall));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output5 (.A(net5),
    .X(pcRegister[10]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output6 (.A(net6),
    .X(pcRegister[11]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output7 (.A(net7),
    .X(pcRegister[12]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output8 (.A(net8),
    .X(pcRegister[13]));
 sky130_fd_sc_hd__clkdlybuf4s25_1 output9 (.A(net9),
    .X(pcRegister[14]));
 sky130_fd_sc_hd__conb_1 soc_top (.LO(net));
 sky130_fd_sc_hd__conb_1 soc_top_100 (.LO(net100));
 sky130_fd_sc_hd__conb_1 soc_top_101 (.LO(net101));
 sky130_fd_sc_hd__conb_1 soc_top_102 (.LO(net102));
 sky130_fd_sc_hd__conb_1 soc_top_103 (.LO(net103));
 sky130_fd_sc_hd__conb_1 soc_top_104 (.LO(net104));
 sky130_fd_sc_hd__conb_1 soc_top_105 (.LO(net105));
 sky130_fd_sc_hd__conb_1 soc_top_106 (.LO(net106));
 sky130_fd_sc_hd__conb_1 soc_top_107 (.LO(net107));
 sky130_fd_sc_hd__conb_1 soc_top_108 (.LO(net108));
 sky130_fd_sc_hd__conb_1 soc_top_109 (.LO(net109));
 sky130_fd_sc_hd__conb_1 soc_top_110 (.LO(net110));
 sky130_fd_sc_hd__conb_1 soc_top_111 (.LO(net111));
 sky130_fd_sc_hd__conb_1 soc_top_112 (.LO(net112));
 sky130_fd_sc_hd__conb_1 soc_top_113 (.LO(net113));
 sky130_fd_sc_hd__conb_1 soc_top_114 (.LO(net114));
 sky130_fd_sc_hd__conb_1 soc_top_115 (.LO(net115));
 sky130_fd_sc_hd__conb_1 soc_top_116 (.LO(net116));
 sky130_fd_sc_hd__conb_1 soc_top_117 (.LO(net117));
 sky130_fd_sc_hd__conb_1 soc_top_118 (.LO(net118));
 sky130_fd_sc_hd__conb_1 soc_top_119 (.LO(net119));
 sky130_fd_sc_hd__conb_1 soc_top_120 (.LO(net120));
 sky130_fd_sc_hd__conb_1 soc_top_121 (.LO(net121));
 sky130_fd_sc_hd__conb_1 soc_top_122 (.LO(net122));
 sky130_fd_sc_hd__conb_1 soc_top_123 (.LO(net123));
 sky130_fd_sc_hd__conb_1 soc_top_124 (.LO(net124));
 sky130_fd_sc_hd__conb_1 soc_top_125 (.LO(net125));
 sky130_fd_sc_hd__conb_1 soc_top_126 (.LO(net126));
 sky130_fd_sc_hd__conb_1 soc_top_127 (.LO(net127));
 sky130_fd_sc_hd__conb_1 soc_top_128 (.LO(net128));
 sky130_fd_sc_hd__conb_1 soc_top_129 (.LO(net129));
 sky130_fd_sc_hd__conb_1 soc_top_130 (.LO(net130));
 sky130_fd_sc_hd__conb_1 soc_top_131 (.LO(net131));
 sky130_fd_sc_hd__conb_1 soc_top_132 (.LO(net132));
 sky130_fd_sc_hd__conb_1 soc_top_133 (.LO(net133));
 sky130_fd_sc_hd__conb_1 soc_top_134 (.LO(net134));
 sky130_fd_sc_hd__conb_1 soc_top_135 (.LO(net135));
 sky130_fd_sc_hd__conb_1 soc_top_136 (.LO(net136));
 sky130_fd_sc_hd__conb_1 soc_top_137 (.LO(net137));
 sky130_fd_sc_hd__conb_1 soc_top_138 (.LO(net138));
 sky130_fd_sc_hd__conb_1 soc_top_139 (.LO(net139));
 sky130_fd_sc_hd__conb_1 soc_top_140 (.LO(net140));
 sky130_fd_sc_hd__conb_1 soc_top_141 (.LO(net141));
 sky130_fd_sc_hd__conb_1 soc_top_142 (.LO(net142));
 sky130_fd_sc_hd__conb_1 soc_top_143 (.LO(net143));
 sky130_fd_sc_hd__conb_1 soc_top_144 (.LO(net144));
 sky130_fd_sc_hd__conb_1 soc_top_145 (.LO(net145));
 sky130_fd_sc_hd__conb_1 soc_top_146 (.LO(net146));
 sky130_fd_sc_hd__conb_1 soc_top_147 (.LO(net147));
 sky130_fd_sc_hd__conb_1 soc_top_148 (.LO(net148));
 sky130_fd_sc_hd__conb_1 soc_top_149 (.LO(net149));
 sky130_fd_sc_hd__conb_1 soc_top_150 (.LO(net150));
 sky130_fd_sc_hd__conb_1 soc_top_151 (.LO(net151));
 sky130_fd_sc_hd__conb_1 soc_top_152 (.LO(net152));
 sky130_fd_sc_hd__conb_1 soc_top_153 (.LO(net153));
 sky130_fd_sc_hd__conb_1 soc_top_154 (.LO(net154));
 sky130_fd_sc_hd__conb_1 soc_top_155 (.LO(net155));
 sky130_fd_sc_hd__conb_1 soc_top_64 (.LO(net64));
 sky130_fd_sc_hd__conb_1 soc_top_65 (.LO(net65));
 sky130_fd_sc_hd__conb_1 soc_top_66 (.LO(net66));
 sky130_fd_sc_hd__conb_1 soc_top_67 (.LO(net67));
 sky130_fd_sc_hd__conb_1 soc_top_68 (.LO(net68));
 sky130_fd_sc_hd__conb_1 soc_top_69 (.LO(net69));
 sky130_fd_sc_hd__conb_1 soc_top_70 (.LO(net70));
 sky130_fd_sc_hd__conb_1 soc_top_71 (.LO(net71));
 sky130_fd_sc_hd__conb_1 soc_top_72 (.LO(net72));
 sky130_fd_sc_hd__conb_1 soc_top_73 (.LO(net73));
 sky130_fd_sc_hd__conb_1 soc_top_74 (.LO(net74));
 sky130_fd_sc_hd__conb_1 soc_top_75 (.LO(net75));
 sky130_fd_sc_hd__conb_1 soc_top_76 (.LO(net76));
 sky130_fd_sc_hd__conb_1 soc_top_77 (.LO(net77));
 sky130_fd_sc_hd__conb_1 soc_top_78 (.LO(net78));
 sky130_fd_sc_hd__conb_1 soc_top_79 (.LO(net79));
 sky130_fd_sc_hd__conb_1 soc_top_80 (.LO(net80));
 sky130_fd_sc_hd__conb_1 soc_top_81 (.LO(net81));
 sky130_fd_sc_hd__conb_1 soc_top_82 (.LO(net82));
 sky130_fd_sc_hd__conb_1 soc_top_83 (.LO(net83));
 sky130_fd_sc_hd__conb_1 soc_top_84 (.LO(net84));
 sky130_fd_sc_hd__conb_1 soc_top_85 (.LO(net85));
 sky130_fd_sc_hd__conb_1 soc_top_86 (.LO(net86));
 sky130_fd_sc_hd__conb_1 soc_top_87 (.LO(net87));
 sky130_fd_sc_hd__conb_1 soc_top_88 (.LO(net88));
 sky130_fd_sc_hd__conb_1 soc_top_89 (.LO(net89));
 sky130_fd_sc_hd__conb_1 soc_top_90 (.LO(net90));
 sky130_fd_sc_hd__conb_1 soc_top_91 (.LO(net91));
 sky130_fd_sc_hd__conb_1 soc_top_92 (.LO(net92));
 sky130_fd_sc_hd__conb_1 soc_top_93 (.LO(net93));
 sky130_fd_sc_hd__conb_1 soc_top_94 (.LO(net94));
 sky130_fd_sc_hd__conb_1 soc_top_95 (.LO(net95));
 sky130_fd_sc_hd__conb_1 soc_top_96 (.LO(net96));
 sky130_fd_sc_hd__conb_1 soc_top_97 (.LO(net97));
 sky130_fd_sc_hd__conb_1 soc_top_98 (.LO(net98));
 sky130_fd_sc_hd__conb_1 soc_top_99 (.LO(net99));
 sky130_fd_sc_hd__clkbuf_2 wire39 (.A(_0236_),
    .X(net39));
 assign blue[0] = net;
 assign blue[1] = net64;
 assign blue[2] = net65;
 assign blue[3] = net66;
 assign blue[4] = net67;
 assign blue[5] = net68;
 assign blue[6] = net69;
 assign blue[7] = net70;
 assign display_enable = net71;
 assign green[0] = net72;
 assign green[1] = net73;
 assign green[2] = net74;
 assign green[3] = net75;
 assign green[4] = net76;
 assign green[5] = net77;
 assign green[6] = net78;
 assign green[7] = net79;
 assign mem_addr[0] = net80;
 assign mem_addr[10] = net90;
 assign mem_addr[11] = net91;
 assign mem_addr[12] = net92;
 assign mem_addr[13] = net93;
 assign mem_addr[14] = net94;
 assign mem_addr[15] = net95;
 assign mem_addr[16] = net96;
 assign mem_addr[17] = net97;
 assign mem_addr[18] = net98;
 assign mem_addr[19] = net99;
 assign mem_addr[1] = net81;
 assign mem_addr[20] = net100;
 assign mem_addr[21] = net101;
 assign mem_addr[22] = net102;
 assign mem_addr[23] = net103;
 assign mem_addr[24] = net104;
 assign mem_addr[25] = net105;
 assign mem_addr[26] = net106;
 assign mem_addr[27] = net107;
 assign mem_addr[28] = net108;
 assign mem_addr[29] = net109;
 assign mem_addr[2] = net82;
 assign mem_addr[30] = net110;
 assign mem_addr[31] = net111;
 assign mem_addr[3] = net83;
 assign mem_addr[4] = net84;
 assign mem_addr[5] = net85;
 assign mem_addr[6] = net86;
 assign mem_addr[7] = net87;
 assign mem_addr[8] = net88;
 assign mem_addr[9] = net89;
 assign mem_read = net112;
 assign mem_wdata[0] = net113;
 assign mem_wdata[10] = net123;
 assign mem_wdata[11] = net124;
 assign mem_wdata[12] = net125;
 assign mem_wdata[13] = net126;
 assign mem_wdata[14] = net127;
 assign mem_wdata[15] = net128;
 assign mem_wdata[16] = net129;
 assign mem_wdata[17] = net130;
 assign mem_wdata[18] = net131;
 assign mem_wdata[19] = net132;
 assign mem_wdata[1] = net114;
 assign mem_wdata[20] = net133;
 assign mem_wdata[21] = net134;
 assign mem_wdata[22] = net135;
 assign mem_wdata[23] = net136;
 assign mem_wdata[24] = net137;
 assign mem_wdata[25] = net138;
 assign mem_wdata[26] = net139;
 assign mem_wdata[27] = net140;
 assign mem_wdata[28] = net141;
 assign mem_wdata[29] = net142;
 assign mem_wdata[2] = net115;
 assign mem_wdata[30] = net143;
 assign mem_wdata[31] = net144;
 assign mem_wdata[3] = net116;
 assign mem_wdata[4] = net117;
 assign mem_wdata[5] = net118;
 assign mem_wdata[6] = net119;
 assign mem_wdata[7] = net120;
 assign mem_wdata[8] = net121;
 assign mem_wdata[9] = net122;
 assign mem_write = net145;
 assign pcRegister[0] = net146;
 assign pcRegister[1] = net147;
 assign red[0] = net148;
 assign red[1] = net149;
 assign red[2] = net150;
 assign red[3] = net151;
 assign red[4] = net152;
 assign red[5] = net153;
 assign red[6] = net154;
 assign red[7] = net155;
endmodule
