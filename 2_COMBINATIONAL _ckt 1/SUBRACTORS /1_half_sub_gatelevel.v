//design file 
module half_sub_gate(input a,b,output diff,borrow);
  wire c;
  xor x1 (diff,a,b);
  not n1(c,a);
  and a1(borrow,c,b);
endmodule

//test bench file 
module half_sub_gate_tb;
  reg a,b;
  wire diff,borrow;
  half_sub_gate uut(a,b,diff,borrow);
  initial 
    begin
      $monitor ("time=%0t a=%b b=%b  diff=%b borrow=%b ", $time,a,b,diff,borrow);
      a=0;b=0;
      #5 a=0;b=1;
      #5 a=1;b=0;
      #5 a=1;b=1;
      #50 $finish;
    end 
endmodule
