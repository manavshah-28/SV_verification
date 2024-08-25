// Environment : holds all the components

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
    driver d0;
    generator g0;
    monitor m0;
    scoreboard s0;

    virtual intf vif;
    mailbox gen_drive; // mailbox between generator and driver
    mailbox mon_scb;   // mailbox between monitor and scoreboard 

    function new( virtual intf vif);
        this.vif = vif;

        // create mailbox  
        gen_drive = new();
        mon_scb = new();
        
        // create generator and driver
        g0 = new(gen_drive);
        d0 = new(vif, gen_drive);
        m0 = new(vif,mon_scb);
        s0 = new(mon_scb);

    endfunction

    task run();

        d0.reset();

        fork
            d0.run();
            g0.run();
            m0.run();
            s0.run();
        join_any
        
        // wait until all the transactions have been created by the generator 
        wait(g0.done.triggered);
        
        // wait until all transactions have been driver to the DUT
        wait(g0.count == d0.num_transactions);

        $finish;
        
    endtask

endclass