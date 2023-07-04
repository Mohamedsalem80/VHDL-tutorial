library ieee;
use ieee.std_logic_1164.all;

entity fa_tb is
end fa_tb;

architecture fa_tb_arch of fa_tb is
    component fa
        port (
            a, b, cin: in  std_logic;
            sum, cout: out std_logic
        );
    end component;

    signal a, b, cin, sum, cout : std_logic;

    begin
        fa0: fa port map(a, b, cin, sum, cout);
    
        process
            begin
                a<='0';
                b<='0';
                cin<='0';
                wait for 10 ns;

                a<='1';
                b<='0';
                cin<='0';
                wait for 10 ns;

                a<='0';
                b<='1';
                cin<='0';
                wait for 10 ns;

                a<='1';
                b<='1';
                cin<='0';
                wait for 10 ns;

                a<='0';
                b<='0';
                cin<='1';
                wait for 10 ns;

                a<='1';
                b<='0';
                cin<='1';
                wait for 10 ns;
                
                a<='0';
                b<='1';
                cin<='1';
                wait for 10 ns;

                a<='1';
                b<='1';
                cin<='1';
                wait for 10 ns;
        end process;
end fa_tb_arch;