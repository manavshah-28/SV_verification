// monitor converts signal activity to transaction level objects

class monitor;

    virtual intf vif;

    mailbox mon_scb;

    function new(virtual intf vif, mailbox mon_scb);
        this.vif = vif;
        this.mon_scb = mon_scb;
    endfunction

    task run();
     forever begin
        transaction Stream_in;
        Stream_in = new();

        @(posedge vif.clk);
        Stream_in.Stream = vif.Stream;

        mon_scb.put(Stream_in);
     end
    endtask
endclass