library verilog;
use verilog.vl_types.all;
entity Datapath_vlg_check_tst is
    port(
        Count           : in     vl_logic;
        DataOut         : in     vl_logic_vector(7 downto 0);
        N               : in     vl_logic;
        Ov              : in     vl_logic;
        Z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Datapath_vlg_check_tst;
