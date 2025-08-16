library IEEE;
use IEEE.std_logic_1164.all;

entity mux8_1 is
	port(
		A, B, C, D, E, F, G, H : in std_logic_vector(7 downto 0); 
		sel : in std_logic_vector(2 downto 0);
		q : out std_logic_vector(7 downto 0)
	);
end entity;

architecture laalaa of mux8_1 is
	begin
		with sel select
			q <= A when "000",
				  B when "001",
				  C when "010",
				  D when "011",
				  E when "100", 
				  F when "101", 
				  G when "110",
				  H when others;
end architecture;