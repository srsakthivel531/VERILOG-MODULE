//design file 
module universal_shift(input signed [3:0]a,input [2:0]b,input [1:0]mode,output reg signed [3:0]y);
  always@(*)
    begin 
      case(mode)
        2'b00:y=a>>>1;
        2'b01:y=b>>1;
        2'b10:y=b<<1;
        2'b11:y=b<<<1;
        default :y=4'b0;
      endcase 
    end 
endmodule 

//test bench file 
module universal_shift_tb;
  reg signed [3:0]a;
  reg [2:0]b;
  reg [1:0]mode;
  wire signed [3:0]y;
  universal_shift uut(a,b,mode,y);
  initial begin 
    $monitor("$time=%0t a=%b b=%b mode=%b y=%b",$time,a,b,mode,y);
    
  #0 mode=2'b00;a=4'b1001;
    #2 mode=2'b01;b=3'b101;
  #1 mode=2'b10;b=3'b101;
    #1 mode=2'b11;b=3'b101;
    #1 $finish;
  end 
endmodule 
