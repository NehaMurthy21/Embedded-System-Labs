

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_uart is
  Port (
        btn : in std_logic_vector(1 downto 0);
        clk, TXD : in std_logic;
        RXD, CTS, RTS : out std_logic);
end top_uart;

architecture Behavioral of top_uart is

component clock_div
    port(
        clk : in std_logic;
        clk_div : out std_logic);
end component;

component debounce
    port(
        clk: in std_logic;
        btn: in std_logic;
        dbnc: out std_logic);
end component;

component sender
  Port ( 
         button, ready, rst, clk, en : in std_logic;
         send : out std_logic;
         char : out std_logic_vector( 7 downto 0 ));
end component;

component uart
    port (
    clk, en, send, rx, rst      : in std_logic;
    charSend                    : in std_logic_vector (7 downto 0);
    ready, tx, newChar          : out std_logic;
    charRec                     : out std_logic_vector (7 downto 0)
);
end component;

signal dbcn_1, dbcn_2, clk_div_output : std_logic := '0';
signal ready_output, send_output : std_logic := '0';
signal char_output : std_logic_vector(7 downto 0);

begin
    RTS <= '0'; -- inactive
    CTS <= '0';
    
    U1 : debounce
        port map (
            btn => btn(0),
            clk => clk,
            dbnc => dbcn_1
        );

    U2 : debounce
        port map(
            btn => btn(1),
            clk => clk,
            dbnc => dbcn_2
        );
        
    U3 : clock_div
        port map (
            clk => clk,
            clk_div => clk_div_output
        );

    U4 : sender
        port map (
            button => dbcn_2,
            ready => ready_output,
            rst => dbcn_1,
            clk => clk,
            en => clk_div_output,
            send => send_output,
            char => char_output 
        );

    U5 : uart
        port map(
            clk => clk,
            en => clk_div_output,
            send => send_output,
            rx => TXD,
            rst => dbcn_1,
            charSend => char_output,
            ready => ready_output,
            tx => RXD
        );
end Behavioral;