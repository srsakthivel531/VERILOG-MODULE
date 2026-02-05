//design file 
module _2_1mux(input a,b,s,output y);
  assign y=s?b:a;
endmodule

//instantiate 
module _4_1mux(input [1:0]a,b,c,d,input s0,s1,output [1:0]y);
  wire [1:0]y0,y1;
  _2_1mux m1(a,b,s0,y0);
  _2_1mux m2(c,d,s0,y1);
  _2_1mux m3(y0,y1,s1,y);
endmodule 

//test bench file 
module _4_1mux_tb;
  reg [1:0]a,b,c,d;
  reg s0,s1;
  wire [1:0]y;
  _4_1mux uut(a,b,c,d,s0,s1,y);
  initial 
    begin 
      $monitor("time=%0t s0=%b s1=%b y=%b",$time,s0,s1,y);
      a=2'b00;b=2'b01;c=2'b10;d=2'b11;
      #3 s1=1;s0=1;
       #3 s1=0;s0=1;
       #3 s1=0;s0=0;
    end
endmodule 
