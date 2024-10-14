library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Lab0_TB is
end entity Lab0_TB;

architecture tb_arch of Lab0_TB is
    signal SW_TB: std_logic_vector(17 downto 0) := (others => '0');
    signal KEY_TB: std_logic_vector(3 downto 0) := "0000";
    signal LEDR_TB: std_logic_vector(17 downto 0);
    signal HEX7_TB: std_logic_vector(0 to 6);
    signal HEX6_TB: std_logic_vector(0 to 6);

    component Lab0
        port (
            LEDR: out std_logic_vector(17 downto 0);
            SW: in std_logic_vector(17 downto 0);
            HEX7: out std_logic_vector(0 to 6);
            HEX6: out std_logic_vector(0 to 6);
            KEY: in std_logic_vector(3 downto 0)
        );
    end component Lab0;

    begin
        UUT: Lab0
            port map (
                LEDR => LEDR_TB,
                SW => SW_TB,
                HEX7 => HEX7_TB,
                HEX6 => HEX6_TB,
                KEY => KEY_TB
            );
				

        process
        begin
 
            KEY_TB <= "0010"; 

            wait for 100 ns;

            KEY_TB <= "0001"; 

				wait for 100 ns;

				KEY_TB <= "1110";

				wait for 100 ns;

				KEY_TB <= "1010";

				wait for 100 ns;

            wait;
        end process;
end architecture tb_arch;