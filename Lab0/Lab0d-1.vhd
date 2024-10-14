library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity Lab0 is
port(
	LEDR: out std_logic_vector(17 downto 0);	
	SW: in std_logic_vector(17 downto 0); 		-- 17 to 11 = A, 6 to 0 = B
	HEX7: out std_logic_vector(0 to 6);			-- Aa		
	HEX6: out std_logic_vector(0 to 6);			-- Ab
	HEX5: out std_logic_vector(0 to 6);			-- Ba
	HEX4: out std_logic_vector(0 to 6);			-- Bb
	HEX3: out std_logic_vector(0 to 6);			-- Ra
	HEX2: out std_logic_vector(0 to 6);			-- Rb
	HEX1: out std_logic_vector(0 to 6);			-- Rc
	HEX0: out std_logic_vector(0 to 6);			-- Rd
	KEY: in std_logic_vector(3 downto 0)
	);
end Lab0;

architecture bhv of Lab0 is

signal A : std_logic_vector(15 downto 0) := (others => '0');
signal B : std_logic_vector(15 downto 0) := (others => '0');
signal R : std_logic_vector(15 downto 0);
signal Adecimal, Bdecimal, Rdecimal: integer;
signal Aa, Ab, Ba, Bb, Ra, Rb, Rc, Rd: std_logic_vector(3 downto 0);

begin
	A <= x"00" & '0' & SW(17 downto 11);
	B <= x"00" & '0' & SW(6 downto 0);
	
	R <= A + B;
	
	Adecimal <= to_integer(unsigned(A));
	Bdecimal <= to_integer(unsigned(B));
	Rdecimal <= to_integer(unsigned(R));
	
	Aa <= std_logic_vector(to_unsigned((Adecimal / 10) mod 10, 4));
   Ab <= std_logic_vector(to_unsigned(Adecimal mod 10, 4));  
	
	Ba <= std_logic_vector(to_unsigned((Bdecimal / 10) mod 10, 4)); 
   Bb <= std_logic_vector(to_unsigned(Bdecimal mod 10, 4));  
	
	Ra <= std_logic_vector(to_unsigned(Rdecimal / 1000, 4));  
   Rb <= std_logic_vector(to_unsigned((Rdecimal / 100) mod 10, 4));  
   Rc <= std_logic_vector(to_unsigned((Rdecimal / 10) mod 10, 4)); 
   Rd <= std_logic_vector(to_unsigned(Rdecimal mod 10, 4));  
    
	
	with Aa(3 downto 0) select
	HEX7 <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0000100" when "1001",
			  "1111111" when others;
			  															
	with Ab(3 downto 0) select
	HEX6 <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0000100" when "1001",
			  "1111111" when others;
			  															
	with Ba(3 downto 0) select
	HEX5 <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0000100" when "1001",
			  "1111111" when others;
			  															
	with Bb(3 downto 0) select
	HEX4 <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0000100" when "1001",
			  "1111111" when others;
			  															
	with Ra(3 downto 0) select
	HEX3 <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0000100" when "1001",
			  "1111111" when others;
			  															
	with Rb(3 downto 0) select
	HEX2 <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0000100" when "1001",
			  "1111111" when others;
			  
	with Rc(3 downto 0) select
	HEX1 <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0000100" when "1001",
			  "1111111" when others;
			  
	with Rd(3 downto 0) select
	HEX0 <= "0000001" when "0000",
			  "1001111" when "0001",
			  "0010010" when "0010",
			  "0000110" when "0011",
			  "1001100" when "0100",
			  "0100100" when "0101",
			  "0100000" when "0110",
			  "0001111" when "0111",
			  "0000000" when "1000",
			  "0000100" when "1001",
			  "1111111" when others;
end bhv;