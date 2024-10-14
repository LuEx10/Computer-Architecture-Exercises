library ieee;
use ieee.std_logic_1164.all;

entity alu_board is
port (
	LEDR: out std_logic_vector(17 downto 15);	-- (17) = Zero, (16) = Overflow, (15) = Cout
	SW: in std_logic_vector(17 downto 0); 		-- (17 downto 14) = ALUCtrl, (13 dowto 7) = A, (6 downto 0) = B
	HEX7: out std_logic_vector(0 to 6);			-- todos os Hex = R
	HEX6: out std_logic_vector(0 to 6);			-- todos os Hex = R
	HEX5: out std_logic_vector(0 to 6);			-- todos os Hex = R
	HEX4: out std_logic_vector(0 to 6);			-- todos os Hex = R
	HEX3: out std_logic_vector(0 to 6);			-- todos os Hex = R
	HEX2: out std_logic_vector(0 to 6);			-- todos os Hex = R
	HEX1: out std_logic_vector(0 to 6);			-- todos os Hex = R
	HEX0: out std_logic_vector(0 to 6)			-- todos os Hex = R
	);
end alu_board;

architecture bhv of alu_board is

	COMPONENT ALU
   PORT(
   A, B     : in  STD_LOGIC_VECTOR(31 downto 0);
   ALUCtl  : in  STD_LOGIC_VECTOR(3 downto 0);
   R   : out  STD_LOGIC_VECTOR(31 downto 0); 
	Zero, Overflow, Cout : out STD_LOGIC 
   );
END COMPONENT;

signal A : std_logic_vector(31 downto 0) := (others => '0');
signal B : std_logic_vector(31 downto 0) := (others => '0');
signal ALUCtl : std_logic_vector(3 downto 0) := (others => '0');
signal R : std_logic_vector(31 downto 0);
signal Zero, Overflow, Cout: std_logic;

begin
	A <= SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)&SW(13)& SW(13 downto 7);
	B <= SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6)&SW(6 downto 0);
	ALUCtl <= SW(17 downto 14);
	
	--instanciar ALU
	ALU_instance : ALU
        PORT MAP (
            A => A,
            B => B,
            ALUCtl => ALUCtl,
            R => R,
            Zero => Zero,
            Overflow => Overflow,
            Cout => Cout
        );
		
	LEDR(17) <= Zero;
	LEDR(16) <= Overflow;
	LEDR(15) <= Cout;
	
	with R(15 downto 12) select
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
			  "0001000" when "1010",
			  "1100000" when "1011",
			  "0110001" when "1100",
			  "1000010" when "1101",
			  "0110000" when "1110",
			  "0111000" when "1111",
			  "1111111" when others;
			  															
	with R(11 downto 8) select
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
			  "0001000" when "1010",
			  "1100000" when "1011",
			  "0110001" when "1100",
			  "1000010" when "1101",
			  "0110000" when "1110",
			  "0111000" when "1111",
			  "1111111" when others;
			  
	with R(7 downto 4) select
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
			  "0001000" when "1010",
			  "1100000" when "1011",
			  "0110001" when "1100",
			  "1000010" when "1101",
			  "0110000" when "1110",
			  "0111000" when "1111",
			  "1111111" when others;
			  
	with R(3 downto 0) select
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
			  "0001000" when "1010",
			  "1100000" when "1011",
			  "0110001" when "1100",
			  "1000010" when "1101",
			  "0110000" when "1110",
			  "0111000" when "1111",
			  "1111111" when others;
			  
	HEX4 <= "1111111";
	HEX5 <= "1111111";
	HEX6 <= "1111111";
	HEX7 <= "1111111";

end bhv;