class transaction;
rand bit Stream;

    function void display (string name);
        $display("_____%s______", name);
        $display("Stream bit = %0b",Stream);
        $display("_____________");
    endfunction

    constraint Stream_1{
        Stream inside {0,1};
    };
    
endclass