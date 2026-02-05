//design file 
module _2_1mux(input a,b,s,output y);
  assign y=s?b:a;
endmodule

//design file 
module _2_1mux_tb;
  reg a,b,s;
  wire y;
  _2_1mux uut(a,b,s,y);
  initial 
    begin 
      $monitor("time=%0t a=%b b=%b s=%b  y=%b",$time,a,b,s,y);
      a=0;b=1;
      #3 s=1;
      #3 s=0;
    end
endmodule 
