library IEEE;
use IEEE.std_logic_1164.all;

entity FlipFlopD is
	port(
		Clk, reset, load: in std_logic;
		D: in std_logic_vector(7 downto 0);
		Q: out	std_logic_vector(7 downto 0)
	);
end FlipFlopD;

architecture arq of FlipFlopD is 
	signal q_temp: std_logic_vector(7 downto 0);
	
begin
	process(Clk, reset) 
		begin
			if(reset = '1') then 
				q_temp <= (others => '0');
			elsif rising_edge(Clk) then 
				if load = '1' then
					q_temp <= D;
				end if;
			end if;
		end process;
		Q <= q_temp;
end arq;