library ieee;
use ieee.std_logic_1164.all;

entity compo is 
    port (
        a: in std_logic;
        b: in std_logic;
        not_a: out std_logic;
        a_and_b: out std_logic;
        a_or_b: out std_logic;
        a_xor_b: out std_logic
    );
end compo;

architecture compo_arch of compo is
    begin
        not_a <= not a;
        a_and_b <= a and b;
        a_or_b <= a or b;
        a_xor_b <= a xor b;
end compo_arch;