//design file 
module decoder_2x4(input [1:0]a,input en,output [3:0]y);
 
  assign y=en?(4'b1<<a):(4'b0);
endmodule 

module decoder_3x8(input [3:0]a,output [7:0]y);
  decoder_2x4 d1(a[1:0],~a[2],y[3:0]);
  decoder_2x4 d2(a[1:0],a[2],y[7:4]);
endmodule  

//test bench file 
module decoder_3x8_tb;
  reg [2:0]a;
  wire [7:0]y;
  decoder_3x8 uut(a,y);
  initial begin 
    $monitor("$time=%0t a=%b  y=%b ",$time ,a,y);
    a=3'b0;
    #3 a=3'b1;
    #2 a=3'b10;
    #4 a=3'b11;
    #1  a=3'b100;
    #4 a=3'b101;
    #2 a=3'b110;
    #3 a=3'b111;
   #2 $finish;
  end 
endmodule 
