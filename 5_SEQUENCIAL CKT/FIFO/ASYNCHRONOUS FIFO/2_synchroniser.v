//2ff synchronizer 
module synchronizer #(parameter width=3)(input clk,input rst,input [width:0] din,output reg [width:0] qout);
reg[width:0]q1;
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
    q1<=0;
    qout<=0;
    end
    else
    begin
    q1<=din;
    qout<=q1;
  end
end
endmodule
      
