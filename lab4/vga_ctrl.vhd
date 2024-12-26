----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 07:51:52 PM
-- Design Name: 
-- Module Name: vga_ctrl - Behavioral
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

entity vga_ctrl is
    port ( 
    clk,en : in std_logic;
    hcount,vcount :out std_logic_vector(9 downto 0);
    vid,hs,vs : out std_logic 
    );  
end vga_ctrl;

architecture Behavioral of vga_ctrl is

    signal hcount_store : std_logic_vector (9 downto 0) := (others => '0');
    signal vcount_store : std_logic_vector (9 downto 0) := (others => '0');

begin

process (clk)
begin
if rising_edge(clk) then
    if (en='1') then
        if (unsigned(hcount_store) < 799) then -- increments including 799
            hcount_store <= std_logic_vector (unsigned(hcount_store)+ 1); 
        else
            hcount_store <= (others => '0');

                     if (unsigned (vcount_store) < 524) then  -- increments including 524
                        vcount_store <=  std_logic_vector (unsigned(vcount_store) + 1);
                    else 
                        vcount_store <= (others => '0');
                    end if;
        end if;
        
        end if;
        
        end if;
        
        end process;
        
        
    process (hcount_store,vcount_store)
    begin
        if((unsigned(hcount_store)>=0) and (unsigned(hcount_store)<=639)) and ((unsigned(vcount_store)>=0) and (unsigned(vcount_store)<=479)) then
            vid <='1';
        else
            vid<= '0';
        end if;
        
        if (unsigned (hcount_store) >=656) and (unsigned(hcount_store)<= 751) then
            hs <= '0';
        else
            hs <= '1';
        end if;
        
        if (unsigned (vcount_store) >=490) and (unsigned (vcount_store) <=491) then
            vs <= '0';
        else 
            vs <= '1';
        end if;
  
              
end process;

hcount <= hcount_store;
vcount <= vcount_store;


end Behavioral;