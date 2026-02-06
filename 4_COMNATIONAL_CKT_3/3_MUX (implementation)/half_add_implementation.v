//design file 
module half_add_mux(input a,b,output sum,cout);
  assign sum=a?~b:b;
  assign cout=a?b:0;
endmodule

//test bench file 
module half_add_mux_tb;
  reg a,b;
  wire sum,cout;
  half_add_mux uut(a,b,sum,cout);
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
