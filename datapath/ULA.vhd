library IEEE;
use IEEE.std_logic_1164.all;

entity ULA is
	port(
		A, B: in std_logic_vector(7 downto 0); 
		s : out std_logic_vector(7 downto 0);
		ctr : in std_logic;
		N, Z, Ov, Count : out std_logic
	);
end entity;

architecture laalaa of ULA is

	component HF is
	port(
		A, B: in std_logic; 
		sum, carry : out std_logic
	);
	end component;
	
	component FF is
	port(
		A, B, Cin: in std_logic; 
		sum, carry : out std_logic
	);
	end component;
	
	signal carry: std_logic_vector(7 downto 0);
	signal sum: std_logic_vector(7 downto 0);
	
	begin
	
	F0: FF
	port map(
		A => A(0),
		B => B(0) xor ctr,
		Cin => ctr,
		sum => s(0), 
		carry => carry(0)
	);
	
	F1: FF 
	port map(
		A => A(1),
		B => B(1) xor ctr,
		Cin => carry(0),
		sum => s(1),
		carry => carry(1)
	);
	
	F2: FF
	port map(
		A => A(2),
		B => B(2) xor ctr,
		Cin => carry(1),
		sum => s(2),
		carry => carry(2)
	);
	
	F3: FF 
	port map(
		A => A(3),
		B => B(3) xor ctr,
		Cin => carry(2),
		sum => s(3),
		carry => carry(3)
	);

	F4: FF 
	port map(
		A => A(4),
		B => B(4) xor ctr,
		Cin => carry(3),
		sum => s(4),
		carry => carry(4)
	);

	F5: FF 
	port map(
		A => A(5),
		B => B(5) xor ctr,
		Cin => carry(4),
		sum => s(5), 
		carry => carry(5)
	);
	
	F6: FF 
	port map(
		A => A(6),
		B => B(6) xor ctr,
		Cin => carry(5),
		sum => s(6), 
		carry => carry(6)
	);
	
	F7: FF 
	port map(
		A => A(7),
		B => B(7) xor ctr,
		Cin => carry(6),
		sum => s(7), 
		carry => carry(7)
	);

--Flags 
	Count <= carry(7);
	Z <= '1' when sum = "00000000" else '0';
	N <= sum(7);
	Ov <= carry(7) xor carry(6);

end architecture;