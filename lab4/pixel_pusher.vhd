----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2024 10:42:16 AM
-- Design Name: 
-- Module Name: pixel_pusher - Behavioral
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

entity pixel_pusher is
 Port ( 
 clk , en : in std_logic;
 vs, vid : in std_logic;
 pixel : in std_logic_vector (7 downto 0);
 hcount : in std_logic_vector (9 downto 0);
 r_signal : out std_logic_vector (4 downto 0);
 b_signal : out std_logic_vector (4 downto 0);
 g_signal : out std_logic_vector (5 downto 0);
 addr : out std_logic_vector (17 downto 0)
 );
end pixel_pusher;

architecture Behavioral of pixel_pusher is

signal addr_counter : std_logic_vector (17 downto 0) := (others => '0');

begin

process(clk)
begin
    if (rising_edge (clk)) then
    
        if( (en = '1') and (vid='1') and (unsigned(hcount)<480)) then
            r_signal <= pixel (7 downto 5) & "00";
            g_signal <= pixel (4 downto 2) & "000";
            b_signal <= pixel (1 downto 0) & "000";
            addr_counter <= std_logic_vector(unsigned (addr_counter) +1) ;
         else
            r_signal <= (others => '0');
            g_signal <= (others => '0');
            b_signal <= (others => '0');


            
         end if;
         
        if (vs='0') then
             addr_counter <= (others => '0');
        end if;

    
   end if;
      

end process;

addr <= addr_counter;

end Behavioral;