//design file 
module d_latch(input d,clk,output reg q);
  always@(clk or d)
    begin 
  if(clk)
    q<=d;
    end 
endmodule 

//test bench file 
module d_latch_tb;
  reg d,clk;
  reg q;
  d_latch uut(d,clk,q);
  initial begin 
     clk=1'b0; 
    forever #5 clk=~clk;
  end 
  initial begin
    $monitor("$time=%0t d=%b clk=%b q=%b",$time,d,clk,q);
     d=0;
    #5 d=1;
    #5 d=0;
    #4 d=1;
    #1 d=0;
    #4$finish;
  end 
  initial begin 
    $dumpfile("d_latch.vcd");
    $dumpvars(0,d_latch_tb);
    end 
endmodule
