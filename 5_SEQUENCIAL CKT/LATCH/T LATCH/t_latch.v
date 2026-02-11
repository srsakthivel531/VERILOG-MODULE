//design file
module t_latch(input t,clk,input rst,output reg q);
  always@(clk or t)
    begin 
      if(rst)
      q<=1'b0;
      else if(clk && t)
      q<=~q;
     end 
endmodule 

//test bench file 
module t_latch_tb;
  reg t,clk,rst;
  wire  q;
  t_latch uut(t,clk,rst,q);
  initial begin 
     clk=1'b0;
  
    forever #5 clk=~clk;
  end 
  initial begin
    $monitor("$time=%0t t=%b clk=%b rst=%b q=%b",$time,t,clk,rst,q);
     t=1;rst=1;
   #2 rst=0;
    #5 t=1;
    #4 t=0;
    #4 t=1;
    #5 t=0;
    #4 t=1;
     #5 t=1;
    #4$finish;
  end 
  initial begin 
    $dumpfile("t_latch.vcd");
    $dumpvars(0,t_latch_tb);
    end 
