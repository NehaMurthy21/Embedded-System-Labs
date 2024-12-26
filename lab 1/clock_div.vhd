Library IEEE;
Use IEEE.STD_logic_1164.all;
Use IEEE.Numeric_STD.all;

Entity clock_div is
port(
clk : in std_logic;
En : out std_logic
);

End clock_div;

Architecture Behavioral of clock_div is

Signal count : std_logic_vector (26 downto 0) := (others => '0' );

Begin
Process (clk) 
Begin

If (rising_edge (clk) ) then
    If unsigned (count) < (62500000-1) then 
        Count <= std_logic_vector (unsigned (count)+1);
        En <= '0';
    Else 
        En <= '1';
        Count <= (others => '0');
    End if;
End if;
End process;
End behavioral; 
