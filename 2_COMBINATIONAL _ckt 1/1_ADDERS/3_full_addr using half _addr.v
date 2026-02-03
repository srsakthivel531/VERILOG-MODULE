//design file 
module half_adder_data(input a ,b,output sum,cout);
  assign sum=a^b;
  assign cout=a&b;
endmodule

module full_adder_gate(input a,b,c,output sum,cout);
  wire s1,c1,c2;
  // instantiate
  half_adder_data ha1(.sum(s1),.cout(c1),.a(a),.b(b));
  half_adder_data ha2(.sum(sum),.cout(c2),.a(s1),.b(c));
  or o1(cout,c1,c2);
endmodule

//test bench file 
module full_adder_gate_tb;
  reg A,b,c;
  wire sum,cout;
  full_adder_gate uut(A,b,c,sum,cout);
  initial 
    begin
      $monitor ("time=%0t a=%b b=%b  c=%d sum=%b cout=%b ", $time,A,b,c,sum,cout);
      A=0;b=0;c=0;
      #5 A=0;b=0;c=1;
      #5 A=1;b=1;c=0;
      #5 A=0;b=1;c=1;
      #5 A=1;b=0;c=0;
      #5 A=1;b=0;c=1;
      #5 A=1;b=1;c=0;
      #5 A=1;b=1;c=1;
      #80 $finish;
      end 
endmodule 
