//design file 
module _2_1mux(input [2:0]a,b,input s,output [2:0]y);
  assign y=s?b:a;
endmodule

//instantiate 
module _4_1mux(input [2:0]a,b,c,d,input s1,s0,output [2:0]y);
  wire [2:0]y0,y1;
  _2_1mux m1(a,b,s0,y0);
  _2_1mux m2(c,d,s0,y1);
  _2_1mux m3(y0,y1,s1,y);
endmodule 
module _8_1mux(input [2:0] a,b,c,d,e,f,g,h,input s2,s1,s0,output [2:0]y);
  wire [2:0]y0,y1;
  _4_1mux m1(a,b,c,d,s1,s0,y0);
  _4_1mux m2(e,f,g,h,s1,s0,y1);
  _2_1mux m3(y0,y1,s2,y);
endmodule 

//test bench file 
module _8_1mux_tb;
  reg [2:0]a,b,c,d,e,f,g,h;
  reg s0,s1,s2;
  wire [2:0]y;
  _8_1mux uut(a,b,c,d,e,f,g,h,s2,s1,s0,y);
 
  initial 
    begin 
      $monitor("time=%0t s0=%b s1=%b s2=%b y=%b ",$time,s0,s1,s2,y);
       a=3'b000;b=3'b001;c=3'b0010;d=3'b0011;e=3'b100;f=3'b101;g=3'b110;h=3'b111;

       #3 s0=1;s1=1;s2=1;
       #3 s0=1;s1=0;s2=1;
       #3 s0=1; s1=0;s2=0;
    end
endmodule
