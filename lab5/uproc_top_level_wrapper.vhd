--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
--Date        : Fri Apr 19 13:58:18 2024
--Host        : ece58 running 64-bit Ubuntu 20.04.2 LTS
--Command     : generate_target uproc_top_level_wrapper.bd
--Design      : uproc_top_level_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uproc_top_level_wrapper is
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
end uproc_top_level_wrapper;

architecture STRUCTURE of uproc_top_level_wrapper is
  component uproc_top_level is
  port (
    TXD : in STD_LOGIC;
    clk : in STD_LOGIC;
    btn_0 : in STD_LOGIC;
    RXD : out STD_LOGIC;
    vga_r : out STD_LOGIC_VECTOR ( 4 downto 0 );
    vga_b : out STD_LOGIC_VECTOR ( 4 downto 0 );
    vga_g : out STD_LOGIC_VECTOR ( 5 downto 0 );
    vga_hs : out STD_LOGIC;
    vga_vs : out STD_LOGIC;
    CTS : out STD_LOGIC;
    RTS : out STD_LOGIC
  );
  end component uproc_top_level;
begin
uproc_top_level_i: component uproc_top_level
     port map (
      CTS => CTS,
      RTS => RTS,
      RXD => RXD,
      TXD => TXD,
      btn_0 => btn_0,
      clk => clk,
      vga_b(4 downto 0) => vga_b(4 downto 0),
      vga_g(5 downto 0) => vga_g(5 downto 0),
      vga_hs => vga_hs,
      vga_r(4 downto 0) => vga_r(4 downto 0),
      vga_vs => vga_vs
    );
end STRUCTURE;
