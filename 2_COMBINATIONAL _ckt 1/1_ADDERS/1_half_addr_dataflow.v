//design file 
module half_adder_data(input a ,b,output sum,cout);
  assign sum=a^b;
  assign cout=a&b;
endmodule

//test bench file
module half_adder_data_tb;
  reg a,b;
  wire sum,cout;
  half_adder_data uut(a,b,sum,cout);
  initial 
    begin
      $monitor ("time=%0t a=%b b=%b  sum=%b cout=%b ", $time,a,b,sum,cout);
      a=0;b=0;
      #5 a=0;b=1;
      #5 a=1;b=0;
      #5 a=1;b=1;
      #50 $finish;
    end 
endmodule
