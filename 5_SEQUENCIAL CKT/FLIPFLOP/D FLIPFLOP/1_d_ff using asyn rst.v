//design file 
module asyn_ff(input d,clk,rst,output reg q);
  always @(posedge clk or posedge rst)
    begin 
      if (rst==1)
        q<=0;
     
      else 
        q<=d;
    end 
endmodule

//test bench file 
module asyn_ff_tb;
  reg d,clk,rst;
  wire q;
  asyn_ff uut(d,clk,rst,q);
   
     initial 
    begin
      clk=1'b1;
      rst=1'b0;
      forever #5 clk=~clk;
        end 
     
      initial
        begin 
          $monitor("$time=%0t  d=%b clk=%b rst=%d  q=%b",$time,d,clk,rst,q);
         
       d=1;rst=0;
          #2d=1;rst=0;
          #2d=0;rst=0;
          #2d=0;rst=1;
          #2d=1;rst=0;
          
           #5$finish;
          
         end
        initial 
          begin 
          $dumpfile("asyn_ff.vcd");   
            $dumpvars(1, asyn_ff_tb);
        end 
endmodule 
