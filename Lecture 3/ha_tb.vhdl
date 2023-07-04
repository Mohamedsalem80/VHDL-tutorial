library ieee;
use ieee.std_logic_1164.all;

entity ha_tb is
end ha_tb;

architecture ha_tb_arch of ha_tb is
    component ha
        port(
            a: in std_logic;
            b: in std_logic;
            s: out std_logic;
            c: out std_logic
        );
    end component;

    signal a, b, s, c: std_logic; 

    begin
        ha0: ha port map(a=>a, b=>b, s=>s, c=>c);
    
        process
            begin
                a<='X';
                b<='X';
                wait for 10 ns;
                
                a<='0';
                b<='0';
                wait for 10 ns;

                a<='0';
                b<='1';
                wait for 10 ns;

                a<='1';
                b<='0';
                wait for 10 ns;

                a<='1';
                b<='1';
                wait for 10 ns;
        end process;
end ha_tb_arch;