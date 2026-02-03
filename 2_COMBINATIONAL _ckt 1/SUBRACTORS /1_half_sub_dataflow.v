//design file 
module half_sub_data(input a,b,output diff,borrow);
  assign diff=a^b;
  assign borrow=~(a)&b;
endmodule 

//Test bench file 
module half_sub_data_tb;
  reg a,b;
  wire diff,borrow;
  half_sub_data uut(a,b,diff,borrow);
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
