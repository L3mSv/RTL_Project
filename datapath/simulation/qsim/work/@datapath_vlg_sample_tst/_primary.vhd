library verilog;
use verilog.vl_types.all;
entity Datapath_vlg_sample_tst is
    port(
        C               : in     vl_logic_vector(27 downto 0);
        clock           : in     vl_logic;
        DataIn          : in     vl_logic_vector(7 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Datapath_vlg_sample_tst;
