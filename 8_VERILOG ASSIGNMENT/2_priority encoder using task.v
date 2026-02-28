//design file 
module priority_encoder_task(input [3:0]a,output reg [1:0]y,output reg  valid);
  task encoder;
    input [3:0]x;
    output [1:0]z;
    output v;
    begin
    casez(x)
      4'b1???:begin z=2'b11;v=1;end
      4'b01??:begin z=2'b10;v=1;end 
      4'b001?:begin z=2'b01;v=1;end 
      4'b0001:begin z=2'b00;v=1;end 
      default:begin z=2'bxx;v=0;end 
    endcase 
    end 
  endtask 
  always @(*)begin 
    encoder(a,y,valid );
  end 
endmodule 
//test bench file 
module pri_encoder_tb;
   reg [3:0]a;
  wire [1:0]y;
   wire valid;
   priority_encoder_task uut(a,y,valid);
  initial 
    begin 
      $monitor("$time=%0t a=%b y=%b valid=%b",$time,a,y,valid);
       a=4'b1000;
      #2 a=4'b0110;
       #2 a=4'b0011;
       #2 a=4'b0001;
      #2 a=4'b0;
      $finish;
    end 
endmodule
