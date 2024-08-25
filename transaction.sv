class transaction;
rand bit Stream;

    function void display (string name);
      $display("_____## %s ##______", name);
      $display("Stream bit = %b",Stream);
        $display("_____________");
    endfunction

    constraint Stream_1{
        Stream inside {0,1};
    };
    
endclass