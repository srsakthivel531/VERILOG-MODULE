//design file 
module ring_counter (input clk,input rst, output reg [3:0] q,qbar);
reg [3:0] d;
assign qbar=~q;
  assign d[3] = qbar[0];
assign d[2] = q[3];
assign d[1] = q[2];
assign d[0] = q[1];
always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 4'b1000;
    elsemodule ring_counter_tb;

  reg rst,clk;
  reg [3:0]q,qbar;
  ring_counter uut(clk,rst,q,qbar);
  initial begin 
    $monitor("$time=%0t clk=%b rst=%b q=%b qbar=%b",$time,clk,rst,q,qbar);
     clk=1'b0;
    forever #5 clk=~clk;
  end 
  initial 
    begin
      $dumpfile("ringcounter.vcd");   
      $dumpvars(1,ring_counter_tb);
        end
  initial begin 
    rst=1'b1;
    #1 rst=1'b0;
    #180 $finish;
  end 
endmodule 
        q <= d;
end
endmodule 

//test bench file 
