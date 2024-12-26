


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer_tb is
--  Port ( );
end debouncer_tb;

architecture Behavioral of debouncer_tb is

signal tb_clock : std_logic :='0';
signal tb_btn : std_logic :='0';
signal tb_dbnc : std_logic := '0';

component debouncer is
port(
clk : in std_logic;
btn : in std_logic; 
dbnc : out std_logic
);
end component;

   begin
   
   debouncer_process : process
   begin
   wait for 4 ns;
    tb_clock <= '1';
    
   wait for 4 ns;
    tb_clock <= '0';
    
    end process;
    
    button_process : process
    begin
    
    wait for 4 ns;
        tb_btn <='1';
    
    -- wait for 4 ns;
    -- tb_btn <='0';
    
    end process;
    
    dut:Debouncer
    port map(
    clk => tb_clock,
    btn => tb_btn,
    dbnc => tb_dbnc
    );
    
    


end Behavioral;


