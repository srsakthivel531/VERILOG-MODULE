//design file
module not_gate(input a,output y);
  not n1(y,a);
endmodule

//test bench file
module not_gate_tb;
  reg a;
  wire y;
  not_gate uut(a,y);
  initial 
     begin
      $monitor("Time=%0t  a=%b  y=%b", $time, a, y);
       a=0;
       #5 a=1;
       #20 $finish;
      end 
endmodule
