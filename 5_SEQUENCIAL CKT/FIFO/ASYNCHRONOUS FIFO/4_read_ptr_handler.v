 //read pointer handler 
module rd_handler #(parameter width=3)(input rd_clk,input rd_rst,input rd_en,input [width:0]g_syn_wr,output reg [width:0]g_rptr,output reg [width:0]b_rptr,output reg empty_r);
wire [width:0] b_ptr_inc;
wire [width:0] g_ptr_inc;
wire empty;
always @(posedge rd_clk or posedge rd_rst)
begin
    if(rd_rst)
    begin
        g_rptr<=0;
        b_rptr<=0;
        empty_r<=1;
    end
    else
    begin
        g_rptr<=g_ptr_inc;
        b_rptr<=b_ptr_inc;
        empty_r<=empty;
    end
end
assign b_ptr_inc = b_rptr + (rd_en & ~empty_r);
assign g_ptr_inc = (b_ptr_inc >> 1) ^ b_ptr_inc;
assign empty=(g_ptr_inc==g_syn_wr);
endmodule 
