//design file 
module encoder_8x3(input [7:0] a,output reg [2:0]y);

  always@(*)
    begin 
      case(a)
        8'b1: y=3'b0;
        8'b10:y=3'b1;
        8'b100: y=3'b10;
        8'b1000:y=3'b11;
        8'b10000: y=3'b100;
        8'b100000:y=3'b101;
        8'b100000: y=3'b110;
        8'b10000000:y=3'b111;
        default :y=3'b0;
      endcase
    end 
endmodule 

//test bench file 
module encoder_8x3_tb;
  reg [7:0] a;
  wire [2:0]y;
  integer i;
  encoder_8x3 uut(a,y);
 
  initial 
    begin 
      $monitor("$time=%0t a=%b y=%b",$time ,a,y);
       a=8'b1;#2
      for(i=0;i<8;i=i++) begin 
        a=a<<1;
        #3;
        end 
       
      end 
endmodule 
