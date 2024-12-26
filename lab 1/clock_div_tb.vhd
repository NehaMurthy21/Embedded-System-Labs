library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div_tb is
--  Port ( );
end clock_div_tb;

architecture Behavioral of clock_div_tb is

    signal clk : std_logic := '0';
    signal div : std_logic;

    component clock_div is
        port(
            clk : in std_logic;
            en : out std_logic);
    end component;

begin



    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin

        wait for 4 ns;
        clk <= '1';

        wait for 4 ns;
        clk <= '0';

    end process clk_gen_proc;


    dut : clock_div
    port map (
        clk  => clk,
        en => div
    );

end Behavioral;