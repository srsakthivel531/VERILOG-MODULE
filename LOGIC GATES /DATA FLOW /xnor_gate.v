//design file
module xnor_data(input a,b,output y);
  assign y=~(a^b);
endmodule

//test bench file
module xnor_data_tb;
  reg a,b;
  wire y;
  xnor_data uut(a,b,y);
  initial 
     begin
       $monitor("Time=%0t  a=%b  b=%b  y=%b", $time, a, b,y);
       a=0;b=0;
       #10 a=0;b=1;
       #10 a=1;b=0;
       #10 a=1;b=1;
       #50 $finish;
      end 
endmodule
