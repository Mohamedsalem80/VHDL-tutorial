library ieee;
use ieee.std_logic_1164.all;

entity fa is
    port (
        a, b, cin: in  std_logic;
        sum, cout: out std_logic
    );
end fa;

architecture fa_arch of fa is
begin
    process (a, b, cin)
    begin
        if a = '0' and b = '0'  and cin = '0' then
            sum <= '0';
            cout <= '0';
        elsif a = '0' and b = '0'  and cin = '1' then 
            sum <= '1';
            cout <= '0';
        elsif a = '0' and b = '1'  and cin = '0' then 
            sum <= '1';
            cout <= '0';
        elsif a = '0' and b = '1'  and cin = '1' then 
            sum <= '0';
            cout <= '1';
        elsif a = '1' and b = '0'  and cin = '0' then 
            sum <= '1';
            cout <= '0';
        elsif a = '1' and b = '0'  and cin = '1' then 
            sum <= '0';
            cout <= '1';
        elsif a = '1' and b = '1'  and cin = '0' then 
            sum <= '0';
            cout <= '1';
        elsif a = '1' and b = '1'  and cin = '1' then 
            sum <= '1';
            cout <= '1';
        end if;
    end process;
end fa_arch;
