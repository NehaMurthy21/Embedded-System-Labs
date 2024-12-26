----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2024 10:11:08 PM
-- Design Name: 
-- Module Name: adder - Behavioral
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

-- declaring variables/ports
entity adder is
port(
A : in std_logic;
B : in std_logic;
Cin : in std_logic;
S : out std_logic;
Cout : out std_logic
);
end adder;

architecture Behavioral of adder is

  --based on the diagram concurrent (write logic equations)
begin
S <=((A Xor B) XOR (Cin));
Cout <= (Cin AND (A XOR B)) OR (B And A);

end Behavioral;