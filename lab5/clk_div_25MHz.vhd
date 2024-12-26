
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div_25MHz is
port (
    clk : in std_logic;
    clk_div : out std_logic);
end clock_div_25MHz;

architecture behavior of clock_div_25MHz is

signal count : std_logic_vector(25 downto 0) := (others => '0'); --2^25 bits
--signal div : std_logic := '0';

begin

   process (clk)
    begin
        if rising_edge(clk) then
                count <= std_logic_vector(unsigned(count) + 1);  
                   if (unsigned (count)=4) then
                        clk_div <='1';
                        count <= (others => '0');
            else
                clk_div <= '0'; 
               -- count <= (others => '0'); 
            end if;
        end if;
    end process;

end behavior;