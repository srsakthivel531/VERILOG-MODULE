//design file 
//syn fifo 8x8
module fifo(input clk,rst,wr_en,rd_en,input [7:0] data_in,output reg [7:0]data_out ,output full,empty);
  reg [3:0]wr_ptr,rd_ptr;
  reg [7:0]mem[0:7];
 always @(posedge clk or posedge rst)
begin 
  if(rst)
  begin 
    wr_ptr <= 0;
    rd_ptr <= 0;
    data_out <= 0;
  end
  else
  begin
    if(wr_en && !full)
    begin 
      mem[wr_ptr] <= data_in;
      wr_ptr <= wr_ptr + 1;
    end 
   else 
     wr_ptr<=wr_ptr;
    
   if(rd_en && !empty)
    begin 
      data_out <= mem[rd_ptr];
      rd_ptr <= rd_ptr + 1;
    end
    else 
      rd_ptr<=rd_ptr;
  end
end
assign full=(wr_ptr[3]!=rd_ptr[3] && wr_ptr[2:0]==rd_ptr[2:0]);
assign empty =(wr_ptr==rd_ptr);
endmodule 
//test bench file
module fifo_tb;
  reg clk,rst,wr_en,rd_en;
  reg [7:0] data_in;
  wire [7:0]data_out;
 wire full,empty;
  fifo uut(clk,rst,wr_en,rd_en,data_in,data_out,full,empty);
  initial begin 
    clk=1'b0;
    forever #5 clk=~clk;
  end 
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,fifo_tb);
  end 

initial begin
rst = 1; wr_en = 0; rd_en = 0; data_in = 0;
#12 rst = 0;
#10 wr_en = 1; data_in = 10;
#10 data_in = 20;rd_en=1;
#10 data_in = 30;
#10 data_in = 40;
#10 data_in = 50;rd_en=0;
#10 data_in = 60;
#10 data_in = 70;
#10 data_in = 80;
#10 data_in = 90;
#10 data_in = 72;
#10 data_in = 86;
#10 data_in = 90; 
#10 wr_en = 0;
#10 rd_en = 1;
#10 rd_en = 1;
#10 rd_en = 1;
#10 rd_en = 1;
#10 rd_en = 1;
#10 rd_en = 1;
#10 rd_en = 1;
#100 $finish;
end
endmodule 
