  ----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 3/7/2024 07:32:23 PM
-- Design Name:
-- Module Name: clock_div - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- 125MHz clock to 115200 Hz clock (generate a slower clock)
entity clock_div_115200MHz is
port (
    clk : in std_logic;
    clk_div : out std_logic);
end clock_div_115200MHz;

architecture behavior of clock_div_115200MHz is

signal count : std_logic_vector(10 downto 0) := (others => '0'); -- 11 bits to count up to 1085
signal div : std_logic := '0';

begin

    clk_div <= div;

    process (clk)
    begin
        if rising_edge(clk) then
            if unsigned(count) < 1085 then -- 115200 Hz
                count <= std_logic_vector(unsigned(count) + 1);  -- checks to see if the count is 1085 which is the desired frequnecy, if not will continue to increment
                div <= '0'; -- clock signal is still low
            else
                div <= '1'; --the desired frequency was reached and a rising edge will occur
                count <= (others => '0'); -- resets count to 0
            end if;
        end if;
    end process;

end behavior;

-- changing clock frequency will affect the time it takes for the data architecture
    -- For example, if you increase the clock frequency, the UART transmitter may transmit data at a faster rate. Conversely, if you decrease the clock frequency, the data transmission rate may slow down.

--In UART trasmitter, the baud rate where the data is being transmitted depends on the clock frequency and so changing the clock frequency means chanfing the timing of operations of the architecture
    -- this can cause the data to be transmitted at a different rate