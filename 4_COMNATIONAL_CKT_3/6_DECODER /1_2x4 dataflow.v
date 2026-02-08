//design file 
module decoder_2x4_tb;
  reg a,b;
  wire [3:0]y;
  decoder_2x4 uut(a,b,y);
  initial begin 
    $monitor("$time =%0t a=%b b=%b y=%b ",$time, a,b,y);
    #3 a=0;b=0;
     #4 a=0;b=1;
     #2 a=1;b=0;
     #5 a=1;b=1;
  end 
endmodule 

//test bench file 
module decoder_2x4_tb;
  reg a,b;
  wire [3:0]y;
  decoder_2x4 uut(a,b,y);
  initial begin 
    $monitor("$time =%0t a=%b b=%b y=%b ",$time, a,b,y);
    #3 a=0;b=0;
     #4 a=0;b=1;
     #2 a=1;b=0;
     #5 a=1;b=1;
  end 
endmodule 
    
