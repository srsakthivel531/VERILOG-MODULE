//design file 
module siso(input [3:0]sin,input clk,rst,output reg[3:0]q, output reg  sout);
  reg [3:0]d;
  assign d[3]=sin;
  assign d[2]=q[3];
  assign d[1]=q[2];
  assign d[0]=q[1];
  assign sout=q[3];
 always @(posedge clk or posedge rst)
    begin 
      if(rst)
        q<=4'b0;
      else
        q<=d;
        end 
endmodule  

//test bench file 
module siso_tb;
  reg sin, rst,clk;
  wire [3:0]q;
  wire sout;
  siso uut(sin,clk,rst,q,sout);
  initial begin 
    $monitor("$time=%0t sin=%b clk=%b rst=%b q=%b sout=%b",$time,sin,clk,rst,q,sout);
     clk=1'b0;
    forever #5 clk=~clk;
  end 
  initial 
    begin
      $dumpfile("siso.vcd");   
      $dumpvars(1,siso_tb);
        end
  initial begin 
    rst=1'b1;
    sin=1'b1; 
    #1 rst=1'b0;
    #5  sin=1'b1; 
      #5  sin=1'b1;
      #10  sin=1'b0;
      #10  sin=1'b0;
     #10  sin=1'b1;
    #50 $finish;
  end 
endmodule
