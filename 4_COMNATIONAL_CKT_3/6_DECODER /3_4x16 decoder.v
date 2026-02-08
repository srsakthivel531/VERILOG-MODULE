//design file 
  module decoder_4x16(input [3:0]a,output reg [15:0]y);
  integer i;
  always@ (*)
    begin 
      y=16'b0;
       i=a;
        y[i]=1'b1;
        
    end 
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
    $finish;
  end 
endmodule 
