//design file 
//SINGLE PORT RAM DESIGN 
//syn read and write 
module ram_64X8 (input clk,rst,wr_en,input [5:0]addr,input [7:0]data_in,output reg  [7:0]data_out);
  reg [7:0]memory[0:63];
  always @(posedge clk or posedge rst)
    begin 
      if(rst)
        begin
        data_out<=0;
      memory[addr]<=0;
        end 
      else if (wr_en)
        memory[addr]<=data_in;
      else 
        data_out<=memory[addr];
    end 
endmodule 
//test bench file 
module ram_64X8_tb;
  reg clk,rst,wr_en;
  reg [5:0]addr;
  reg [7:0]data_in;
  wire [7:0]data_out;
  ram_64X8 uut(clk,rst,wr_en,addr,data_in,data_out);
  initial begin 
    $monitor("$time=%0t clk=%b,rst=%b,wr_en=%b,addr=%b data_in=%d,data_out=%d",$time,clk,rst,wr_en,addr,data_in,data_out);
  clk=1'b0;
    forever #2 clk=~clk;
  end 
  initial begin 
    rst=1;wr_en=1;addr=6'b0;data_in=8'd85;
  
    #2 rst=0;
    #2 addr=6'b111111;data_in=8'd85;
      #4 addr=6'b1010;data_in=8'd80;
      #2 addr=6'b100111;data_in=8'd95;
       #4 addr=6'b111111;data_in=8'd85;
      #2 addr=6'b11010;data_in=8'd66;
      #8 addr=6'b101111;data_in=8'd99;
    #20 wr_en=0;
    #1addr=6'b0;
    #4 addr=6'b11010;
     #4 addr=6'b101111;
     #8 addr=6'b1010;
    #50 $finish;
  end 
  initial begin 
    $dumpfile("file.vcd");
    $dumpvars(1, ram_64X8_tb);
  end 
endmodule 
