//design file
module not_data(input a,output y);
  assign y=~(a);
endmodule

//test bench file
module not_data_tb;
  reg a;
  wire y;
  not_data uut(a,y);
  initial 
     begin
       $monitor("Time=%0t  a=%b  y=%b", $time, a, y);
       a=0;
       #10 a=1;
       #20 $finish;
      end 
endmodule
