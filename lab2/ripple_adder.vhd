----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2024 10:36:27 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

-- declare variable/ port 
--structural
entity ripple_adder is
port (
A,B : in std_logic_vector (3 downto 0);
Cin : in std_logic;
S : out std_logic_vector (3 downto 0);
Cout : out std_logic
);
end ripple_adder;

architecture Behavioral of ripple_adder is
-- have a ripple_carry signal for the between states (vector) (See Pre-Lab diagram for understanding)
signal ripple_carry : std_logic_vector (2 downto 0);

-- load the adder component
component adder is
port(
A,B,Cin : in std_logic;
S,Cout : out std_logic
);
end component;

begin
-- this is just like the Pre Lab diagram I drew
  -- 4 ripple adder port map because 4 bits are being added
adder1 : adder
port map(
A => A(0),
B => B(0),
Cin => Cin, -- Cin goes into the first adder
S=> S(0),
Cout => ripple_carry (0)
);

adder2 : adder
port map(
A => A(1),
B => B(1),
Cin => ripple_carry (0),  -- the output from of the previous adder will be the cin here 
S=> S(1),
Cout => ripple_carry (1)  -- with get an output which will go into cin for the next one
);

adder3 : adder
port map(
A => A(2),
B => B(2),
Cin => ripple_carry (1),
S=> S(2),
Cout => ripple_carry (2)
);

adder4 : adder
port map(
A => A(3),
B => B(3),
Cin => ripple_carry (2),
S=> S(3),
Cout => Cout -- there are no more ripple_carry bit so the last output goes to Cout
);

end Behavioral;