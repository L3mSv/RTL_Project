library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_1 is
	port(
		A, B, C, D : in std_logic_vector(7 downto 0); 
		sel : in std_logic_vector(1 downto 0);
		q : out std_logic_vector(7 downto 0)
	);
end entity;

architecture laalaa of mux4_1 is
	begin
		with sel select
			q <= A when "00",
				  B when "01",
				  C when "10",
				  D when others;
end architecture;