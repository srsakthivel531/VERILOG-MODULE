//design file
module full_adder_data(input a,b,c,output sum,cout);
  assign sum=a^b^c;
  assign cout=a&b;
endmodule 

//test bench file 
module full_adder_data_tb;
  reg a,b,c;
  wire sum,cout;
  full_adder_data uut(a,b,c,sum,cout);
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
   end 
endmodule
