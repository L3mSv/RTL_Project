library verilog;
use verilog.vl_types.all;
entity top_level_vlg_check_tst is
    port(
        DataOut         : in     vl_logic_vector(7 downto 0);
        R0              : in     vl_logic_vector(7 downto 0);
        R1              : in     vl_logic_vector(7 downto 0);
        R2              : in     vl_logic_vector(7 downto 0);
        R3              : in     vl_logic_vector(7 downto 0);
        R4              : in     vl_logic_vector(7 downto 0);
        R5              : in     vl_logic_vector(7 downto 0);
        R6              : in     vl_logic_vector(7 downto 0);
        R7              : in     vl_logic_vector(7 downto 0);
        s               : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end top_level_vlg_check_tst;
