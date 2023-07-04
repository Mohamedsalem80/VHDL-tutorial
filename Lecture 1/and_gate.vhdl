library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port (
        a: in std_logic;    
        b: in std_logic;
        c: out std_logic
    );
end entity and_gate;

architecture and_gate_arch of and_gate is
begin
    c <= a and b;
end architecture and_gate_arch;