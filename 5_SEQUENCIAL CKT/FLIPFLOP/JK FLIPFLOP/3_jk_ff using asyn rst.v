//design file 
module jk_ff(input j,k,input rst,input clk,output reg q);
  
  always@(posedge clk or posedge rst)
    begin
      if(rst==1)
        q<=0;
      else 
        case({j,k})
        2'b00: q<=q;
        2'b01: q<=1'b0;
        2'b10: q<=1'b1;
        2'b11: q<=~q;
        default: q<=0;
      endcase
          end 
endmodule 

//test bench file 
module jk_ff_tb;
  reg j,k,rst,clk;
  wire q;
  jk_ff uut(j,k,rst,clk,q);
  initial begin 
     clk=1'b1; 
    forever #5 clk=~clk;
  end 
  initial begin 
    $monitor("$time=%0t j=%b  k=%b rst=%b clk=%b  q=%b",$time,j,k,rst,clk,q);
   
    rst=0;j=1;k=0;
    #5 rst=0; j=0;k=0;
    #5 rst=1;j=1;k=0;
    #5  rst=0;j=1;k=0;
    #5 rst=0;j=0;k=1;
    #5 rst=0;j=0;k=0;
    #5  rst=0;j=1;k=1;
    
     #10$finish;
      end 
    initial begin 
      $dumpfile("jk_ff.vcd");
      $dumpvars(1,jk_ff_tb);
    end 
endmodule 
