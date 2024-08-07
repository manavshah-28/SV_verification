class transaction;
rand bit a;
rand bit b;
rand bit c;

bit sum;
bit c_out;

    function void display (string name);
        $display("_____%s______", name);
        $display("a = %0b, b = %0b, c = %0b, sum = %0b, c_out =%0b", a,b,c_in,sum,c_out);
        $display("_____________");
    endfunction
    
endclass
