----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2024 03:59:31 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
--  Port ( );
port(
clk: in std_logic; -- need clk because rising edge
btn: in std_logic_vector (3 downto 0); -- 4 buttons to load the values
sw: in std_logic_vector (3 downto 0);  -- 4 switches to make the values
led : out std_logic_vector (3 downto 0)  -- 4 LEDs to show the values
);
end alu_tester;

architecture Behavioral of alu_tester is

signal A_btn, B_btn, Opcode_btn : std_logic_vector (3 downto 0) := "0000"; -- this is the button that will be pressed to load values
signal debounce_output : std_logic_vector (3 downto 0) := "0000";  -- finds out which debounced button is being pressed, based on which is being pressed, it will be assigned to the correct btn
signal output : std_logic_vector (3 downto 0); -- this is the end result that will be shown on the LED (SEE if this can be done without using this and output isn't defined anywhere)

component debouncer
port (
clk : in std_logic;
btn : in std_logic;
dbnc : out std_logic
);
end component;

component my_alu
port(
   A,B,opcode : in std_logic_vector (3 downto 0);
    S : out std_logic_vector (3 downto 0)
);
end component;

begin

process (clk)
begin

    if (rising_edge (clk)) then
        if (debounce_output (0) ='1') then  -- if button 0 is pressed (debouncing), then the switch value will be in B_btn
            B_btn <=sw;
        elsif (debounce_output(1)='1') then  -- if button 1, switch is A_btn
            A_btn <=sw;
         elsif (debounce_output (2) ='1') then  -- if button 2, switch is opcode_btn
            Opcode_btn <= sw;
         elsif (debounce_output (3) = '1') then  -- if button 3, switch is reset
            A_btn <= (others => '0');  -- A loaded values are 0
            B_btn <= (others => '0');  -- B loaded values are 0
            Opcode_btn <= (others => '0');  -- opcode values are 0
         end if;
         led<=output; --output will show on the LEDs  
    end if;
    
 end process;
 
 -- port mapping
 
 alu : my_alu
 port map (
 A=> A_btn,
 B=> B_btn,
 opcode => Opcode_btn,
 S => output
 );
 
 debounce0 : debouncer   -- this is the B_btn
 port map(
 clk => clk,
 btn => btn(0),
 dbnc => debounce_output(0)
 );
 
 debounce1 : debouncer   -- this is the A_btn
 port map (
 clk=>clk,
 btn => btn (1),
 dbnc => debounce_output (1)
 );
 
 debounce2 : debouncer   -- this the opcode_btn
 port map (
 clk => clk,
 btn => btn (2),
 dbnc => debounce_output(2)
 );

debounce3 : debouncer  -- this is the reset button
port map(
clk => clk,
btn => btn(3),
dbnc => debounce_output (3)
);
end Behavioral;