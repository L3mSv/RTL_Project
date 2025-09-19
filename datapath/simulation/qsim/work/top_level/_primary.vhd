library verilog;
use verilog.vl_types.all;
entity top_level is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        DataOut         : out    vl_logic_vector(7 downto 0);
        R0              : out    vl_logic_vector(7 downto 0);
        R1              : out    vl_logic_vector(7 downto 0);
        R2              : out    vl_logic_vector(7 downto 0);
        R3              : out    vl_logic_vector(7 downto 0);
        R4              : out    vl_logic_vector(7 downto 0);
        R5              : out    vl_logic_vector(7 downto 0);
        R6              : out    vl_logic_vector(7 downto 0);
        R7              : out    vl_logic_vector(7 downto 0);
        s               : out    vl_logic_vector(2 downto 0)
    );
end top_level;
