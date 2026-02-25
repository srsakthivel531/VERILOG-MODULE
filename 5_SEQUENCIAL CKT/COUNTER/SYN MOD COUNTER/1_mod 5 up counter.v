//design file 

module mod_5counter(input clk,rst,output reg [2:0]count);
  always @(posedge clk)
    begin
      if(rst) 
       count<=0;
      else if(count==4)
          count<=3'b0;
      else
        count<=count+1;

    end   
endmodule 
//test bench file 
module modcounter_tb;
  reg clk,rst;
  wire [2:0]count;
  mod_5counter uut(clk,rst,count);
  initial begin 
    $monitor ("$time=%0t clk=%b rst=%b count=%b ",$time,clk,rst,count);
    clk=1'b0;
    forever #2 clk=~clk;
  end 
  initial 
    begin 
      $dumpfile("file.vcd" );
      $dumpvars(1,modcounter_tb);
   end 
   initial begin
     rst=1'b1; 
     #5 rst=1'b0;
     #50 $finish;
   end 
endmodule 
