library IEEE;
use IEEE.std_logic_1164.all;

entity FF is
	port(
		A, B, Cin: in std_logic; 
		sum, carry : out std_logic
	);
end entity;

architecture laalaa of FF is
	begin
		sum <= A xor B xor Cin;
		carry <= (A and B) or (A and Cin) or (B and Cin);
end architecture;