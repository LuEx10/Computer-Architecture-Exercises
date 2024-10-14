library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

ENTITY ALU_tb IS
END ALU_tb;

ARCHITECTURE behavior OF ALU_tb IS 
 
    COMPONENT ALU
    PORT(
    A, B     : in  STD_LOGIC_VECTOR(31 downto 0);  -- 2 inputs 32-bit
    ALUCtl  : in  STD_LOGIC_VECTOR(3 downto 0);  -- selecoes possiveis de funcoes
    R   : out  STD_LOGIC_VECTOR(31 downto 0); 
	 Zero, Overflow, Cout : out STD_LOGIC 
    );
END COMPONENT;

signal A : std_logic_vector(31 downto 0) := (others => '0');
signal B : std_logic_vector(31 downto 0) := (others => '0');
signal ALUCtl : std_logic_vector(3 downto 0) := (others => '0');
signal R : std_logic_vector(31 downto 0);
signal Zero, Overflow, Cout: std_logic;
signal i:integer;

BEGIN

uut: ALU PORT MAP (
          A => A,
          B => B,
          ALUCtl => ALUCtl,
          R => R,
			 Zero => Zero, 
			 Overflow => Overflow, 
			 Cout => Cout
        );
        
        
        stim_proc: process
   begin  
	
	A <= "0111"&x"FFFFFFF";
	B <= x"00000008";
	ALUCtl <= x"0";
  
	for i in 0 to 15 loop 
		ALUCtl <= ALUCtl + x"1";
		wait for 100 ns;
	end loop;
	
	A <= x"FFFFFFFF";
	B <= x"FFFFFFFF";
	ALUCtl <= x"0";
  
	for i in 0 to 15 loop 
		ALUCtl <= ALUCtl + x"1";
		wait for 100 ns;
	end loop;
	wait;
   end process;

END;