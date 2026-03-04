//design file 
module prio_encoder(input [7:0]a,output reg [2:0]y,output reg v);
  always@(a)begin 
    casez(a)
      8'b1???????:begin 
        y=3'b111;v=1;
      end 
      8'b01??????: begin 
        y=3'b110;v=1;
      end 
      8'b001?????: begin 
      y=3'b101;v=1;
      end 
      8'b0001????: begin 
        y=3'b100;v=1;
      end 
      8'b00001???:begin 
        y=3'b011;v=1;
      end 
      8'b000001??:begin 
        y=3'b10;v=1;
      end 
      8'b0000001?:begin 
        y=3'b1;v=1;
      end 
      8'b00000001:begin 
        y=3'b0;v=1;
      end 
      default: begin y=3'bxxx;v=0;
      end
    endcase
  end 
endmodule
//test bench file 
module tb;
  reg [7:0]a;
  wire [2:0]y;
  wire v;
  prio_encoder uut(a,y,v);
  initial begin 
    $monitor("$time=%0t a=%b y=%b v=%b ", $time,a,y,v);
  end 
   initial begin 
     a=8'b0;
     #2a=8'b10000000;
      #2a=8'b01000001;
      #2a=8'b00100000;
      #2a=8'b00010101;
      #2a=8'b00001001;
      #2a=8'b00000100;
      #2a=8'b00000010;
      #2a=8'b00000001;
      #4 $finish;
   end
endmodule
