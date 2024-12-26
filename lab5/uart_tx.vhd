library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity uart_tx is
port (
    clk, en, send, rst :  in std_logic;
    char               : in std_logic_vector(7 downto 0);
    ready, tx          : out std_logic 
    );
end uart_tx;

architecture fsm of uart_tx is
type state is (idle, start, data);

signal curr : state := idle;
signal counter : std_logic_vector(3 downto 0) := (others => '0');
signal d : std_logic_vector(7 downto 0) := (others => '0');  -- character data

begin
    process(clk)
    begin
        if(rising_edge(clk)) then
        --when rst is asserted go back to idle state and clear everything
            if rst = '1' then
                curr <= idle;
                d <= (others => '0');
                counter <= (others => '0');
                tx <= '1';
                ready <= '1';
            elsif en ='1' then
                case curr is
                    when idle =>
                        ready <= '1';
                        tx <= '1';
                        if send = '1'  then
                            curr <= start; 
                            tx <= '0';
                            d <= char;
                            ready <= '0';
                        end if;
                     when start =>
                        counter <= (others => '0');
                        tx <= d(0);
                        curr <= data;
                     when data =>                       
                        if(unsigned(counter) < 7) then
                            tx <= d(to_integer(unsigned(counter)+1));
                            counter <= std_logic_vector(unsigned(counter)+1);
                        else
                            curr <= idle;
                            counter <= (others => '0');

                            tx <= '1';
                        end if;
                  end case;
              end if;
              end if;
      end process;     
end fsm;