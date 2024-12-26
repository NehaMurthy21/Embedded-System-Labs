library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity sender is  -- handling transmission of data over the UART communication line
Port 
( 
    button, ready   : in  STD_LOGIC;
    rst, clk, en    : in  STD_LOGIC;
    send            : out STD_LOGIC;
    char            : out STD_LOGIC_VECTOR(7 downto 0)
);
end sender;

architecture Behavioral of sender is

    type str is array (0 to 4) of std_logic_vector(7 downto 0);  -- net id is 8 bit vector 
    -- custom type str that is an array of 5 elements (nnm53) and each element is a 8 bit vector (2^8= 256 possible values)
    signal netID        : str := (X"6E", X"6E", X"6D", X"35", X"33"); 
    signal i            : STD_LOGIC_VECTOR (3 downto 0) := "0000"; -- 4 bits to index the netid and track current data
    constant n          : STD_LOGIC_VECTOR(3 downto 0) := "0101"; -- 
     
    type state is (idle,busyA, busyB, busyC); -- the possible states
    signal currState      : state := idle; -- this is the current state
    
begin

    process(clk) begin
   if(rising_edge(clk)) then
           if (rst = '1') then -- if reset, then everything is 0 and state is idle
            send    <= '0';
            i       <= (others => '0');
            char    <= (others => '0');
            currState    <= idle;
          
 
         elsif (en = '1') then 
            case currState is

                when idle =>
                    
                    if(ready='1' and button = '1') then
                        if (unsigned(i) < unsigned(n)) then  -- when button pressed and ready, will fetch data from netid array and based on current index (i) and transmit
                            send    <= '1';
                            char    <= netID(to_integer(unsigned(i)));
                            i       <= std_logic_vector(unsigned(i)+1);
                            currState    <= busyA;
                        elsif (unsigned(i) = unsigned(n)) then
                            i       <= (others => '0');
                            currState    <= idle;
                        end if;
                        end if;
                    
                when busyA => -- will prepare date for transmittion and initial the transmission by sending the send signal
                    currState <= busyB;

                when busyB => -- will deassert the send signal
                    send <= '0';
                    currState <= busyC;

                when busyC =>  -- waits for the button to be released and back to idle state
                    if(ready = '1' and button = '0') then
                        currState <= idle;
                    else
                        currState <= busyC;
                    end if;
                when others =>
                    currState <= idle;
                    char <= (others => '0');
                    i    <= (others => '0');
                    send <= '0';

            end case;
        end if;
        end if;
    end process;
end Behavioral;
            
          -- ready signal => uart_tx => inidicates that the transmitter is ready to accept new data
          -- enable signal => sender module => control signal that enables and disables the operation of the sender 
                -- when 1= > module is allowed into the function
                    -- allows for activation and deactivation of the transmission process
          -- send signal => 1 : it should start transmitting data
          
          