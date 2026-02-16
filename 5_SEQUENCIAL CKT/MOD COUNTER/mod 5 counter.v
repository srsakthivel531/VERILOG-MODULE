//design file 
module t_ff(input t,clk,input rst,output reg q);

  always@(negedge clk or posedge rst)
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
module mod5_upcounter(input [2:0]t,input clk,rst,output reg [2:0]q);
wire clr;
  assign clr= rst|q[2]& q[0];
  //instantiate 
  t_ff t1(t[0],clk,clr,q[0]);
  t_ff t2(t[1],q[0],clr,q[1]);
  t_ff t3(t[2],q[1],clr,q[2]);
endmodule

//test bench file 
module mod5_upcounter_tb;
  reg [2:0]t;
  reg clk,rst;
  wire [2:0]q;
  mod5_upcounter uut(t,clk,rst,q);
 
  initial 
    begin 
      $monitor ("$time=%0t t=%b clk=%b rst=%b q=%b",$time,t,clk,rst,q);
      clk=1'b1;
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
      $dumpvars(1,mod5_upcounter_tb);
   
    end 
endmodule
