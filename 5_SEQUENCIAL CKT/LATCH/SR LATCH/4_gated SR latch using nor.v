//design file 
module srlatch_nor(input s,r,input clk,output reg q);

  always@(s or r or clk)
    begin
   
      if (clk)
      case({s,r})
        2'b00: q<=q;
        2'b01: q<=1'b0;
        2'b10: q<=1'b1;
        2'b11: q<=1'bx;
        default: q<=0;
      endcase
          end 
endmodule 

//test benchfile 
module srlatch_nor_tb;
  reg s,r,clk;
  wire q;
  srlatch_nor uut(s,r,clk,q);
  initial begin 
     clk=1'b0; 
    forever #5 clk=~clk;
  end 
  initial begin 
    $monitor("$time=%0t s=%b r=%b  clk=%b  q=%b",$time,s,r,clk,q);
    s=0;r=1;
     #5 s=0;r=0;
    #5 s=0;r=1;
    #5 s=1;r=0;
    #5  s=1;r=1;
     #10$finish;
      end 
    initial begin 
      $dumpfile("srlatch_nor.vcd");
      $dumpvars(0,srlatch_nor_tb);
    end 
endmodule 
