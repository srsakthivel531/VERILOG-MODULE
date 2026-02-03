//design file 
module half_sub_gate(input a,b,output diff,borrow);
  wire c1;
  xor x1(diff,a,b);
  not n1(c1,a);
  and a1(borrow,c1,b);
endmodule 

module full_sub_gate(input a,b,c,output diff,borrow);
  wire d1,b1,b2;
//instantiate 
 half_sub_gate hs1(.diff(d1),.borrow(b1),.a(a),.b(b));
 half_sub_gate hs2(.diff(diff),.borrow(b2),.a(d1),.b(c));
  or o1(borrow,b1,b2);
endmodule

//test bench file 
module full_sub_gate_tb;
  reg a,b,c;
  wire diff,borrow;
  full_sub_gate uut(a,b,c,diff,borrow);
  initial 
    begin 
      $monitor("time=%0t a=%b b=%b c=%b diff=%b borrow=%b ",$time,a,b,c,diff,borrow);
      a=0;b=0;c=0;
      #5 a=0;b=0;c=1;
      #5 a=0;b=1;c=0;
      #5 a=0;b=1;c=1;
      #5 a=1;b=0;c=0;
      #5 a=1;b=0;c=1;
      #5 a=1;b=1;c=0;
      #5 a=1;b=1;c=1;
      #70 $finish;
    end 
endmodule 
