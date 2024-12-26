

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_top is
    port(
        clk  : in std_logic;        
        btn :in std_logic_vector (3 downto 0);
        sw:in std_logic_vector(3 downto 0);
        led : out std_logic_vector (3 downto 0)

    );
end counter_top;

architecture Behavioral of counter_top is

    component clock_div is
        port(
            clk : in std_logic;
            en : out std_logic);
    end component;

    component fancy_counter is
        port (
            clk, clk_en : in std_logic;
            dir, en, ld, rst : in std_logic;
            updn : in std_logic;
            val : in std_logic_vector (3 downto 0);
            cnt : out std_logic_vector (3 downto 0));
    end component;

    component debouncer is
        port(
            clk: in std_logic;
            btn: in std_logic;
            dbnc: out std_logic);
    end component;

    signal div_to_en : std_logic;
    signal dbtn0_to_rst, dbtn1_to_en, dbtn2_to_updn, dbtn3_to_ld : std_logic; -- debouncerbutton# (dbnt) to the function
    signal value, count : std_logic_vector( 3 downto 0) := (others => '0');

begin
    -- --- set the values to switches and counts to led
     value <= sw(3) & sw(2) & sw(1) & sw(0);
     led(0) <= count(0);
     led(1) <= count(1);
     led(2) <= count(2);
     led(3) <= count(3);

 

    u1 : debouncer
        port map(
            clk=>clk,
            btn => btn(0),
            dbnc => dbtn0_to_rst
            );

   

        u2 : debouncer
              port map(
            clk=>clk,
            btn => btn(1),
            dbnc => dbtn1_to_en
            );
            

    

         u3 : debouncer
              port map(
            clk=>clk,
            btn => btn(2),
            dbnc => dbtn2_to_updn
            );    

    

        u4 : debouncer
              port map(
            clk=>clk,
            btn => btn(3),
            dbnc => dbtn3_to_ld
            );

    

            u5 : clock_div
              port map(
            clk=>clk,
            en => div_to_en
            );

                
    

          u6 : fancy_counter
              port map(
         clk  => clk,
        clk_en => div_to_en,
        dir => sw(0),
        rst => dbtn0_to_rst,
        en => dbtn1_to_en,
       updn => dbtn2_to_updn,
        ld => dbtn3_to_ld,
        val => sw,
        cnt => count

            );       

end Behavioral;
