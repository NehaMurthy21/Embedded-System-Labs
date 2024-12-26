
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level_tb is
--  Port ( );
end top_level_tb;

architecture Behavioral of top_level_tb is

    component top_wrapper
        port (
            CTS : out STD_LOGIC;
            RTS : out STD_LOGIC;
            RXD : out STD_LOGIC;
            TXD : in STD_LOGIC;
            btn0 : in STD_LOGIC;
            clk : in STD_LOGIC;
            vga_b : out STD_LOGIC_VECTOR ( 4 downto 0 );
            vga_g : out STD_LOGIC_VECTOR ( 5 downto 0 );
            vga_hs : out STD_LOGIC;
            vga_r : out STD_LOGIC_VECTOR ( 4 downto 0 );
            vga_vs : out STD_LOGIC
    );
    end component;

    signal clk_tb, btn_tb             : std_logic;
    signal CTS_tb, RTS_tb, RXD_tb, TXD_tb : std_logic;
    signal vga_B_tb, vga_R_tb             : std_logic_vector( 4 downto 0 );
    signal vga_G_tb                     : std_logic_vector( 5 downto 0 ); 
    signal vga_HS_tb, vga_VS_tb           : std_logic;

begin
    toppy_top : top_wrapper
        port map(
            CTS => CTS_tb,
            RTS => RTS_tb,
            RXD => RXD_tb,
            TXD => TXD_tb,
            btn0 => btn_tb,
            clk => clk_tb,
            vga_r => vga_R_tb,
            vga_g => vga_G_tb,
            vga_b => vga_B_tb,
            vga_hs => vga_HS_tb,
            vga_vs => vga_VS_tb
        );

    clock_process : process
    begin
        clk_tb <= '0';
        wait for 20 ns;
        clk_tb <= '1';
        wait for 20 ns;
    end process clock_process;

end Behavioral;