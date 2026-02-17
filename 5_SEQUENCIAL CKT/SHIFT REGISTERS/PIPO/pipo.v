//design file 
module pipo(input [3:0]pin,input clk,rst,output reg[3:0]q);
  wire [3:0]d;
assign d=pin;
  always @(posedge clk or posedge rst)
    begin 
      if(rst)
        q<=4'b0;
      else
        q<=d;
        end 
endmodule  
//test bench file 
module pipo_tb;
  reg [3:0] pin; 
  reg rst,clk;
  wire [3:0]q;

  pipo uut(pin,clk,rst,q);
  initial begin 
    $monitor("$time=%0t pin=%b clk=%b rst=%b q=%b ",$time,pin,clk,rst,q);
     clk=1'b0;
    forever #5 clk=~clk;
  end 
  initial 
    begin
      $dumpfile("pipo.vcd");   
      $dumpvars(1,pipo_tb);
        end
  initial begin 
    rst=1'b1;
    pin=4'b1110; 
    #1 rst=1'b0;
     #5 pin=4'b11;
     #10 pin=4'b1010;

   #30 $finish;
  end 
endmodule  
