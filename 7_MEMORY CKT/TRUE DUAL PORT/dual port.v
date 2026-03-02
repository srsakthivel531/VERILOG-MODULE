//dualport 64*8
module dualport(input clk,rst,wr_a,wr_b,input [7:0]data_a,data_b,
                input [5:0]addr_a,addr_b,output reg [7:0]q_a,q_b);
  reg [7:0]mem[0:64];
  always @(posedge  clk)
    begin
      if(rst) begin 
        q_a<=0;
        q_b<=0;
        mem[addr_a]<=0;
        mem[addr_b]<=0;
      end 
      else begin
        if(addr_a==addr_b)begin 
          mem[addr_a]<=data_a;    //port a priority
          q_a<=mem[addr_a];
        end 
        else 
          begin 
            if(wr_a)
              mem[addr_a]<=data_a;
             else 
               q_a<=mem[addr_a];
            if(wr_b)
              mem[addr_b]<=data_b;
            else 
              q_b<=mem[addr_b];
          end 
      end 
    end 
endmodule 
//test bench file 
//test bench dual port 
module dual_port;
 reg clk,rst,wr_a,wr_b;
  reg [7:0]data_a,data_b;
  reg [5:0]addr_a,addr_b;
  wire [7:0]q_a,q_b;
  
  dualport uut(  clk,rst,wr_a,wr_b,data_a,data_b,addr_a,addr_b,q_a,q_b);
  
  initial begin 
    clk=1'b0;
    forever #5 clk=~clk;
  end 
  
  initial begin 
    $dumpfile("file.vcd");
    $dumpvars(1,dual_port);
 end 
   initial begin 
     rst=1'b1;wr_a=1;wr_b=1;addr_a=6'd2;addr_b=6'd5;data_a=8'hbb;data_b=8'haa;
     #1 rst=1'b0;
     #10
     addr_a=6'd15;addr_b=6'd12;data_a=8'h65;data_b=8'h60;
     #10
     addr_a=6'd17;addr_b=6'd18;data_a=8'h55;data_b=8'h50;
     #10
     wr_a=0;wr_b=0;addr_a=6'd2;addr_b=6'd5;
     #10
     addr_a=6'd15;addr_b=6'd12;
     #10
      addr_a=6'd17;addr_b=6'd18;
     #10
     wr_a=1;wr_b=1;
     #10
     addr_a=6'd20;addr_b=6'd20;data_a=8'hab;data_b=8'hbc;
     #50$finish;
   end 
endmodule 
            
