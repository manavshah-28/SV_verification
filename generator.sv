// The generator randomizes the transaciton signals and send to the driver via the mailbox 

class generator;
 transaction tran;

 mailbox gen2drv;

 function new(mailbox gen2drv); // new is a constructor 
 
 // when I camm the consturctor, it creates memory for the generator class
 // and allocates memory for variables and initialise with default values 
 this.gen2drv = gen2drv;
 endfunction

 task main();
    repeat (2)
    begin 
        tran = new();
        tran.randomize();
        tran.display("geerator class signals");
        gen2drv.put(tran);
    end
 endtask
 endclass
