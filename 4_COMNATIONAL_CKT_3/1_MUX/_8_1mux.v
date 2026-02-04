//design file 
module _8_1_data(input a,b,c,d,e,f,g,h,s0,s1,s2,output y);
  assign y=s2?(s1?(s0?h:g):(s0?f:e)):(s1?(s0?d:c):(s0?b:a));
endmodule 

//test bench file 
module _8_1_data_tb;
  reg a,b,c,d,e,f,g,h,s0,s1,s2;
  wire y;
  _8_1_data uut(a,b,c,d,e,f,g,h,s0,s1,s2,y);
 
  initial 
    begin 
      $monitor("time=%0t s0=%b s1=%b s2=%b y=%b ",$time,s0,s1,s2,y);
       a=0;b=1;c=1;d=1;e=1;f=0;g=0;h=1;
       #3 s2=1;s1=1;s0=1;
       #3 s2=1;s1=0;s0=1;
       #3 s2=1; s1=0;s0=0;
    end
endmodule 
