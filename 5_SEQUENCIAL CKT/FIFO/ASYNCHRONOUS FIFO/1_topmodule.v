 // top module asyn fifo     
module asyn_fifo #(parameter width=3, depth=8, data=8)(input wr_clk,input wr_rst,input rd_clk,input rd_rst,input wr_en,input rd_en,input [data-1:0] datain,output full_w,output empty_r,output [data-1:0] data_out);
wire [width:0] g_wptr, g_rptr;
wire [width:0] g_syn_wr, g_syn_rd;
wire [width:0] b_wptr, b_rptr;
// Synchronizers
synchronizer #(width) sync_rd_ptr(wr_clk,wr_rst,g_rptr,g_syn_rd);
synchronizer #(width) sync_wr_ptr(rd_clk,rd_rst,g_wptr,g_syn_wr);
// Write pointer handler
wr_handler #(width) wr_h(wr_clk,wr_rst,wr_en,g_syn_rd,g_wptr,b_wptr,full_w);
// Read pointer handler
rd_handler #(width) rd_h(rd_clk,rd_rst,rd_en,g_syn_wr,g_rptr,b_rptr,empty_r);
// Memory
memory #(width,depth,data) mem
(wr_clk,rd_clk,wr_en,rd_en,b_rptr,b_wptr,datain,full_w,empty_r,data_out
);
endmodule
