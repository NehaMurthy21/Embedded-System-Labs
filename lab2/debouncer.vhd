

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.all;

entity Debouncer is
port(
clk : in std_logic;
btn: in std_logic;
dbnc : out std_logic := '0'
);
end Debouncer;

architecture Behavioral of Debouncer is

signal counter : std_logic_vector(26 downto 0) := (others => '0');
signal outPutDebouncer : std_logic := '0';

begin

dbnc  <= outPutDebouncer;

process (clk)
begin
    if(rising_edge(clk)) then
        if (btn ='1') then
            if (unsigned(counter)< 2500000) then
                counter <=std_logic_vector(unsigned (counter)+1);
            else
                outPutDebouncer <= '1';
             end if;
       else
       counter <= (others => '0');
       outPutDebouncer <= '0';
       end if;
       end if;
       
       end process;
       
       
         


end Behavioral;