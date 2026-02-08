//design file 
module decoder_3x8(input a,b,c,output reg [7:0]y);
    integer i;
  always@ (*)
    begin 
      i={a,b,c};
      case(i)
        0: y=8'b1;
        1: y=8'b1<<1;
        2: y=8'b1<<2;
        3: y=8'b1<<3;
        4:y=8'b1<<4;
        5:y=8'b1<<5;
        6:y=8'b1<<6;
        7:y=8'b1<<7;
      endcase
    end 
 endmodule  

//test bench file 
module decoder_3x8_tb;
  reg a,b,c;
  wire [7:0]y;
  decoder_3x8 uut(a,b,c,y);
  initial begin 
    $monitor("$time=%0t a=%b  b=%b c=%b y=%b ",$time ,a,b,c,y);
    a=0;b=0;c=0;
    #3 a=0;b=0;c=1;
    #2 a=0;b=1;c=0;
    #4 a=0;b=1;c=1;
    #1 a=1;b=0;c=0;
    #4 a=1;b=0;c=1;
    #2 a=1;b=1;c=0;
    #3 a=1;b=1;c=1;
    $finish;
  end 
endmodule 
