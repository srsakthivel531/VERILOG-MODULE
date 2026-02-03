//design file
module full_adder_gate(input a,b,c,output sum,cout);
  wire c1,c2,c3;
  xor x1(sum,a,b,c);
  and a1(c1,a,b);
  and a2(c2,b,c);
  and a3(c3,a,c);
  or o1(cout,c1,c2,c3);
endmodule

//test bench file
module full_adder_gate_tb;
  reg a,b,c;
  wire sum,cout;
  full_adder_gate uut(a,b,c,sum,cout);
  initial 
    begin
      $monitor ("time=%0t a=%b b=%b  c=%d sum=%b cout=%b ", $time,a,b,c,sum,cout);
      a=0;b=0;c=0;
      #5 a=0;b=0;c=1;
      #5 a=1;b=1;c=0;
      #5 a=0;b=1;c=1;
      #5 a=1;b=0;c=0;
      #5 a=1;b=0;c=1;
      #5 a=1;b=1;c=0;
      #5 a=1;b=1;c=1;
      #80 $finish;
      $dumpfile("full_adder_gate.vcd");   
      $dumpvars(0, full_adder_gate_tb); 
    end 
endmodule
