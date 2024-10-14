library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Lab0_TB is
end entity Lab0_TB;

architecture testbench of Lab0_TB is
    signal tb_SW : std_logic_vector(17 downto 0) := (others => '0');
	 signal tb_KEY : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_LEDR : std_logic_vector(17 downto 0);
    signal tb_HEX7 : std_logic_vector(0 to 6);

    component Lab0
        port (
            LEDR: out std_logic_vector(17 downto 0);
            SW: in std_logic_vector(17 downto 0);
            HEX7: out std_logic_vector(0 to 6);
            KEY: in std_logic_vector(3 downto 0)
        );
    end component Lab0;

    begin
        uut: Lab0
            port map (
                LEDR => tb_LEDR,
                SW => tb_SW,
                HEX7 => tb_HEX7,
                KEY => tb_KEY
            );

        stimulus: process
        begin
             
            tb_KEY <= "0000"; 

            wait for 100 ns;

            
            tb_KEY <= "0101";

            wait for 100 ns;

            tb_KEY <= "1000";
				
				wait for 100 ns;
				
				tb_KEY <= "1111";
				
				wait for 100 ns;
            
            wait;
        end process stimulus;

    end architecture testbench;