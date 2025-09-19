library verilog;
use verilog.vl_types.all;
entity FSM is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        ctr             : in     vl_logic;
        s               : out    vl_logic_vector(2 downto 0)
    );
end FSM;
