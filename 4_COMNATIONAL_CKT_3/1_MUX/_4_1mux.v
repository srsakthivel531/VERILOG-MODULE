//design file 
module _4_1_data(input [1:0]a,b,c,d,s1,s0,output [1:0]y);
  assign y=s1?(s0?d:c):(s0?b:a);
endmodule 

//test bench file 
module _4_1_data_tb;
  reg [1:0]a,b,c,d;
  reg s0,s1;
  wire y;
  _4_1_data uut(a,b,c,d,s0,s1,y);
  initial 
    begin 
      $monitor("time=%0t s0=%b s1=%b y=%b",$time,s0,s1,y);
      a=2'b00;b=2'b01;c=2'b10;d=2'b11;
      #3 s1=1;s0=1;
       #3 s1=0;s0=1;
       #3 s1=0;s0=0;
    end
endmodule 
