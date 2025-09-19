library IEEE;
use IEEE.std_logic_1164.all;

entity shifter is
	port(
		A: in std_logic_vector(7 downto 0);
		S: out std_logic_vector(7 downto 0);
		sel: in std_logic
	);
end shifter;

architecture arq of shifter is 
	begin 
		
		process(a, sel)
			begin 
				if sel = '0' then
					S <= A(6 downto 0) & '0';
				else
					S <= a(7) & A(7 downto 1);
				end if;
		end process;
end arq;