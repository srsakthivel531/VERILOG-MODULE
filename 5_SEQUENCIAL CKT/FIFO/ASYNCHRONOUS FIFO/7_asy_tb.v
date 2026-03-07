module fifo_tb;
parameter data = 8;
reg wr_clk, wr_rst, rd_clk, rd_rst, wr_en, rd_en;
reg [data-1:0] data_in;
wire full_w, empty_r;
wire [data-1:0] data_out;
asyn_fifo uut(wr_clk,wr_rst,rd_clk,rd_rst,wr_en,rd_en,data_in,full_w,empty_r,data_out);

initial begin
    rd_clk=1'b0;
    forever #6 rd_clk=~rd_clk;
end

initial begin
    wr_clk=1'b0;
    forever #5 wr_clk=~wr_clk;
end

initial begin
wr_rst=1;rd_rst=1;wr_en=0;rd_en=0;data_in=0;
#12 wr_rst=0;rd_rst=0;
//both read and write 
  fork
repeat(8)
@(posedge wr_clk)
begin
    wr_en=1;
    data_in=$random;
end
repeat(8)
@(posedge rd_clk)
begin
    rd_en=1;
end
join
wr_en=0;rd_en=0;
//full condition 
repeat(8)
@(posedge wr_clk)
begin
    wr_en=1;
    data_in=$random;
end
wr_en = 0;
repeat(2)
@(posedge wr_clk)
begin
    wr_en=1;
    data_in=$random;
end

wr_en = 0;
//empty condition
repeat(8)
@(posedge rd_clk)
begin
    rd_en=1;
end

rd_en=0;

repeat(2)
@(posedge rd_clk)
begin
    rd_en=1;
end

rd_en=0;

//again read and write
repeat(6)
@(posedge wr_clk)
begin
    wr_en=1;
    data_in=$random;
end
wr_en = 0;
repeat(6)
@(posedge rd_clk)
begin
    rd_en=1;
end
rd_en=0;
#50 $finish;
end

initial begin
$dumpfile("file.vcd");
$dumpvars(0,fifo_tb);
end
endmodule
