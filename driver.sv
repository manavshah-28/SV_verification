// Driver : take the mailbox data (data was sent here from the generator) and pass it to the DUT via the Interface

class driver;
virtual itnf vif; // intf is the interface name, vif is the interface handle 
mailbox gen2drv;

// interface is of static type so virtual interface has to be used here 
// since all classes are dynamic components 
// vif points to actual interface 
function new (virtual intf vif, mailbox gen2drv);
constructor
 this.vif = vif;
 this.gen2drv = gen2drv;
 endfunction

 task main();
 repeat(2);
 begin
    transaciton tran;
    gen2drv.get(tran); // get the data from the mailbox (transaction packet)

    vif.a <= tran.a;
    vif.b <= tran.b;
    vif.c_in <= tran.c_in;
    #1;
    tran.display("driver class signals"); //signals from the class driver
 end
 endtask
 endclass




