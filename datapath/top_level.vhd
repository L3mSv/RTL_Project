Library IEEE;
USE IEEE.std_logic_1164.all;

Entity top_level is
Port(clock,reset: in std_logic;
	  DataOut, R0, R1, R2, R3, R4, R5, R6, R7 : out std_logic_vector(7 downto 0);
     s : out std_logic_vector(2 downto 0)
	  );
End top_level;

architecture arq of top_level is
	signal flag_ula_overflow : std_logic; 
	signal c : std_logic_vector(27 downto 0);
	--signal internal_dataIn: std_logic_vector(7 downto 0);
	
	component FSM is
		Port(
				clock,reset, flag_ula_overflow : in std_logic;
				s : out std_logic_vector(2 downto 0);
			   --dataIn: out std_logic_vector(7 downto 0);
				c : out std_logic_vector(27 downto 0)
		);
	End component;
	
	component Datapath is
		port(
			DataIn: in std_logic_vector(7 downto 0);
			reset, clock : in std_logic;
			C : in std_logic_vector(27 downto 0);
			DataOut, R0, R1, R2, R3, R4, R5, R6, R7: out std_logic_vector(7 downto 0);
			N,Z,Ov,Count: out std_logic
		);
	end component;
	
	begin
	
	Control_Unit: FSM
	port map(
	  clock => clock,
	  reset => reset, 
	  flag_ula_overflow => flag_ula_overflow,
	  --dataIn => internal_dataIn,
     s => s,
     c => c 
	);
	
	Processor: Datapath
	port map(
		DataIn => "00000001",
		reset => reset,
		clock => clock,
		C => c,
		DataOut => DataOut,
		R7 => R7,
		R0 => R0,
		R1 => R1,
		R6 => R6,
		R2 => R2,
		R3 => R3,
		R4 => R4,
		R5 => R5,		
		Ov => flag_ula_overflow
	);
		
end arq;	