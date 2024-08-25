// The generator randomizes the transaciton signals and send to the driver via the mailbox 

class generator;

// declaring the transaction object as rand to randomize it.
 rand transaction Stream;

// declaring the mailbox
 mailbox gen_drive;

// declaring an event
 event done;

// count variable to control the number of times transactions need to be generated.
 int count;

 function new(mailbox gen_drive); // new is a constructor 
 // when I camm the consturctor, it creates memory for the generator class
 // and allocates memory for variables and initialise with default values 
    this.gen_drive = gen_drive;
 endfunction


// main task to randomize the transaction and send it to the mailbox
    task run();
        $display("Count: %0d", count);
        repeat(count)
        begin
            Stream = new();
            if(!Stream.randomize()) $fatal("Gen :: data randomize failed");
            Stream.display("Generator");
            // put the created transaction item into the mailbox 
            gen_drive.put(Stream);
        end
        // triger the event once all the transactions have been created successfully
        ->done;
    endtask
 endclass