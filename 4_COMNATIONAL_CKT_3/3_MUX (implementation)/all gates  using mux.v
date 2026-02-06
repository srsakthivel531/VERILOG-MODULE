//design file 
module or_mux(input a,b,output y);
  assign y=a?1:b;
endmodule
//xor gate 
module xor_mux(input a,b,output y);
  assign y=a?~b:b;
endmodule 
//xnor gate 
module xnor_mux(input a,b,output y);
  assign y=a?b:~b;
endmodule 
//nand gate 
module nand_mux(input a,b,output y);
  assign y=a?~b:1;
endmodule
//nor gate 
module nor_mux(input a,b,output y);
  assign y=a?0:~b;
endmodule
//and gate 
module and_mux(input a,b,output y);
  assign y=a?b:0;
endmodule

//Test bench file 
//N= gate name 
module N_mux_tb;
  reg a,b;
  wire y;
  N_mux uut(a,b,y);
  initial 
     begin
      $monitor("Time=%0t  a=%b  b=%b  y=%b", $time, a, b,y);
       a=0;b=0;
       #2 a=0;b=1;
       #3 a=1;b=0;
       #4 a=1;b=1;
       #5 $finish;
      end 
   
endmodule
