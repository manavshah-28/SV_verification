//The stream of bits is given to the input pin labeled 'Stream'. The Tone is supposed to be logic high when the last bit of the sequence 101001 is properly detected.
//The output Count is a counter to keep on incrementing the number of detected sequences.

module FSM
  (
    input wire Stream,
    output wire Tone
  );
  
  localparam S0 = 3'b000,
             S1 = 3'b001,
             S2 = 3'b010,
             S3 = 3'b011,
             S4 = 3'b100,  
             S5 = 3'b101,
             S6 = 3'b010;
  
  reg [2:0] cur_state,nxt_state; // 3 bit registers
  reg [2:0] count;
  initial begin 
    cur_state = 3'b000;
    nxt_state = 3'b000;
    Tone = 1'b0;
  end
  
  always @(Stream)begin
  cur_state <= nxt_state;  
  end
  
  always @(Stream)begin
    case(cur_state)
      S0: begin
        if(Stream == 1'b1)begin 
          nxt_state <= S1;
        end
        else nxt_state <= S0;
      end
      
      S1: begin
        if(Stream == 1'b0)begin
          nxt_state <= S2;
          else nxt_state <= S1;
      end
      end
      S2: begin
        if(Stream == 1'b1)begin
          nxt_state <= S3;
        end
        else nxt_state <= S0;
      end
        
      S3: begin
        if(Stream == 1'b0)begin
          nxt_state <= S4;
        end
        else nxt_state <= S1;
      end
        
      S4: begin
        if(Stream == 1'b0)begin
          nxt_state <= S5;
        end
        else nxt_state <= S3;
      end  
      S5: begin
        if(Stream == 1'b1)begin
          nxt_state <= S1;
        end
        else nxt_state <= S0;
      end  
      default:nxt_state <=S0;
    endcase
  end

  always @(cur_state)begin
    if(cur_state ==  3'b101)begin
      Tone <= 1'b1;
    end
    else Tone <= 1'b0;
  end
endmodule      