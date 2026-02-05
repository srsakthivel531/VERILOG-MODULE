//design file 
module _8_1_data(input [2:0] a,b,c,d,e,f,g,h,input s0,s1,s2,output [2:0] y);
  assign y=s2?(s1?(s0?h:g):(s0?f:e)):(s1?(s0?d:c):(s0?b:a));
endmodule 

//test bench file 
module _8_1_data_tb;
  reg [2:0]a,b,c,d,e,f,g,h;
  reg s0,s1,s2;
  wire [2:0]y;
  _8_1_data uut(a,b,c,d,e,f,g,h,s0,s1,s2,y);
 
  initial 
    begin 
      $monitor("time=%0t s0=%b s1=%b s2=%b y=%b ",$time,s0,s1,s2,y);
       a=3'b000;b=3'b001;c=3'b0010;d=3'b0011;e=3'b100;f=3'b101;g=3'b110;h=3'b111;

       #3 s2=1;s1=1;s0=1;
       #3 s2=1;s1=0;s0=1;
       #3 s2=1; s1=0;s0=0;
    end
endmodule 
