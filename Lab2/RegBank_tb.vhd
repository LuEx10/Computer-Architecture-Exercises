library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegBank_tb is
end RegBank_tb;

architecture bhv of RegBank_tb is
    signal clk, reset, we: std_logic := '0';
    signal rdAddr1, rdAddr2, wrAddr: std_logic_vector(4 downto 0) := "00000";
    signal wData: std_logic_vector(31 downto 0) := (others => '0');
    signal rdData1, rdData2: std_logic_vector(31 downto 0);
begin
    -- Instancie a unidade RegBank
    uut: entity work.RegBank
        port map (
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

    -- Processo de clock
    process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Processo de estímulo
    process
    begin
        reset <= '0';
        we <= '1';
        rdAddr1 <= "00010";
        rdAddr2 <= "00001";
        wrAddr <= "00010";
        wData <= (others => '1');
        wait for 10 ns;
        
        reset <= '0';
        wait for 10 ns;

        we <= '1';
        wData <= (others => '0');
        wait for 10 ns;
        
        we <= '0';
        wait for 10 ns;

        wrAddr <= "00011";
        wData <= (others => '1');
        wait for 10 ns;

        rdAddr1 <= "00010";
        rdAddr2 <= "00011";
        wait for 10 ns;
		  
        reset <= '1';
        wait for 10 ns;
		  
        assert false report "Testbench terminado" severity note;
        wait;
    end process;
end bhv;
