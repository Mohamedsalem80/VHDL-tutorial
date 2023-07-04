library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
    port (
        a: in std_logic;
        r: out std_logic
    );
end entity not_gate;

architecture not_gate_arch of not_gate is
begin
    r <= not a;
end architecture not_gate_arch;