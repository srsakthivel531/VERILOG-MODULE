//desgn file 
module full_sub_data(input a,b,c,diff,bor);
  assign diff=a^b^c;
  assign bor=~(a)&b|~(a)&c|b&c;
endmodule


//test bench file 
module full_sub_data_tb;
  reg a,b,c;
  wire diff,borrow;
  full_sub_data uut(a,b,c,diff,borrow);
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
