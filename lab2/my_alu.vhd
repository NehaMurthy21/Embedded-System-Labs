----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2024 11:02:55 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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
use IEEE. numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- declaring variables/ports
entity my_alu is

port(
    A,B,opcode : in std_logic_vector (3 downto 0);
    S : out std_logic_vector (3 downto 0)
);
end my_alu;

architecture Behavioral of my_alu is

begin

    -- look at the changing opcode to determine which case to do
process (opcode) -- opcode is a machine instruction that is specified to perform a certain operation
begin
    --different cases of the opcode
case (opcode) is

    when "0000" => S <= std_logic_vector((unsigned (A) + unsigned (B)));   --A+B
    when "0001" => S <= std_logic_vector ((unsigned (A) - unsigned (B)));  --A-B
    when "0010" => S <= std_logic_vector ((unsigned (A) + "0001"));        --A+1
    when "0011" => S <= std_logic_vector ((unsigned (A) - "0001"));        --A-1
    when "0100" => S <= std_logic_vector (("0000" - unsigned (A)));        --0-A
    when "0101" =>
         if A > B then                                                     --A>B => 1
             S <= "0001";
         else
             S <= "0000";                                                  --A<B => 0
        end if;    
    when "0110" => S <= std_logic_vector(shift_left(unsigned(A),1));       --shift left by 1  -- used function shift_left with vecotors
    when "0111" => S <= std_logic_vector(shift_right(unsigned(A),1));      -- shift right by 1 (unsigned)  -- used function shift_right with vectors
    when "1000" => S <= std_logic_vector (shift_right (signed (A), 1));    -- shift right by 1 (arithmetic/signed)  -- used function shift_right but with signed vectors
    when "1001" => S <= Not A;                                             --  When 9 => Not A (Invert all bits)
    when "1010" => S <= (A AND B);                                         -- When 10 => (A AND B) (line them up verticaly)
    when "1011" => S <= (A OR B);                                          -- When 11 => (A OR B)
    when "1100" => S <= (A XOR B);                                         -- When 12 => (A XOR B) (False when the two inputs are the same)
    when "1101" => S <= (A XNOR B);                                        -- When 13 => (A XNOR B) (Negation of XOR)
    when "1110" => S <= (A NAND B);                                        -- When 14 => (A NAND B) (Negation of AND)
    when "1111" => S <= (A NOR B);                                         -- When 15 => (A NOR B) (Negation of OR)
    when others => S <="0000";                                             -- If the opcode is anything other, assign to 0 (nothing)
    
    end case;
 end process;



end Behavioral;