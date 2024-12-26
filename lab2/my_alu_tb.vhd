library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my_alu_tb is
end my_alu_tb;

architecture behavior of my_alu_tb is
    signal A, B, opcode, S: std_logic_vector(3 downto 0);
    signal clk: std_logic := '0';  

    component my_alu is
        port (
            A, B, opcode: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(3 downto 0)
        );
    end component;

begin
 


clk_gen_proc: process
    begin
    
        wait for 4 ns;
        clk <= '1';
        
        wait for 4 ns;
        clk <= '0';
    
    end process clk_gen_proc;
    
    alu_process: process
    begin
    wait for 500ns; 
        A <= "1000"; -- 
        B <= "0001"; -- 
        opcode <= "0000"; -- Set opcode to addition (A+B)

        wait for 500 ns; 
        A <= "1000"; 
        B <= "0010";
        opcode <= "0001"; -- Set opcode to subtraction (A-B)

        wait for 500 ns; 
        A <= "1000";
        opcode <= "0010";  -- Set opcode to (A+1)
        
        wait for 500ns;
        A <= "1000";
        opcode <= "0011";   -- Set opcode to (A-1)
        
        wait for 500 ns;
        A<= "0010";
        opcode <= "0100";   -- Set opcode to (0-A)
        
        wait for 500 ns;
        A <= "1000";
        B <= "0010" ;
        opcode <= "0101" ;  -- Set opcode to (A>B) Then 0001
        
--        wait for 500 ns;
--        A <= "0010";
--        B <= "1000" ;
--        opcode <= "0101" ;   -- Set opcode to (A>B) then 0000
        
        wait for 500 ns;
        A <= "0111";
        opcode <= "0110";   -- Set opcode to (A << 1)
        
        wait for 500 ns;
        A <= "0111";
        opcode <= "0111" ;  -- Set opcode to (A >> 1)
        
        wait for 500 ns; 
        A <= "1110";
        opcode <= "1000";    -- Set opcode to (A >>>1)
        
        wait for 500ns;
        A <= "1011";
        opcode <= "1001";   -- Set opcode to (NOT A)
        
        wait for 500ns;
        A <= "1011";
        B <= "1000" ;
        opcode <= "1010";  -- Set opcode to (A AND B)
        
        wait for 500 ns;
        A <= "1011" ;
        B <= "1000";
        opcode <= "1011";  -- Set opcode to (A OR B)
        
        wait for 500ns;
        A <= "1011";
        B <= "1000";
        opcode <= "1100";  -- Set opcode to (A XOR B)
        
        wait for 500 ns;
        A <= "1011" ;
        B <= "1000";
        opcode <= "1101";  -- Set opcode to (A XNOR B)
        
        wait for 500ns;
        A <= "1011";
        B <= "1000";
        opcode <= "1110";  -- Set opcode to (A NAND B)
   
        wait for 500ns;
        A <= "1011";
        B <= "1000";
        opcode <= "1111";  -- Set opcode to (A NOR B)
        
    
    
      end process alu_process;
      
         dut: my_alu
        port map (
            A => A,
            B => B,
            opcode => opcode,
            S => S
        );

end behavior;