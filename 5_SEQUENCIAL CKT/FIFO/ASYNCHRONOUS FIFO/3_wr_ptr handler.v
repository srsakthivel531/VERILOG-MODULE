//write pointer handler
module wr_handler #(parameter width=3)(input wr_clk,input wr_rst,input wr_en,input [width:0] g_syn_rd,output reg [width:0]g_wptr,output reg [width:0]b_wptr,output reg full_w);
  wire [width:0]b_ptr_inc;
wire [width:0]g_ptr_inc;
wire full;
always @(posedge wr_clk or posedge wr_rst)
begin
    if(wr_rst)
    begin
        g_wptr<=0;
        b_wptr<=0;
        full_w<=0;
    end
    else
    begin
        g_wptr<=g_ptr_inc;
        b_wptr<=b_ptr_inc;
        full_w<=full;
    end
end
assign b_ptr_inc=b_wptr+(wr_en&!full_w);
assign g_ptr_inc=(b_ptr_inc>>1)^b_ptr_inc;
assign full=(g_ptr_inc =={~g_syn_rd[width:width-1], g_syn_rd[width-2:0]});
endmodule
      
