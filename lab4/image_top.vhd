----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2024 12:01:03 PM
-- Design Name: 
-- Module Name: image_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity image_top is
Port ( 
clk : in std_logic;
vga_hs : out std_logic;
vga_vs : out std_logic;
vga_r : out std_logic_vector (4 downto 0);
vga_b : out std_logic_vector (4 downto 0);
vga_g : out std_logic_vector (5 downto 0)
);
end image_top;

architecture Behavioral of image_top is
signal enable : std_logic;
signal vga_vs_temporary : std_logic;
signal vid : std_logic;
signal hcount : std_logic_vector (9 downto 0);
signal addr : std_logic_vector (17 downto 0);
signal douta : std_logic_vector (7 downto 0);

component picture is
port(
addra : in std_logic_vector (17 downto 0);
clka : in std_logic;
douta : out std_logic_vector (7 downto 0)
);
end component;

component pixel_pusher is
port(
clk , en : in std_logic;
 vs, vid : in std_logic;
 pixel : in std_logic_vector (7 downto 0);
 hcount : in std_logic_vector (9 downto 0);
 r_signal : out std_logic_vector (4 downto 0);
 b_signal : out std_logic_vector (4 downto 0);
 g_signal : out std_logic_vector (5 downto 0);
 addr : out std_logic_vector (17 downto 0)
);
end component;

component vga_ctrl is
port(
 clk,en : in std_logic;
    hcount,vcount :out std_logic_vector(9 downto 0);
    vid,hs,vs : out std_logic 
);
end component;

component clock_div is
port(
  clk : in std_logic;
    clk_div : out std_logic
);
end component;

begin

clk_div : clock_div port map
(
clk => clk,
clk_div=> enable
);

pixel_push : pixel_pusher port map(
clk=> clk,
en => enable,
vs => vga_vs_temporary,
vid=> vid,
pixel => douta,
hcount => hcount,
addr => addr,
r_signal => vga_r,
g_signal => vga_g,
b_signal => vga_b
);

pict: picture port map(
clka => enable,
addra => addr,
douta => douta
);

vga_control : vga_ctrl port map(
en => enable,
clk => clk,
hcount => hcount,
vid => vid,
hs=> vga_hs,
vs => vga_vs_temporary
);

vga_vs <= vga_vs_temporary;

end Behavioral;