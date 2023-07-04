library ieee;
use ieee.std_logic_1164.all;

entity fa is
    port (
        a, b, cin: in  std_logic;
        sum, cout: out std_logic
    );
end fa;

architecture fa_arch_1 of fa is
begin
    sum <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end fa_arch_1;

architecture fa_arch_2 of fa is
    signal s1, c1, c2: std_logic;
begin
    s1 <= a xor b;
    sum <= s1 xor cin;
    c1 <= a and b;
    c2 <= s1 and cin;
    cout <= c1 or c2;
end fa_arch_2;
