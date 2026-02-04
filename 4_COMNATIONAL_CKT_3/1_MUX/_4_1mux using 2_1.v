//design file 
module _2_1mux(input a,b,s,output y);
  assign y=s?b:a;
endmodule

//instantiate 
module _4_1mux(input a,b,c,d,s0,s1,output y);
  wire y0,y1;
  _2_1mux m1(a,b,s0,y0);
  _2_1mux m2(c,d,s0,y1);
  _2_1mux m3(y0,y1,s1,y);
endmodule 

//test bench file 
module _4_1mux_tb;
  reg a,b,c,d,s0,s1;
  wire y;
  _4_1mux uut(a,b,c,d,s0,s1,y);
  initial 
    begin 
      $monitor("time=%0t s0=%b s1=%b y=%b",$time,s0,s1,y);
      a=0;b=1;c=0;d=1;
      #3 s1=1;s0=1;
       #3 s1=0;s0=1;
       #3 s1=0;s0=1;
     #20 $finish;
    end
endmodule 
