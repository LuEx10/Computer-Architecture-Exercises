library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Lab0_tb is
end entity Lab0_tb;

architecture tb of Lab0_tb is
	signal leds: std_logic_vector(17 downto 0);
	signal sw: std_logic_vector(17 downto 0) := (others => '0');
	signal hex0: std_logic_vector(0 to 6);
	signal hex1: std_logic_vector(0 to 6);
	signal hex2: std_logic_vector(0 to 6);
	signal hex3: std_logic_vector(0 to 6);
	signal hex4: std_logic_vector(0 to 6);
	signal hex5: std_logic_vector(0 to 6);
	signal hex6: std_logic_vector(0 to 6);
	signal hex7: std_logic_vector(0 to 6);
	signal keys: std_logic_vector(3 downto 0) := (others => '0');
	
	signal clock: std_logic := '0';
	signal stop: std_logic;
begin

	uut: entity work.Lab0 port map(LEDR => leds, SW => sw, HEX7 => hex7, HEX6 => hex6, HEX5 => hex5, HEX4 => hex4, HEX3 => hex3, HEX2 => hex2, HEX1 => hex1, HEX0 => hex0, KEY => keys);
	
	clock <= not clock after 5 ns when stop = '0' else '0';
	stop <= '1' when sw = (sw'range => '1') and keys = (keys'range => '1') else '0';
	
	process(clock)
	begin
		if clock'event and clock = '1' and stop = '0' then
			sw <= std_logic_vector(to_unsigned(to_integer(unsigned(sw)) + 1, sw'length));
		end if;
	end process;
		
		

end architecture tb;