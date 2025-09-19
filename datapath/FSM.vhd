Library IEEE;
USE IEEE.std_logic_1164.all;

Entity FSM is
Port(clock,reset, flag_ula_overflow : in std_logic;
     s : out std_logic_vector(2 downto 0);
	  --dataIn: out std_logic_vector(7 downto 0);
     c : out std_logic_vector(27 downto 0)
	  );
End FSM;

architecture Arq of FSM is
type tipo_estado is (S0,S1,S2,S3,S4,S5);
signal proximo_estado, estado_atual : tipo_estado;
signal s_reg_mux_2_1 : std_logic_vector(7 downto 0);
signal s_regs : std_logic_vector(7 downto 0);
signal s_mux_8_1 : std_logic_vector(5 downto 0);
signal s_mux_4_1 : std_logic_vector(1 downto 0);
signal s_ULA, s_shifter : std_logic;
signal s_final_mux_2_1 : std_logic_vector(1 downto 0);
--signal dataIn: std_logic_vector(7 downto 0);


begin

process(clock,reset)
begin
   if reset = '1' then
	   estado_atual <= S0;
	elsif clock'event and clock = '1' then
	   estado_atual <= proximo_estado;
	end if;
end process;

process(estado_atual)

begin
   case estado_atual is --inicio 
	    when S0 =>
		      s <= "000";
					--dataIn <= "00000001";
					s_reg_mux_2_1 <= "00000000";
					s_regs <= "00010000";
					s_mux_8_1 <= "000100";
					s_mux_4_1 <= "00";
					s_ULA <= '0';
					s_shifter <= '0';
					s_final_mux_2_1 <= "00";
					
			      proximo_estado <= S1;
				
		 when S1 => --r5 <= r4 
				s <= "001";
				s_reg_mux_2_1 <= "00100000";
				s_regs <= "00100000";
				s_mux_8_1 <= "000100";
				s_mux_4_1 <= "00";
				s_ULA <= '0';
				s_shifter <= '0';
				s_final_mux_2_1 <= "00";
				
				proximo_estado <= S2;
			

	    when S2 => --r4 <= r4 + r3
		      s <= "010";
					s_reg_mux_2_1 <= "00010000";
					s_regs <= "00010000";
					s_mux_8_1 <= "011100";
					s_mux_4_1 <= "00";
					s_ULA <= '0';
					s_shifter <= '0';
					s_final_mux_2_1 <= "10";
			      proximo_estado <= S3;
				
		 when S3 => --r3 <= r5
				s <= "011"; 
					s_reg_mux_2_1 <= "00001000";
					s_regs <= "00001000";
					s_mux_8_1 <= "000101";
					s_mux_4_1 <= "00";
					s_ULA <= '0';
					s_shifter <= '0';
					s_final_mux_2_1 <= "00";
				
		 when S4 => --r5 <= r4 - r3 
				s <= "100";
					s_reg_mux_2_1 <= "00100000";
					s_regs <= "00100000";
					s_mux_8_1 <= "011100";
					s_mux_4_1 <= "00";
					s_ULA <= '1';
					s_shifter <= '0';
					s_final_mux_2_1 <= "10";
					
		 when S5 => --r3 <= r5
		 		s <= "101";
					s_reg_mux_2_1 <= "00001000";
					s_regs <= "00001000";
					s_mux_8_1 <= "000101";
					s_mux_4_1 <= "00";
					s_ULA <= '0';
					s_shifter <= '0';
					s_final_mux_2_1 <= "00";
				
					if flag_ula_overflow = '0' then
						proximo_estado <= S2;
					else
						--dataIn <= "00000000";
						--s_reg_mux_2_1 <= "00000000";
						--s_regs <= "00110000";
						--dataIn <= "00000001";
						--s_reg_mux_2_1 <= "00001000";
						--s_regs <= "00001000";
						
						proximo_estado <= S1;
					end if;	
					
					
		end case;
end process;
	c <= s_final_mux_2_1 & s_shifter & s_ULA & s_mux_4_1 & s_mux_8_1 & s_regs & s_reg_mux_2_1;

end Arq;