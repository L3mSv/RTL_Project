library IEEE;
use IEEE.std_logic_1164.all;

entity HF is
	port(
		A, B: in std_logic; 
		sum, carry : out std_logic
	);
end entity;

architecture laalaa of HF is
	begin
		carry <= A and B;
		sum <= A xor B;
end architecture;