library ieee;
use ieee.std_logic_1164.all;

entity FSM is

	port(
		clock		 : in	std_logic;
		w	 : in	std_logic;
		reset	 : in	std_logic;
		z	 : out	std_logic
	);

end entity;

architecture bhv of FSM is
	type state_type is (A,B,C,D,E,F,G,H,I);
	signal state   : state_type;

begin

	process (clock, reset)
	begin
		if reset = '1' then
			state <= A;
		elsif (rising_edge(clock)) then
			case state is
				when A =>
					if w = '1' then
						state <= F;
					else
						state <= B;
					end if;
				when B =>
					if w = '1' then
						state <= F;
					else
						state <= C;
					end if;
				when C =>
					if w = '1' then
						state <= F;
					else
						state <= D;
					end if;
				when D =>
					if w = '1' then
						state <= F;
					else
						state <= E;
					end if;
				when E =>
					if w = '1' then
						state <= F;
					else
						state <= E;
					end if;
				when F =>
					if w = '1' then
						state <= G;
					else
						state <= B;
					end if;
				when G =>
					if w = '1' then
						state <= H;
					else
						state <= B;
					end if;
				when H =>
					if w = '1' then
						state <= I;
					else
						state <= B;
					end if;
				when I =>
					if w = '1' then
						state <= I;
					else
						state <= B;
					end if;
			end case;
		end if;
	end process;
	
	process (state)
	begin
		case state is
			when E =>
				z <= '1';
			when I =>
				z <= '1';
			when others =>
				z <= '0';
		end case;
	end process;

end bhv;
