----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 08:27:36 PM
-- Design Name: 
-- Module Name: vga_ctrl_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_ctrl_tb is
--  Port ( );
end vga_ctrl_tb;

architecture Behavioral of vga_ctrl_tb is

    signal clk_tb : std_logic;
    signal hs_tb : std_logic;  
    signal vs_tb : std_logic;
    signal vid_tb : std_logic;
    signal en_tb : std_logic := '1';
    signal hcount_tb : std_logic_vector (9 downto 0);
    signal vcount_tb : std_logic_vector (9 downto 0);

    
  
component vga_ctrl is
port(
clk,en : in std_logic;
hcount,vcount :out std_logic_vector(9 downto 0);
vid,hs,vs : out std_logic 
 );
 end component;
 
begin

clk_process : process
begin
    wait for 4 ns;
    clk_tb <= '1';
    wait for 4 ns;
    clk_tb <= '0';
    end process clk_process;
    
 
dut : vga_ctrl
port map(
clk => clk_tb,
hs => hs_tb,
vs => vs_tb,
vid => vid_tb,
en => en_tb,
hcount => hcount_tb,
vcount => vcount_tb
);

end Behavioral;