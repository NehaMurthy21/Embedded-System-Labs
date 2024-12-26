library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controls is
port (
    -- Timing Signals
    clk , en , rst : in std_logic;
    
    -- Register File IO
    rID1 : out std_logic_vector(4 downto 0) := "00001";
    rID2 : out std_logic_vector (4 downto 0);
    wr_enR1 , wr_enR2 : out std_logic;
    regrD1 : in std_logic_vector(15 downto 0);
    regrD2 : in std_logic_vector (15 downto 0);
    regwD1 , regwD2 : out std_logic_vector (15 downto 0);
    
    -- Framebuffer IO
    fbRST : out std_logic ;
    fbAddr1 : out std_logic_vector (11 downto 0);
    fbDin1 : in std_logic_vector (15 downto 0);
    fbDout1 : out std_logic_vector (15 downto 0);
    wr_en : out std_logic;
    
    -- Instruction Memory IO
    irAddr : out std_logic_vector (13 downto 0);
    irWord : in std_logic_vector (31 downto 0);
    
    -- Data Memory IO
    dAddr : out std_logic_vector (14 downto 0);
    d_wr_en : out std_logic;
    dOut : out std_logic_vector (15 downto 0);
    dIn : in std_logic_vector (15 downto 0);
    
    -- ALU IO
    aluA , aluB : out std_logic_vector (15 downto 0);
    aluOp : out std_logic_vector (3 downto 0);
    aluResult : in std_logic_vector (15 downto 0);
    
    -- UART IO
    ready , newChar : in std_logic;
    sendUART : out std_logic;
    charRec : in std_logic_vector (7 downto 0);
    charSend : out std_logic_vector (7 downto 0)
);
end controls;

architecture fsm of controls is

type state is (fetch, decode, decodeWait, rops, ropsWait, iops, iopsWait, jops, calc,calcWait, store, storeWait, jr, recv, rpix,rpixwait, wpix, 
               wpixWait, send, equals, nequal, ori, lw,lwWait, sw,swWait, jmp, jal, clrscr, finish); --I have 9 waits even though there should be 8
               
signal nextState : state := fetch;

signal program_counter : std_logic_vector(15 downto 0);
signal instr : std_logic_vector(31 downto 0);
signal opcode : std_logic_vector(4 downto 0);
signal reg1Addr : std_logic_vector(4 downto 0);
signal reg1 : std_logic_vector(15 downto 0);
signal reg2 : std_logic_vector(15 downto 0);
signal reg3 : std_logic_vector(15 downto 0);
signal immediate : std_logic_vector(15 downto 0);
signal ResultOfALU : std_logic_vector(15 downto 0) := aluResult;
signal sum : std_logic_vector(15 downto 0);

begin

