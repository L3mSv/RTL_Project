library IEEE;
use IEEE.std_logic_1164.all;

entity Datapath is
	port(
		DataIn: in std_logic_vector(7 downto 0);
		reset, clock : in std_logic;
		C : in std_logic_vector(27 downto 0);
		DataOut, R0, R1, R2, R3, R4, R5, R6, R7: out std_logic_vector(7 downto 0);
		N,Z,Ov,Count: out std_logic
	);
end Datapath;

architecture arq of Datapath is
	component mux2_1 is
		port(
		A, B : in std_logic_vector(7 downto 0); 
		sel : in std_logic;
		q : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component mux4_1 is
		port(
			A, B, C, D : in std_logic_vector(7 downto 0); 
			sel : in std_logic_vector(1 downto 0);
			q : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component mux8_1 is
		port(
			A, B, C, D, E, F, G, H : in std_logic_vector(7 downto 0); 
			sel : in std_logic_vector(2 downto 0);
			q : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component ULA is
		port(
			A, B: in std_logic_vector(7 downto 0); 
			s : out std_logic_vector(7 downto 0);
			ctr : in std_logic;
			N, Z, Ov, Count : out std_logic
		);
	end component;
	
	component shifter is
		port(
			A: in std_logic_vector(7 downto 0);
			S: out std_logic_vector(7 downto 0);
			sel: in std_logic
		);
	end component;
	
	component FlipFlopD is
		port(
			Clk, reset, load: in std_logic;
			D: in std_logic_vector(7 downto 0);
			Q: out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal DataUla: std_logic_vector(7 downto 0);
	signal M_0, M_1, M_2, M_3, M_4, M_5, M_6, M_7, M_11: std_logic_vector(7 downto 0);
	signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7: std_logic_vector(7 downto 0);
	signal opA, opB, opS, sULA, sShifter: std_logic_vector(7 downto 0);
	
	begin
	
	-- Muxes Line
	
	Mx0: Mux2_1 
	port map
	(A => DataIn,
	B => DataUla,
	sel => C(0),
	q => M_0);
	
	Mx1: Mux2_1 
	port map
	(A => DataIn,
	B => DataUla,
	sel => C(1),
	q => M_1);
	
	Mx2: Mux2_1 
	port map
	(A => DataIn,
	B => DataUla,
	sel => C(2),
	q => M_2);
	
	Mx3: Mux2_1 
	port map
	(A => DataIn,
	B => DataUla,
	sel => C(3),
	q => M_3);
	
	Mx4: Mux2_1 
	port map
	(A => DataIn,
	B => DataUla,
	sel => C(4),
	q => M_4);
	
	Mx5: Mux2_1 
	port map
	(A => DataIn,
	B => DataUla,
	sel => C(5),
	q => M_5);
	
	Mx6: Mux2_1 
	port map
	(A => DataIn,
	B => DataUla,
	sel => C(6),
	q => M_6);
	
	Mx7: Mux2_1 
	port map
	(A => DataIn,
	B => DataUla,
	sel => C(7),
	q => M_7);
	
	--- Registers Line
	
	R_0:FlipFlopD
	port map
	(D => M_0,
	Clk => clock,
	reset => reset,
	load => C(8), 
	q => Q0);
	
	R_1:FlipFlopD
	port map
	(D => M_1,
	Clk => clock,
	reset => reset,
	load => C(9), 
	q => Q1);
	
	R_2:FlipFlopD
	port map
	(D => M_2,
	Clk => clock,
	reset => reset,
	load => C(10), 
	q => Q2);
	
	R_3:FlipFlopD
	port map
	(D => M_3,
	Clk => clock,
	reset => reset,
	load => C(11), 
	q => Q3);
	
	R_4:FlipFlopD
	port map
	(D => M_4,
	Clk => clock,
	reset => reset,
	load => C(12), 
	q => Q4);
	
	R_5:FlipFlopD
	port map
	(D => M_5,
	Clk => clock,
	reset => reset,
	load => C(13), 
	q => Q5);
	
	R_6:FlipFlopD
	port map
	(D => M_6,
	Clk => clock,
	reset => reset,
	load => C(14), 
	q => Q6);
	
	R_7:FlipFlopD
	port map
	(D => M_7,
	Clk => clock,
	reset => reset,
	load => C(15), 
	q => Q7);

	-- ULA Muxes
	
	Mx8: mux8_1
	port map
	(
		A => Q0,
		B => Q1,
		C => Q2, 
		D => Q3, 
		E => Q4, 
		F => Q5, 
		G => Q6, 
		H => Q7,
		sel => C(18 downto 16),
		q => opA);
		
	Mx9: mux8_1
	port map
	(
		A => Q0,
		B => Q1,
		C => Q2, 
		D => Q3, 
		E => Q4, 
		F => Q5, 
		G => Q6, 
		H => Q7,
		sel => C(21 downto 19),
		q => opB);
		
	-- Shifter Mux
	
	Mx10: mux4_1
	port map
	(
		A => Q4,
		B => Q5,
		C => Q6, 
		D => Q7,
		sel => C(23 downto 22),
		q => opS);
		
	-- ULA
	
	instance_ULA: ULA 
	port map
	(
		A => opA,
		B => opB,
		s => sULA, 
		ctr => C(24), 
		N => N,
		Z => Z, 
		Ov => Ov,
		Count => Count);
	
	-- Shifter
	
	instance_Shifter: Shifter
	port map
	(
	A => opS,
	S => sShifter,
	sel => C(25));
	
	-- Result ULA/Shifter
	
	Mx11: mux2_1
	port map 
	(A => sUlA,
	B => sShifter,
	sel => C(26),
	q => M_11);
	
	
	Mx12: mux2_1
	port map
	(A => opA,
	B => M_11,
	sel => C(27),
	q => DataUla);
	
	-- DataOut door
	DataOut <= opS;
	
  -- Exit Door ()
	R0 <= Q0;
	R1 <= Q1;
	R2 <= Q2;
	R3 <= Q3;
	R4 <= Q4;
	R5 <= Q5;
	R6 <= Q6;
	R7 <= Q7;
	

end arq;