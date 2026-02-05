//design file 
module _2_1mux(input a,b,s,output reg  y);
  always@(*)
    begin
    if(s)
       y = b;
    else
       y = a;
  end
endmodule

//test bench file 
module _2_1mux_tb;
  reg a,b,s;
  wire  y;
  _2_1mux uut(a,b,s,y);
  initial 
    begin 
      $monitor("time=%0t a=%b b=%b s=%b  y=%b",$time,a,b,s,y);
      a=0;b=1;
      #3 s=1;
      #3 s=0;
      #10 $finish;
    end
endmodule 

//DESIGN FILE FOR _4X1 MUX
module _4_1mux(input [1:0]a,b,c,d,input s1,s0,output reg  [1:0]y);
  always@(*)
    begin
      if(s1==1&&s0==1)
       y = d;
      else if(s1==1&&s0==0) 
       y = c;
      else if(s1==0&&s0==1) 
       y=  b;
      else 
        y= a;
  end
endmodule

//TEST BENCH FILE FOR _4X1 MUX
module _4_1mux_tb;
  reg [1:0]a,b,c,d;
  reg s1,s0;
  reg [1:0]y;
  _4_1mux uut(a,b,c,d,s1,s0,y);
  initial 
    begin 
      $monitor("time=%0t s1=%b s0=%b y=%b",$time,s1,s0,y);
      a=2'b00;b=2'b01;c=2'b10;d=2'b11;
      #3 s1=1;s0=0;
       #3 s1=0;s0=1;
       #3 s1=1;s0=0;
       #3 s1=1;s0=1;
       #3 s1=1;s0=0;
      #40 $finish;
    end
endmodule 

    

