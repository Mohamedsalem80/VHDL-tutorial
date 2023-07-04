library ieee;
use ieee.std_logic_1164.all;

entity SRff is
  port (
    s, r, clk : in std_logic;
    q, qbar : inout std_logic
  );
end entity SRff;

architecture SRff_arch of SRff is
	begin
	process (clk)
		begin
			if rising_edge(clk) then
				if s = '0' and r = '0' then -- Hold condition
					q <= q;
					qbar <= not(q);
				elsif s = '0' and r = '1' then -- Reset condition
					q <= '0';
					qbar <= '1';
				elsif s = '1' and r = '0' then -- Set condition
					q <= '1';
					qbar <= '0';
				elsif s = '1' and r = '1' then -- Invalid condition
					q <= 'X';
					qbar <= 'X';
				end if;
			end if;
	end process;
end architecture SRff_arch;