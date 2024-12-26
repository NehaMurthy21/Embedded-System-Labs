

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.ALL;

entity divider_top is
port(
    clk: in std_logic;
    led0 : out std_logic
    );
end divider_top;

architecture Behavioral of divider_top is

signal div : std_logic;
signal invert : std_logic;

component clock_div is
port(
    clk : in std_logic;
    en : out std_logic
);
end component;

begin

    process (clk)
    begin
    if(rising_edge(clk) and div='1') then
        invert <= not invert;
    end if;
    end process;

led0 <= invert;

U1 :clock_div

    port map(
    clk => clk,
    en => div
    );
end Behavioral;