process(clk)
begin
if (rising_edge(clk)) then
    case nextState is
		when fetch => 
			program_counter <= regrD1;
			nextState <= decode;
			
		when decode =>
			irAddr <= program_counter(13 downto 0);
			wr_enR1 <= '1';
			nextState <= decodeWait;
			
		when decodeWait =>
			if irWord(31 downto 30) = "01" or irWord(31 downto 30) = "00" then
				nextState <= rops;
			elsif irWord(31 downto 30) = "10" then
				nextState <= iops;
			else
				nextState <= jops;
			end if;
			--Incrementing program counter
			regwD1 <= std_logic_vector(unsigned(program_counter)+1);
			wr_enR1 <= '0';
			instr <= irWord;
			
		when rops =>
			opcode <= instr(31 downto 27);
			rID1 <= instr(21 downto 17);
			rID2 <= instr(16 downto 12);
			reg1Addr <= instr(26 downto 22);
			nextState <= ropsWait;
			
		when ropsWait =>
			reg3 <= regrD2;
		    reg2 <= regrD1;

			
			if opcode = "01101" then
			    rID1 <= reg1Addr;
				nextState <= jr;
				
			elsif opcode = "01100" then
				nextState <= recv;
				
			elsif opcode = "01111" then	
				nextState <= rpix;
				
			elsif opcode = "01110" then
				nextState <= wpix;
				rID1 <= reg1Addr;
				
			elsif opcode = "01011" then
				nextState <= send;
			    rID1 <= reg1Addr;

			else
				nextState <= calc;
			end if;
			
		when iops => 
		  opcode <= instr(31 downto 27);
		  reg1Addr <= instr(26 downto 22);
		  rID1 <= instr(21 downto 17);
		  immediate <= instr(16 downto 1);
		 
		  nextState <= iopsWait;
		  
	   when iopsWait =>
	       reg2 <= regrD1;
	       if opcode(2 downto 0) = "000" then
	           nextState <= equals;
	           rID1 <= reg1Addr;
	       elsif opcode(2 downto 0) = "001" then
	           nextState <= nequal;
	           rID1 <= reg1Addr;
	       elsif opcode(2 downto 0) = "010" then
	           nextState <= ori;
	       elsif opcode(2 downto 0) = "011" then
	           sum <= std_logic_vector(unsigned(reg2)+unsigned(immediate));
	           nextState <= lw;
	           
	       else 
	           sum <= std_logic_vector(unsigned(reg2)+unsigned(immediate));
	           rID1 <= reg1Addr;
	           nextState <= sw;
	       end if;
	       
	   when store =>
	       rID2 <= reg1Addr;
	       wr_enR2 <= '1';
	       nextState <= storeWait;
	       
	   when storeWait =>
	       regwD2 <= ResultOfALU;
	       nextState <= finish;
	  
	       
	   when jops =>
	       immediate <= instr(26 downto 11); 
	       if opcode = "11000" then
	           rID1 <= "00001";
	           wr_enR1 <= '1';
	           nextState <= jmp;
	       elsif opcode = "11001" then
	           rID1 <= "00001";
	           wr_enR1 <= '1';
	           rID2 <= "00010";
	           wr_enR2 <= '1';
	           nextState <= jal;
	       else
	           nextState <= clrscr;
	       end if;
	   when jr =>
	        ResultOfALU <= regrD1;
	        reg1Addr <= "00001";
	        nextState <= store;
	        
	   when recv =>
	       ResultOfALU <= x"00" & charRec;
	       if newChar = '0' then
	           nextState <= recv;
	       else
	           nextState <= store;
	       end if;
	  
	   when rpix =>
	       fbAddr1 <= reg2(11 downto 0);
	       nextState <= rpixWait;
	       
	   when rpixWait =>
	       ResultOfALU <= fbDin1;
	       nextState <= store;
	       
	  when wpix => 
	       fbAddr1 <= regrD1(11 downto 0);
	       wr_en <= '1';
	       nextState <= wpixWait;
	  
	  when wpixWait =>
	       fbDout1 <= reg2;
	       nextState <= finish;
	       
	  when send =>
	       sendUART <= '1';
	       charSend <= regrD1(7 downto 0);
	       
	       if ready = '1' then
	           nextState <= finish;
	       else
	           nextState <= send;
	       end if;
	  
	  when calc =>
	       aluA <= reg2;
	       aluB <= reg3;
	       aluOp <= opcode(3 downto 0);
	       nextState <= calcWait;
	  
	  when calcWait =>
	       ResultOfALU <= aluresult;
	       nextState <= store;
	  
	  when equals =>
	       if (regrD1 = reg2) then
	           ResultOfALU <= immediate;
	           reg1Addr <= "00001";
	           nextState <= store;
	       end if;
	  
	  when nequal =>
	       if (regrD1 /= reg2) then
	           ResultOfALU <= immediate;
	           reg1Addr <= "00001";
	           nextState <= store;
	       end if;  
	  
	  when ori =>
	       ResultOfALU <= immediate or reg2;
	       nextState <= store;
	  
	  when lw =>
	       dAddr <= sum(14 downto 0);
	       nextState <= lwWait;
	       
	  when lwWait =>
	       ResultOfALU <= dIn;
	       nextState <= store;
	   
	  when sw =>
	       d_wr_en <= '1';
	       dAddr <= sum(14 downto 0);
	       nextState <= swWait;
	  
	  when swWait =>
	       dOut <= regrD1;
	       nextState <= finish;
	       
	 when jmp =>
	       regwD1 <= immediate;
	       wr_enR1 <= '0';
	       nextState <= finish;
	 when jal =>
	       regwD2 <= program_counter;
	       regwD1 <= immediate;
	       wr_enR1 <= '0';
	       wr_enR2 <= '0';
	       nextState <= finish;
	 
	 when clrscr =>
	       fbRST <= '1';
	       nextState <= finish;
	 
	 when finish =>
	       wr_en <= '0';
	       wr_enR1 <= '0';
	       wr_enR2 <= '0';
	       d_wr_en <= '0';
	       rID1 <= "00001";
	       nextState <= fetch; 
	 when others =>
	       nextState <= finish;   
	end case;
end if;
end process;		
end fsm;