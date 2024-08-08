class scoreboard;
    mailbox mon2scb;

// this is the constructor of the scoreboard class
function new(mailbox mon2scb);
 this.mon2scb = mon2scb;
 endfunction

 task main();
 transaction tran;
 repeat(2)
 begin 
    mon2scb.get(tran); // use the mailbox to get the transaction
    tran.display("scoreboard signals");

    // create a golden reference of the DUT
    if(((tran.a ^ tran.b ^ tran.c_in) == tran.sum) && (((tran.a & tran.b) | (tran.b & tran.c_in) | (tran.c_in & tran.a)) == tran.c_out))
        $display("********* PASS *********");
    else
        $display("!!!!!!!!! FAIL !!!!!!!!!");
        $display("Transaction done");
        $display(" ");
 end
 endtask
 endclass