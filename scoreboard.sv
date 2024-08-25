// Scoreboard receives transaction objects from monitor, compares it to the expected result.
class scoreboard;

    mailbox mon_scb; // mailbox between monitor and scoreboard 

    function new(mailbox mon_scb);
    this.mon_scb = mon_scb;
    endfunction

    task run();
        transaciton Stream;
        forever begin

            mon_scb.get(Stream);
            $display("Stream bit = %0b", Stream);
        end
    endtask
endclass