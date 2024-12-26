library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity image_top_tb is
end image_top_tb;

architecture Behavioral of image_top_tb is

  component image_top is 
    port( 
      clk : in std_logic;
      vga_r, vga_b : out std_logic_vector(4 downto 0);
      vga_g : out std_logic_vector(5 downto 0);
      vga_hs, vga_vs : out std_logic
    );
  end component;

  signal clk_tb : std_logic := '0'; 
  signal vga_r, vga_b : std_logic_vector(4 downto 0) := (others => '0'); 
  signal vga_g : std_logic_vector(5 downto 0) := (others => '0');
  signal vga_hs, vga_vs : std_logic := '0';

begin

  image : image_top port map( 
    clk => clk_tb,
    vga_r => vga_r,
    vga_b => vga_b,
    vga_g => vga_g,
    vga_hs => vga_hs,
    vga_vs => vga_vs
  );

  clk_proc: process 
  begin
    wait for 4 ns;
    clk_tb <='1';
    wait for 4 ns;
    clk_tb <='0';

    
  end process;



end Behavioral;
