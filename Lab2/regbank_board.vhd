library ieee;
use ieee.std_logic_1164.all;

entity regbank_board is
port (
	LEDR: out std_logic_vector(17 downto 0);
	SW: in std_logic_vector(17 downto 0);
	KEY: in std_logic_vector(3 downto 0)
	);
end regbank_board;

architecture bhv of regbank_board is
--RegBank
--COMPONENT RegBank is
--    Port (
--        clk, reset, we      : in std_logic;
--        rdAddr1, rdAddr2, wrAddr  : in std_logic_vector(4 downto 0);
--        wData   : in std_logic_vector(31 downto 0);
--        rdData1, rdData2 : out std_logic_vector(31 downto 0)
--    );
--end COMPONENT;
	
signal clk, reset, we      : std_logic;
signal rdAddr1, rdAddr2, wrAddr  : std_logic_vector(4 downto 0):= (others => '0');
signal wData   : std_logic_vector(31 downto 0):= (others => '0');
signal rdData1, rdData2 : std_logic_vector(31 downto 0):= (others => '0');


begin
	clk <= not KEY(3);
	we <= not KEY(2);
	reset <= not KEY(1);
	
	rdAddr1 <= SW(14 downto 10);
	rdAddr2 <= SW(9 downto 5);
	wrAddr <= SW(4 downto 0);
	
	wData <= x"0000000"&'0' & SW(17 downto 15);

	--instanciar RegBank
	RegBank_instance : entity work.RegBank
        PORT MAP (
            clk => clk,
            reset => reset,
            we => we,
            rdAddr1 => rdAddr1,
            rdAddr2 => rdAddr2,
            wrAddr => wrAddr,
            wData => wData,
            rdData1 => rdData1,
            rdData2 => rdData2
        );
	LEDR(14 downto 10) <= rdData1(4 downto 0); 
	LEDR(9 downto 5) <= rdData2(4 downto 0);
	
	
	
	

end bhv;