--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
--Date        : Fri Apr 19 13:58:18 2024
--Host        : ece58 running 64-bit Ubuntu 20.04.2 LTS
--Command     : generate_target uproc_top_level.bd
--Design      : uproc_top_level
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uproc_top_level is
  port (
    CTS : out STD_LOGIC;
    RTS : out STD_LOGIC;
    RXD : out STD_LOGIC;
    TXD : in STD_LOGIC;
    btn_0 : in STD_LOGIC;
    clk : in STD_LOGIC;
    vga_b : out STD_LOGIC_VECTOR ( 4 downto 0 );
    vga_g : out STD_LOGIC_VECTOR ( 5 downto 0 );
    vga_hs : out STD_LOGIC;
    vga_r : out STD_LOGIC_VECTOR ( 4 downto 0 );
    vga_vs : out STD_LOGIC
  );
  attribute core_generation_info : string;
  attribute core_generation_info of uproc_top_level : entity is "uproc_top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=uproc_top_level,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=10,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute hw_handoff : string;
  attribute hw_handoff of uproc_top_level : entity is "uproc_top_level.hwdef";
end uproc_top_level;

architecture STRUCTURE of uproc_top_level is
  component uproc_top_level_clock_div_115200MHz_0_0 is
  port (
    clk : in STD_LOGIC;
    clk_div : out STD_LOGIC
  );
  end component uproc_top_level_clock_div_115200MHz_0_0;
  component uproc_top_level_clock_div_25MHz_0_0 is
  port (
    clk : in STD_LOGIC;
    clk_div : out STD_LOGIC
  );
  end component uproc_top_level_clock_div_25MHz_0_0;
  component uproc_top_level_debounce_0_0 is
  port (
    clk : in STD_LOGIC;
    btn : in STD_LOGIC;
    dbnc : out STD_LOGIC
  );
  end component uproc_top_level_debounce_0_0;
  component uproc_top_level_my_alu_0_0 is
  port (
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    opcode : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component uproc_top_level_my_alu_0_0;
  component uproc_top_level_regs_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    rst : in STD_LOGIC;
    id1 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    id2 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    wr_en1 : in STD_LOGIC;
    wr_en2 : in STD_LOGIC;
    din1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    din2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dout2 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component uproc_top_level_regs_0_0;
  component uproc_top_level_vga_ctrl_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    hcount : out STD_LOGIC_VECTOR ( 9 downto 0 );
    vcount : out STD_LOGIC_VECTOR ( 9 downto 0 );
    vid : out STD_LOGIC;
    hs : out STD_LOGIC;
    vs : out STD_LOGIC
  );
  end component uproc_top_level_vga_ctrl_0_0;
  component uproc_top_level_uart_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    send : in STD_LOGIC;
    rx : in STD_LOGIC;
    rst : in STD_LOGIC;
    charSend : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ready : out STD_LOGIC;
    tx : out STD_LOGIC;
    newChar : out STD_LOGIC;
    charRec : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component uproc_top_level_uart_0_0;
  component uproc_top_level_pixel_pusher_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    vs : in STD_LOGIC;
    vid : in STD_LOGIC;
    hcount : in STD_LOGIC_VECTOR ( 9 downto 0 );
    pixel : in STD_LOGIC_VECTOR ( 15 downto 0 );
    R : out STD_LOGIC_VECTOR ( 4 downto 0 );
    B : out STD_LOGIC_VECTOR ( 4 downto 0 );
    G : out STD_LOGIC_VECTOR ( 5 downto 0 );
    addr : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component uproc_top_level_pixel_pusher_0_0;
  component uproc_top_level_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 13 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component uproc_top_level_blk_mem_gen_0_0;
  component uproc_top_level_blk_mem_gen_0_1 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 14 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component uproc_top_level_blk_mem_gen_0_1;
  component uproc_top_level_framebuffer_0_0 is
  port (
    clk1 : in STD_LOGIC;
    en1 : in STD_LOGIC;
    en2 : in STD_LOGIC;
    ld : in STD_LOGIC;
    addr1 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    addr2 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    wr_en1 : in STD_LOGIC;
    din1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dout2 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component uproc_top_level_framebuffer_0_0;
  component uproc_top_level_controls_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    rst : in STD_LOGIC;
    rID1 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rID2 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    wr_enR1 : out STD_LOGIC;
    wr_enR2 : out STD_LOGIC;
    regrD1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    regrD2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    regwD1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    regwD2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    fbRST : out STD_LOGIC;
    fbAddr1 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    fbDin1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fbDout1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    wr_en : out STD_LOGIC;
    irAddr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    irWord : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dAddr : out STD_LOGIC_VECTOR ( 14 downto 0 );
    d_wr_en : out STD_LOGIC;
    dOut : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dIn : in STD_LOGIC_VECTOR ( 15 downto 0 );
    aluA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aluB : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aluOp : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aluResult : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ready : in STD_LOGIC;
    newChar : in STD_LOGIC;
    sendUART : out STD_LOGIC;
    charRec : in STD_LOGIC_VECTOR ( 7 downto 0 );
    charSend : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component uproc_top_level_controls_0_0;
  signal TXD_1 : STD_LOGIC;
  signal btn_0_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal clock_div_115200MHz_0_clk_div : STD_LOGIC;
  signal clock_div_25MHz_0_clk_div : STD_LOGIC;
  signal controls_0_aluA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal controls_0_aluB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal controls_0_aluOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal controls_0_charSend : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal controls_0_dAddr : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal controls_0_dOut : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal controls_0_d_wr_en : STD_LOGIC;
  signal controls_0_fbAddr1 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal controls_0_fbDout1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal controls_0_fbRST : STD_LOGIC;
  signal controls_0_irAddr : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal controls_0_rID1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal controls_0_rID2 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal controls_0_regwD1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal controls_0_regwD2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal controls_0_sendUART : STD_LOGIC;
  signal controls_0_wr_enR1 : STD_LOGIC;
  signal controls_0_wr_enR2 : STD_LOGIC;
  signal dMem_douta : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal debounce_0_dbnc : STD_LOGIC;
  signal framebuffer_0_dout1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal framebuffer_0_dout2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal irMem_douta : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal my_alu_0_S : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal pixel_pusher_0_B : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal pixel_pusher_0_G : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal pixel_pusher_0_R : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal pixel_pusher_0_addr : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal regs_0_dout1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal regs_0_dout2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal uart_0_charRec : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal uart_0_newChar : STD_LOGIC;
  signal uart_0_ready : STD_LOGIC;
  signal uart_0_tx : STD_LOGIC;
  signal vga_ctrl_0_hs : STD_LOGIC;
  signal vga_ctrl_0_vid : STD_LOGIC;
  signal vga_ctrl_0_vs : STD_LOGIC;
  signal NLW_controls_0_wr_en_UNCONNECTED : STD_LOGIC;
  signal NLW_framebuffer_0_wr_en1_UNCONNECTED : STD_LOGIC;
  signal NLW_vga_ctrl_0_hcount_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_vga_ctrl_0_vcount_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
begin
  RXD <= uart_0_tx;
  TXD_1 <= TXD;
  btn_0_1 <= btn_0;
  clk_1 <= clk;
  vga_b(4 downto 0) <= pixel_pusher_0_B(4 downto 0);
  vga_g(5 downto 0) <= pixel_pusher_0_G(5 downto 0);
  vga_hs <= vga_ctrl_0_hs;
  vga_r(4 downto 0) <= pixel_pusher_0_R(4 downto 0);
  vga_vs <= vga_ctrl_0_vs;
  CTS <= 'Z';
  RTS <= 'Z';
clock_div_115200MHz_0: component uproc_top_level_clock_div_115200MHz_0_0
     port map (
      clk => clk_1,
      clk_div => clock_div_115200MHz_0_clk_div
    );
clock_div_25MHz_0: component uproc_top_level_clock_div_25MHz_0_0
     port map (
      clk => clk_1,
      clk_div => clock_div_25MHz_0_clk_div
    );
controls_0: component uproc_top_level_controls_0_0
     port map (
      aluA(15 downto 0) => controls_0_aluA(15 downto 0),
      aluB(15 downto 0) => controls_0_aluB(15 downto 0),
      aluOp(3 downto 0) => controls_0_aluOp(3 downto 0),
      aluResult(15 downto 0) => my_alu_0_S(15 downto 0),
      charRec(7 downto 0) => uart_0_charRec(7 downto 0),
      charSend(7 downto 0) => controls_0_charSend(7 downto 0),
      clk => clk_1,
      dAddr(14 downto 0) => controls_0_dAddr(14 downto 0),
      dIn(15 downto 0) => dMem_douta(15 downto 0),
      dOut(15 downto 0) => controls_0_dOut(15 downto 0),
      d_wr_en => controls_0_d_wr_en,
      en => clock_div_115200MHz_0_clk_div,
      fbAddr1(11 downto 0) => controls_0_fbAddr1(11 downto 0),
      fbDin1(15 downto 0) => framebuffer_0_dout1(15 downto 0),
      fbDout1(15 downto 0) => controls_0_fbDout1(15 downto 0),
      fbRST => controls_0_fbRST,
      irAddr(13 downto 0) => controls_0_irAddr(13 downto 0),
      irWord(31 downto 0) => irMem_douta(31 downto 0),
      newChar => uart_0_newChar,
      rID1(4 downto 0) => controls_0_rID1(4 downto 0),
      rID2(4 downto 0) => controls_0_rID2(4 downto 0),
      ready => uart_0_ready,
      regrD1(15 downto 0) => regs_0_dout1(15 downto 0),
      regrD2(15 downto 0) => regs_0_dout2(15 downto 0),
      regwD1(15 downto 0) => controls_0_regwD1(15 downto 0),
      regwD2(15 downto 0) => controls_0_regwD2(15 downto 0),
      rst => debounce_0_dbnc,
      sendUART => controls_0_sendUART,
      wr_en => NLW_controls_0_wr_en_UNCONNECTED,
      wr_enR1 => controls_0_wr_enR1,
      wr_enR2 => controls_0_wr_enR2
    );
dMem: component uproc_top_level_blk_mem_gen_0_1
     port map (
      addra(14 downto 0) => controls_0_dAddr(14 downto 0),
      clka => clk_1,
      dina(15 downto 0) => controls_0_dOut(15 downto 0),
      douta(15 downto 0) => dMem_douta(15 downto 0),
      ena => '0',
      wea(0) => controls_0_d_wr_en
    );
debounce_0: component uproc_top_level_debounce_0_0
     port map (
      btn => btn_0_1,
      clk => clk_1,
      dbnc => debounce_0_dbnc
    );
framebuffer_0: component uproc_top_level_framebuffer_0_0
     port map (
      addr1(11 downto 0) => controls_0_fbAddr1(11 downto 0),
      addr2(11 downto 0) => pixel_pusher_0_addr(11 downto 0),
      clk1 => clk_1,
      din1(15 downto 0) => controls_0_fbDout1(15 downto 0),
      dout1(15 downto 0) => framebuffer_0_dout1(15 downto 0),
      dout2(15 downto 0) => framebuffer_0_dout2(15 downto 0),
      en1 => clock_div_115200MHz_0_clk_div,
      en2 => clock_div_25MHz_0_clk_div,
      ld => controls_0_fbRST,
      wr_en1 => NLW_framebuffer_0_wr_en1_UNCONNECTED
    );
irMem: component uproc_top_level_blk_mem_gen_0_0
     port map (
      addra(13 downto 0) => controls_0_irAddr(13 downto 0),
      clka => clk_1,
      douta(31 downto 0) => irMem_douta(31 downto 0)
    );
my_alu_0: component uproc_top_level_my_alu_0_0
     port map (
      A(15 downto 0) => controls_0_aluA(15 downto 0),
      B(15 downto 0) => controls_0_aluB(15 downto 0),
      S(15 downto 0) => my_alu_0_S(15 downto 0),
      clk => clk_1,
      en => clock_div_115200MHz_0_clk_div,
      opcode(3 downto 0) => controls_0_aluOp(3 downto 0)
    );
pixel_pusher_0: component uproc_top_level_pixel_pusher_0_0
     port map (
      B(4 downto 0) => pixel_pusher_0_B(4 downto 0),
      G(5 downto 0) => pixel_pusher_0_G(5 downto 0),
      R(4 downto 0) => pixel_pusher_0_R(4 downto 0),
      addr(11 downto 0) => pixel_pusher_0_addr(11 downto 0),
      clk => clk_1,
      en => clock_div_25MHz_0_clk_div,
      hcount(9 downto 0) => B"0000000000",
      pixel(15 downto 0) => framebuffer_0_dout2(15 downto 0),
      vid => vga_ctrl_0_vid,
      vs => vga_ctrl_0_vs
    );
regs_0: component uproc_top_level_regs_0_0
     port map (
      clk => clk_1,
      din1(15 downto 0) => controls_0_regwD1(15 downto 0),
      din2(15 downto 0) => controls_0_regwD2(15 downto 0),
      dout1(15 downto 0) => regs_0_dout1(15 downto 0),
      dout2(15 downto 0) => regs_0_dout2(15 downto 0),
      en => clock_div_115200MHz_0_clk_div,
      id1(4 downto 0) => controls_0_rID1(4 downto 0),
      id2(4 downto 0) => controls_0_rID2(4 downto 0),
      rst => debounce_0_dbnc,
      wr_en1 => controls_0_wr_enR1,
      wr_en2 => controls_0_wr_enR2
    );
uart_0: component uproc_top_level_uart_0_0
     port map (
      charRec(7 downto 0) => uart_0_charRec(7 downto 0),
      charSend(7 downto 0) => controls_0_charSend(7 downto 0),
      clk => clk_1,
      en => clock_div_115200MHz_0_clk_div,
      newChar => uart_0_newChar,
      ready => uart_0_ready,
      rst => debounce_0_dbnc,
      rx => TXD_1,
      send => controls_0_sendUART,
      tx => uart_0_tx
    );
vga_ctrl_0: component uproc_top_level_vga_ctrl_0_0
     port map (
      clk => clk_1,
      en => clock_div_25MHz_0_clk_div,
      hcount(9 downto 0) => NLW_vga_ctrl_0_hcount_UNCONNECTED(9 downto 0),
      hs => vga_ctrl_0_hs,
      vcount(9 downto 0) => NLW_vga_ctrl_0_vcount_UNCONNECTED(9 downto 0),
      vid => vga_ctrl_0_vid,
      vs => vga_ctrl_0_vs
    );
end STRUCTURE;
