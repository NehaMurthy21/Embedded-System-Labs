

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_tb is
--  Port ( );
end top_tb;

architecture Behavioral of top_tb is

    signal clk_tb : std_logic := '0';
    signal btn_tb : std_logic_vector(1 downto 0) := (others => '0');
    signal txd_tb, tb_cts, tb_rts : std_logic := '0';
    signal output : std_logic;
    
    component top_uart is
        Port (
            btn : in std_logic_vector(1 downto 0) := (others => '0');
            clk, TXD : in std_logic;
            RXD, CTS, RTS : out std_logic);
    end component;

begin
    clk_proc : process -- this clock generates a period of 8 ns with 50% duty cycle
    begin
        wait for 4 ns;
        clk_tb <= '1';
        wait for 4 ns;
        clk_tb <= '0';
    end process clk_proc;

    btn_proc : process -- checks button 1 in sending 
    begin
        wait for 5 us;
        btn_tb(1) <= '1';
        wait for 25 us;
        btn_tb(1) <= '0';
    end process btn_proc;
    
--    btn_reset_proc : process -- check reset button
--    begin
--        wait for 25 us;
--        btn_tb(0) <= '1';
--        wait for 30 us;
--        btn_tb(0) <= '0';
--    end process btn_reset_proc;



    dut : top_uart
        port map (
            btn => btn_tb,
            clk => clk_tb,
            TXD => txd_tb,
            RXD => output,
            CTS => tb_cts,
            RTS => tb_rts
        );
end Behavioral;