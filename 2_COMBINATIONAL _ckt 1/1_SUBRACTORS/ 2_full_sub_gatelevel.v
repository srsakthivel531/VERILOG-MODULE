//design file 
module full_sub_gate(input a,b,c,output diff, borrow );
  wire c1,c2,c3,c4;
  xor x1(diff,a,b,c);
  not n1(c1,a);
  and a1(c2,c1,b);
  and a2(c3,c1,c);
  and a3(c4,b,c);
  or  o1(borrow,c2,c3,c4);
endmodule

//test bench file 
module full_sub_gate_tb;
  reg a,b,c;
  wire diff,borrow;
  full_sub_gate uut(a,b,c,diff,borrow);
  initial 
    begin
      $monitor ("time=%0t a=%b b=%b  c=%d diff=%b borrow=%b ", $time,a,b,c,diff,borrow);
      a=0;b=0;c=0;
      #5 a=0;b=0;c=1;
      #5 a=0;b=1;c=0;
      #5 a=0;b=1;c=1;
      #5 a=1;b=0;c=0;
      #5 a=1;b=0;c=1;
      #5 a=1;b=1;c=0;
      #5 a=1;b=1;c=1;
      #80 $finish;
    end 
endmodule
