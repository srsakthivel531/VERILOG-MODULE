//memory 
module memory #(parameter width=3, depth=8, data=8)(input wr_clk,input rd_clk,input wr_en,input rd_en,input [width:0] b_rptr,input [width:0] b_wptr,input [data-1:0] data_in,input full_w,input empty_r,output reg [data-1:0] data_out);
reg [data-1:0] mem [0:depth-1];
always @(posedge wr_clk)
begin
    if(wr_en & ~full_w)
    mem[b_wptr[width-1:0]]<=data_in;
end
always @(posedge rd_clk)
begin
    if(rd_en & ~empty_r)
    data_out<=mem[b_rptr[width-1:0]];
end
endmodule
