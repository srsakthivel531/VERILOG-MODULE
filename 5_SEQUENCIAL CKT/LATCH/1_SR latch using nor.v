//design file 
module srlatch_nor(input s,r,output reg q);
 
  always@(s or r)
    begin
       q=1'b0;
      case({s,r})
        2'b00: q<=q;
        2'b01: q<=1'b0;
        2'b10: q<=1'b1;
        2'b11: q<=1'bx;
        default: q<=q;
      endcase
          end 
endmodule 

//test bench file 
module srlatch_nor_tb;
  reg s,r;
  wire q;
  srlatch_nor uut(s,r,q);
  initial begin 
    $monitor("$time=%0t s=%b r=%b q=%b",$time,s,r,q);
    #0 s=0;r=0;
    #10 s=0;r=1;
    #5 s=1;r=0;
    #20 s=1;r=1;
     #50$finish;
      end 
    initial begin 
      $dumpfile("srlatch_nor.vcd");
      $dumpvars(0,srlatch_nor_tb);
    end 
