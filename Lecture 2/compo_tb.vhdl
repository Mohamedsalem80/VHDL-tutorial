library ieee;
use ieee.std_logic_1164.all;

entity compo_tb is
end compo_tb;

architecture compo_tb_arch of compo_tb is
    component compo 
        port (
            a: in std_logic;
            b: in std_logic;
            not_a: out std_logic;
            a_and_b: out std_logic;
            a_or_b: out std_logic;
            a_xor_b: out std_logic
        );
    end component;

    signal a, b, not_a, a_and_b, a_or_b, a_xor_b: std_logic;

    begin
        com0: compo port map (a, b, not_a, a_and_b, a_or_b, a_xor_b);

    process
        begin
            a<='0';
            b<='0';
            wait for 10 ns;

            a<='1';
            b<='0';
            wait for 10 ns;

            a<='0';
            b<='1';
            wait for 10 ns;

            a<='1';
            b<='1';
            wait for 10 ns;
    end process;
end compo_tb_arch;