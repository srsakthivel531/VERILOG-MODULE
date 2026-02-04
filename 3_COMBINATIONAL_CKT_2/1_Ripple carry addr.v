//design file 
module full_adder_gate(input a,b,c,output sum,cout);
  wire c1,c2,c3;
  xor x1(sum,a,b,c);
  and a1(c1,a,b);
  and a2(c2,b,c);
  and a3(c3,a,c);
  or o1(cout,c1,c2,c3);
endmodule


module RCA_4bit(input [3:0]a,b,input c,output [3:0]sum,cout);
 
  full_adder_gate FA1(.sum(sum[0]),.cout(cout[0]),.a(a[0]),.b(b[0]),.c(c));
  full_adder_gate FA2(.sum(sum[1]),.cout(cout[1]),.a(a[1]),.b(b[1]),.c(cout[0]));
  full_adder_gate FA3(.sum(sum[2]),.cout(cout[2]),.a(a[2]),.b(b[2]),.c(cout[1]));          
  full_adder_gate FA4(.sum(sum[3]),.cout(cout[3]),.a(a[3]),.b(b[3]),.c(cout[2])); 
endmodule

//test bench file 
module RCA_4bit_tb;
  reg [3:0]a,b;
  reg c;
  wire [3:0]sum,cout;
  RCA_4bit uut(a,b,c,sum,cout);
  initial 
    begin 
      $monitor("time=%0t a=%b b=%b c=%b sum=%b cout=%b",$time,a,b,c,sum,cout);
      a = 4'b10;b= 4'b10;c=4'b1;#3
      a = 3;b= 4;c=5;#3
      a = 4;b= 12;c=2;
    end 
endmodule 
