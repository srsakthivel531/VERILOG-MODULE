//design file 
module t_ff(input t,clk,input rst,output reg q);
  always@(posedge clk)
    begin 
    if(rst==1)
      q<=0;
      else 
        case(t)
          0:q<=q;
          1:q<=~q;
          default :q<=0;
        endcase
    end 
endmodule 

//test bench file 
module t_ff_tb;
  reg t,rst,clk;
  wire  q;
  t_ff uut(t,clk,rst,q);
  initial begin 
     clk=1'b1;
  
    forever #5 clk=~clk;
  end 
  initial begin
    $monitor("$time=%0t t=%b clk=%b rst=%b q=%b",$time,t,clk,rst,q);
    rst=1; t=1;
    #5 t=1; rst=0; 
    #5 t=1; rst=0; 
    #5 t=1;  rst=1; 
    #5 t=0; rst=0; 
    #5 t=0; rst=1; 
     #5 t=1; rst=1; 
    #4$finish;
  end 
  initial begin 
    $dumpfile("t_ff.vcd");
    $dumpvars(1,t_ff_tb);
    end 
endmodule
