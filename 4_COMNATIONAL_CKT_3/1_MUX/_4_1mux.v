//design file 
module _4_1_data(input a,b,c,d,s1,s0,output y);
  assign y=s1?(s0?d:c):(s0?b:a);
endmodule 

//test bench file 
module _4_1_data_tb;
  reg a,b,c,d,s0,s1;
  wire y;
  _4_1_data uut(a,b,c,d,s0,s1,y);
  initial 
    begin 
      $monitor("time=%0t a=%b b=%b s0=%b s1=%b y=%b",$time,a,b,s0,s1,y);
      a=0;b=1;c=1;d=1;
      #3 s1=1;s0=1;
       #3 s1=0;s0=1;
       #3 s1=0;s0=0;
    end
endmodule 
