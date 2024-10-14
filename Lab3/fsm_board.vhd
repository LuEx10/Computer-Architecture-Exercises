LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fsm_board IS
	PORT(HEX0: OUT std_logic_vector(0 to 6);
		  LEDR: OUT std_logic_vector(17 downto 0);
		  KEY: IN std_logic_vector(3 downto 0);
		  SW: IN std_logic_vector(17 downto 0)
		  );
END ENTITY fsm_board;

ARCHITECTURE bhv OF fsm_board IS
signal w, z, clock, reset: std_logic;
BEGIN
	LEDR <= SW;
	w <= SW(0);
	reset <= KEY(2);
	clock <= KEY(0);
	
	FSM_instance : entity work.FSM
        PORT MAP (
            clock => clock,
            reset => reset,
            w => w,
            z => z
        );
	
	
	PROCESS(z)
		BEGIN
			CASE z IS
				WHEN '1' =>
					HEX0 <= "1001111";
				WHEN OTHERS =>
					HEX0 <= "0000001";
			END CASE;
		END PROCESS;
END bhv;