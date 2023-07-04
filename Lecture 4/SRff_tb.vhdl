library ieee;
use ieee.std_logic_1164.all;

entity SRff_tb is
end SRff_tb;

architecture SRff_tb_arch of SRff_tb is
    component SRff 
        port(
            s, r, clk: in std_logic;
            q, qbar: inout std_logic
        );
    end component;

    signal s, r, clk, q, qbar: std_logic;

    begin
        SRff0: SRff port map (s, r, clk, q, qbar);

        process0: process
            begin
                while now < 500 ns loop
                    clk <= '1';
                    wait for 4 ns;
                    clk <= '0';
                    wait for 4 ns;
                end loop;
        end process;

        process1: process
        begin
            s <= '0';
            r <= '0';
            wait for 12 ns;

            s <= '0';
            r <= '1';
            wait for 12 ns;

            s <= '1';
            r <= '0';
            wait for 12 ns;

            s <= '1';
            r <= '1';
            wait for 12 ns;
    end process;
end SRff_tb_arch;