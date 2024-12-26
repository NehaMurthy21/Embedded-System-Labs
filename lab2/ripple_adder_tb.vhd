----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2024 11:01:08 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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

entity ripple_adder_tb is
--  Port ( );
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is

signal clk_tb : std_logic := '0';
signal S_tb : std_logic_vector (3 downto 0);
signal A_tb,B_tb : std_logic_vector (3 downto 0) := "0101";
Signal c_out_tb : std_logic;
signal c_in_tb : std_logic := '0';

component ripple_adder is
port(
A,B : in std_logic_vector (3 downto 0);
Cin : in std_logic;
S : out std_logic_vector (3 downto 0);
Cout : out std_logic
);
end component;

begin

clock_process : process
begin
          -- 0111 + 0001 + 0000 =  S => 1000  Cout => 0
        wait for 4 ns;
        
        clk_tb <= '1';
        A_tb <= "0111";
        B_tb <= "0001";
        c_in_tb <= '0';
        
           -- 1111 + 0001 + 0000 =  S => 0000  Cout => 1

         wait for 4 ns;
        
        clk_tb <= '0';
        A_tb <= "1111";
        B_tb <= "0001";
        c_in_tb <= '0';
        
        
        --Example
        wait for 4 ns;
        
        clk_tb <= '1';
         A_tb <= "1011";
         B_tb <= "1111";
            c_in_tb <= '1';

end process clock_process;


  ripple_adder_port :ripple_adder
    port map (
        A  => A_tb,
        B=>B_tb,
        Cin => c_in_tb,
        S=>S_tb,
        Cout => c_out_tb);
end Behavioral;
