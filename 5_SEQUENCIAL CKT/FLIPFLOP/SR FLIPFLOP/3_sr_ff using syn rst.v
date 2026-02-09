//design file 
module sr_ff(input s,r,input rst,input clk,output reg q);
  
  always@(posedge clk )
    begin
      if(rst==1)
        q<=0;
      else 
   case({s,r})
        2'b00: q<=q;
        2'b01: q<=1'b0;
        2'b10: q<=1'b1;
        2'b11: q<=1'bx;
        default: q<=0;
      endcase
          end 
endmodule 

//test bench file 
module sr_ff_tb;
  reg s,r,rst,clk;
  wire q;
  sr_ff uut(s,r,rst,clk,q);
  initial begin 
     clk=1'b0; 
    forever #5 clk=~clk;
  end 
  initial begin 
    $monitor("$time=%0t s=%b  r=%b rst=%b clk=%b  q=%b",$time,s,r,rst,clk,q);
   
    rst=1;s=0;r=0;
    #5 rst=1; s=1;r=0;
    #5 rst=0;s=1;r=0;
    #5  rst=0;s=1;r=0;
    #5 rst=1;s=0;r=1;
    #5 rst=0;s=0;r=0;
    #5  rst=1;s=1;r=1;
    
     #10$finish;
      end 
    initial begin 
      $dumpfile("sr_ff.vcd");
      $dumpvars(1,sr_ff_tb);
    end 
endmodule 
