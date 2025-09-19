library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_1 is
	port(
		A, B : in std_logic_vector(7 downto 0); 
		sel : in std_logic;
		q : out std_logic_vector(7 downto 0)
	);
end entity;

architecture laalaa of mux2_1 is
	begin
		with sel select
			q <= A when '0',
					B when others;
end architecture;