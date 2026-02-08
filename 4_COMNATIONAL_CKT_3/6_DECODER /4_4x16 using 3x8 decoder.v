//design file 
module decoder_3x8(input [2:0]a,input en,output [7:0]y);
 
  assign y=en?(8'b1<<a):(8'b0);
endmodule 
//instantiate
module decoder_4x16(input [3:0]a,output [15:0]y);
  decoder_3x8 d1(a[2:0],~a[3],y[7:0]);
  decoder_3x8 d2(a[2:0],a[3],y[15:8]);
endmodule  

//test bench file 
module decoder_4x16_tb;
  reg [3:0]a;
  wire [15:0]y;
decoder_4x16 uut(a,y);
  initial begin 
$monitor("$time=%0t a=%b y=%b ",$time,a,y);
 a=4'b0;
  #2 a=4'b1;
  #2 a=4'b10;
  #2 a=4'b11;
  #4 a=4'b100;
  #2 a=4'b101;
  #2 a=4'b1111;
  #2 a=4'b1001;
  #2 a=4'b1101;
    #2 a=4'b0111; 
      #2 a=4'b1110;
    #4 $finish;
  end 
endmodule 
