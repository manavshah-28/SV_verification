// Monitor : gets information from DUT

class monitor;

virtual intf vif;
mailbox mon2scb; // mailbox betwwen monitor and scoreboard 

function new(virtual intf vif,mailbox mon2scb);
this.vif=vif;
this.mon2scb = mon2scb;
endfunction
task main();
repeat(2);
#1;
begin
    transaciton tran;
    tran = new(); // constructor, creating object of class transaction
    
    //sampling the data here
    tran.a = vif.a;
    tran.b = vif.b;
    tran.c_in = vif.c_in;

    tran.sum = vif.sum;
    tran.c_out = vif.c_out;

    mon2scb.put(tran); // put the data recieved from the DUT into the mailbox
    tran.display("monitor class signals");
end
endtask
endclass


