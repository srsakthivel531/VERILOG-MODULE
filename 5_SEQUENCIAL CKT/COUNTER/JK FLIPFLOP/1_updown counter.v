//design file 
// up/down counter 
module jk_ff(input j,k,input clk,rst,output reg q,qbar);
 assign qbar=~q; 
  always@(negedge clk or posedge rst)
    begin
      if(rst==1)
        q<=0;
      else 
        case({j,k})
         2'b11: q<=~q;
        default: q<=0;
      endcase
          end 
endmodule 

module up_downcounter(input [2:0]j,k,input m,input clk,rst,output reg  [2:0]q,qbar);
  wire [1:0]t;
assign t=m?qbar:q;
  jk_ff a1(j[0],k[0],clk,rst,q[0],qbar[0]);
  jk_ff a2(j[1],k[1],t[0],rst,q[1],qbar[1]);
  jk_ff a3(j[2],k[2],t[1],rst,q[2],qbar[2]);
endmodule 

//test bench file 
module up_downcounter_tb;
  reg clk,rst,m;
  reg [2:0]j,k;
  wire [2:0]q,qbar;
  up_downcounter uut(j,k,m,clk,rst,q,qbar);
  initial begin
    $monitor("$time=%0t j=%b k=%b m=%b clk=%b rst=%b q=%b qbar=%b ",$time,j,k,m,clk,q,qbar);
        clk=1'b0;
      forever #5 clk=~clk;
   end 

  initial begin
  
    j=3'b111;k=3'b111;
    rst=1'b1;m=1'b1;
    
    #5 rst=1'b0;
    #70 m=1'b0;rst=1'b1;
    #2 rst=1'b0;
    
    #170 $finish;
  end 
  initial 
    begin
      $dumpfile("up_downcounter.vcd");
      $dumpvars(1,up_downcounter_tb);
   end 
endmodule  
