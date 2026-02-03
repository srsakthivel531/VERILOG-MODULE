//design file
module and_gate(input a,b,output y);
  and a1(y,a,b);
endmodule

//test bench file
module and_gate_tb;
  reg a,b;
  wire y;
  and_gate uut(a,b,y);
  initial 
     begin
      $monitor("Time=%0t  a=%b  b=%b  y=%b", $time, a, b,y);
       a=0;b=0;
       #10 a=0;b=1;
       #10 a=1;b=0;
       #10 a=1;b=1;
       #50 $finish;
       $dumpfile("and_gate.vcd");   
       $dumpvars(0, and_gate_tb); 
     end 
endmodule
