//design file 
module syn_ff(input d,clk,rst,output reg q);
  always @(posedge clk)
    begin 
      if (rst==1)
        q<=0;
      else 
        q<=d;
    end 
endmodule

//test bench file 
module syn_ff_tb;
  reg d,clk,rst;
  wire q;
  syn_ff uut(d,clk,rst,q);
   
     initial 
    begin
      clk=1'b1;
    forever #5 clk=~clk;
        end 
     
      initial
        begin 
          $monitor("$time=%0t  d=%b clk=%b q=%b",$time,d,clk,q);
         d=0;rst=0;
      #5 d=1;rst=1;
      #5 d=1;rst=0;
      #5 d=0;rst=0;
   
        
          $dumpfile("syn_ff.vcd");   
          $dumpvars(0, syn_ff_tb);
          #20$finish;
         end 
endmodule 
