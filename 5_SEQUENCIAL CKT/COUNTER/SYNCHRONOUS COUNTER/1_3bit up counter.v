//design file 
//syn 3bit up counter 
module syn_upcounter (input clk,rst,output reg [2:0]count);
  always @(posedge clk )
    begin 
      if(rst)
        count<=0;
      else 
        count<=count + 1;
    end 
endmodule 
//test bench file 
module syn_upcounter_tb;
  reg clk,rst;
  wire [2:0]count;
  syn_upcounter uut(clk,rst,count);
  initial begin 
    $monitor ("$time=%0t clk=%b rst=%b count=%b ",$time,clk,rst,count);
    clk=1'b0;
    forever #2 clk=~clk;
  end 
  initial 
    begin 
      $dumpfile("file.vcd" );
    $dumpvars(1,syn_upcounter_tb);
   end 
   initial begin
     rst=1'b1; 
     #5 rst=1'b0;
     #100 $finish;
   end 
endmodule
    
