`include "interface.sv"
`include "test.sv"
module testbench;

intf intff();

test tst (intff);

full_adder FA(
    .a(intff.a),
    .b(intff.b),
    .c_in(intff.c_in),
    .sum(intff.sum),
    .c_out(intff.c_out)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end

endmodule
