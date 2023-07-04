library ieee;
use ieee.std_logic_1164.all;

entity lecture0  is
    port( a: in std_logic; b: in std_logic; c: in std_logic;
 	      f: out std_logic);
end entity lecture0 ;

architecture lecture0_arch of lecture0 is
    signal d, e: std_logic;
begin
        d <= a and b;
        e <= d or c;
        f <= not e;
end architecture lecture0_arch;