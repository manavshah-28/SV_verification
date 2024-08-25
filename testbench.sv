`include "interface.sv"
`include "test.sv"
module testbench;
    
    reg clk;

    initial begin
        clk <= 0;
    end

    always #10 clk = ~clk;

    //create an instance of the interface
    intf intff(clk);

    //creating an instance of the test and passing the interface as the parameter
    test tst(intff);

    //connetcing the DUT
  FSM f1(.clk(intff.clk),
         .Stream(intff.Stream),
         .Tone(intff.Tone),
         .Counter(intff.Counter)
           );


    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end

endmodule
