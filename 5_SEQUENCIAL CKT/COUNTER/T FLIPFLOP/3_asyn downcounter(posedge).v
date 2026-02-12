//design file 
module t_ff(input t,clk,input rst,output reg q);
  always@(posedge clk or posedge rst)
    begin 
    if(rst)
      q<=0;
      else 
        begin
        case(t)
          0:q<=q;
          1:q<=~q;
          default :q<=0;
        endcase
        end 
    end 
endmodule 
module asyn_upcounter(input [2:0]t,input clk,rst,output reg [2:0]q);
 
  t_ff t1(t[0],clk,rst,q[0]);
  t_ff t2(t[1],q[0],rst,q[1]);
  t_ff t3(t[2],q[1],rst,q[2]);
endmodule 
//test bench file 
module t_ff_tb;
  reg [2:0]t;
  reg clk,rst;
  wire [2:0]q;
  asyn_upcounter uut(t,clk,rst,q);
 
  initial 
    begin 
      $monitor ("$time=%0t t=%b clk=%b rst=%b q=%b",$time,t,clk,rst,q);
      clk=1'b0;
      forever #5 clk=~clk;
     
  end 

  initial begin
  
    t=3'b111;
    rst=1'b1;
    
    #5 rst=1'b0;
    #75 $finish;
  end 
  initial 
    begin
      $dumpfile("tvk.vcd");
      $dumpvars(1,t_ff_tb);
   
    end 
endmodule 
