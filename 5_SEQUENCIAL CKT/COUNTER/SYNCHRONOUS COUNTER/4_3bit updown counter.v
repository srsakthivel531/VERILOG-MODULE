//design file 
//syn 3bit updown counter 
module syn_updowncounter (input clk,rst,mode,output reg [2:0]count);
  always @(negedge clk )
    begin 
      if(rst)
        count<=0;
      else if(mode)
        count<=count - 1;
      else
        count<=count+1;
    end 
endmodule 
//test bench file 
module syn_updowncounter_tb;
  reg clk,rst,mode;
  wire [2:0]count;
  syn_updowncounter uut(clk,rst,mode,count);
  initial begin 
    $monitor ("$time=%0t clk=%b rst=%b mode=%b count=%b ",$time,clk,rst,mode,count);
    clk=1'b0;
    forever #2 clk=~clk;
  end 
  initial 
    begin 
      $dumpfile("file.vcd" );
      $dumpvars(1,syn_updowncounter_tb);
   end 
   initial begin
     rst=1'b1;mode=1'b0; 
     #5 rst=1'b0;
     #24 mode=1;
     #20 mode=0;
     #10 mode=1;
     
     #10 $finish;
   end 
endmodule  
