//design file 
module mealy_over(input x,clk,rst,output reg q);
  reg [1:0]state;
  parameter s0=2'b0,s1=2'b1,s2=2'b10,s3=2'b11;
  always @(posedge clk or posedge rst)
    begin 
      if(rst)
        begin 
        state<=s0;
        q<=1'b0;
        end 
      else 
        begin 
        case(state)
          s0:state<=x?s1:s0;
          s1:state<=x?s2:s0; 
          s2:state<=x?s2:s3;
          s3:state<=x?s1:s0;
          default : state<=s0;
        endcase 
        end 
    end 
  always @(posedge clk )
    begin 
    if(state==s3 && x==1)
      q<=1'b1;
    else
      q<=1'b0;
  end 
endmodule 

//test bench file 
module mealy_over_tb;
  reg x,clk,rst;
  wire q;
  mealy_over uut(x,clk,rst,q);
  initial 
    begin
      $dumpfile("fsm.vcd");   
      $dumpvars(1, mealy_over_tb);
    end 
   initial begin 
     $monitor("$time=%0t x=%b clk=%b rst=%b q=%b ",$time,x,clk,rst,q);
     clk=1'b0;
    forever #1 clk=~clk;
  end 
 initial begin 
   rst=1'b1;x=1;
   #1 rst=1'b0;
   #1 x=1;
   #1 x=1;
   #1 x=0;
   #1 x=1;
   #1 x=0;
   #1 x=1;
   #1 x=1;
    #1 x=0;
   #1 x=1;
   #1 x=1;
    #2 x=1;
   #2 x=0;
   #2 x=1;
   #2 x=1;
    #2 x=0;
   #2 x=1;
  
   

   #20 $finish;
 end 
endmodule 

  
