// Driver class receives the generated transaction items from the mailbox
// converts them to signals and drives them to the DUT via the interface 

class driver;

   // creating the virtual interface handle 
   virtual intf vif;

   // creating the mailbox handle
   mailbox gen_drive;

   // variable to count the number of transactions
   int num_transactions;

   function new(virtual intf vif, mailbox gen_drive);
      this.vif = vif;
      this.gen_drive = gen_drive;
   endfunction

   task reset();
      vif.Stream <= 0 ;
   endtask

   task run();
      forever begin
         transaction item;
            gen_drive.get(item);
      @(posedge vif.clk);
      vif.Stream <= item.stream;

      num_transactions++;
      end
   endtask
endclass