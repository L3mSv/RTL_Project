library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        DataIn          : in     vl_logic_vector(7 downto 0);
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        C               : in     vl_logic_vector(27 downto 0);
        DataOut         : out    vl_logic_vector(7 downto 0);
        N               : out    vl_logic;
        Z               : out    vl_logic;
        Ov              : out    vl_logic;
        Count           : out    vl_logic
    );
end Datapath;
