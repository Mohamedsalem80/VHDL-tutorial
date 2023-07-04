library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
    port (
        a: in std_logic;
        b: in std_logic;
        c: out std_logic
    );
end entity or_gate;

architecture or_gate_arch of or_gate is
begin
    c <= a or b;
end architecture or_gate_arch;