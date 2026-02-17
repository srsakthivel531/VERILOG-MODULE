//design file 
module asyn_downcounter(input clk,rst,output reg [3:0]q,output [3:0] qbar);
assign qbar=~q; 
  always@ (posedge clk or posedge rst)   
    begin 
    if(rst)
      q[0]<=1'b0;
  else 
    q[0]<=qbar[0];
  end 
  always@ (posedge q[0] or posedge rst)   
    begin 
       if(rst)
    q[1]<=1'b0;
  else 
    q[1]<=qbar[1];
  end  

  always@ (posedge q[1] or posedge rst)    
    begin 
       if(rst)
         q[2]<=1'b0;
  else 
    q[2]<=qbar[2];
  end  

  always@ (posedge q[2] or posedge rst)
    begin 
       if(rst)
         q[3]<=1'b0;
  else 
    q[3]<=qbar[3];
  end  
endmodule

//test bench file 
module asyn_downcounter_tb;
  reg clk,rst;
  wire [3:0]q;
  wire [3:0]qbar;
  asyn_downcounter  uut(clk,rst,q,qbar);
  initial begin 
    $monitor("$time=%0t clk=%b rst=%b q=%h qbar=%h",$time,clk,rst,q,qbar);
    clk=1'b0;
    forever #5 clk=~clk;
  end 
  initial 
    begin
          $dumpfile("asyn_ff.vcd");   
      $dumpvars(1, asyn_downcounter_tb);
        end
  initial begin 
    rst=1'b1;
    #1 rst=1'b0;

    #180 $finish;
  end 
endmodule    
