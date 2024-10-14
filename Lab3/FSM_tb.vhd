library ieee;
use ieee.std_logic_1164.all;

entity FSM_tb is
end entity;

architecture tb_architecture of FSM_tb is
    signal clock     : std_logic := '0';
    signal w         : std_logic := '0';
    signal reset     : std_logic := '0';
    signal z         : std_logic;
	 signal fim			: boolean:= false;

begin
    uut : entity work.FSM
        port map(
            clock     => clock,
            w         => w,
            reset     => reset,
            z         => z
        );

    process
    begin
        while not fim loop
            clock <= not clock;
            wait for 5 ns; 
        end loop;
        wait;
    end process;

    process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;
		  w <= '0';
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
		  w <= '1';
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
		  reset <= '1';
        wait for 10 ns;
		  reset <= '0';
        wait for 10 ns;
		  w <= '1';
        wait for 10 ns;
		  w <= '0';
        wait for 10 ns;
		  w <= '1';
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;

        fim <= true;
        wait;
    end process;

end tb_architecture;
