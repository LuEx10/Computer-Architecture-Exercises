library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Lab0 is
    port (
        LEDR: out std_logic_vector(17 downto 0);
        SW: in std_logic_vector(17 downto 0);
        HEX7: out std_logic_vector(0 to 6);
        KEY: in std_logic_vector(3 downto 0)
    );
end entity Lab0;

architecture bhv of Lab0 is
    signal sw_decimal : natural range 0 to 65535;
    signal key_decimal : natural range 0 to 15;
    signal display_value : std_logic_vector(6 downto 0);

    type seven_segment_array is array (0 to 15) of std_logic_vector(6 downto 0);
    constant seven_segment_map : seven_segment_array :=
        ("0000001", "1001111", "0010010", "0000110", "1001100",
         "0100100", "0100000", "0001111", "0000000", "0000100",
         "0001000", "1100000", "0110001", "1000010", "0110000", "0111000"); -- Mapa de inputs

begin
    sw_decimal <= to_integer(unsigned(SW));
    key_decimal <= to_integer(unsigned(KEY));

    process (key_decimal)
    begin
        if key_decimal <= 9 then
            display_value <= seven_segment_map(key_decimal);
        else
            display_value <= "1111111"; -- Apagar o visor
        end if;
    end process;

    HEX7 <= display_value;

    LEDR <= SW;
end architecture bhv;