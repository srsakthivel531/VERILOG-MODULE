//design file 
module uni_shift_reg(input sin,clk,rst,input [1:0]s,input [3:0]pin,output reg [3:0]q,output  [3:0]sout);
  assign sout=rst?1'b0:(s[1]?(s[0]?pin:q[0]):(s[0]?q[3]:q) );
  always @(posedge clk or posedge rst)
    begin 
      if(rst)
        q<=4'b0;
      else 
        begin 
          case(s)
            2'b0:q<=q;
            2'b1:q<={q[2:0],sin};
            2'b10:q<={sin,q[3:1]};
            2'b11:q<=pin;
          endcase
        end
    end 
      endmodule 
//test bench file 
module uni_shift_reg_tb;
  reg sin,clk,rst;
  reg [1:0]s;
  reg [3:0]pin;
  wire [3:0]q;
  wire sout;
  uni_shift_reg  uut(sin,clk,rst,s,pin,q,sout);

   initial begin 
    rst=1'b1;
    sin=1'b1;pin=4'b1010;
    #1 rst=1'b0;
    #2 s=2'b00;
     #2 s=2'b01;
     #10 s=2'b10;
     #10 s=2'b11;
    #10 $finish;
   end 
    initial begin 
      $monitor("$time=%0t sin=%b clk=%b rst=%b s=%b pin=%b q=%b sout=%b ",$time,sin,clk,rst,s,pin,q,sout);
     clk=1'b0;
    forever #1 clk=~clk;
  end 
    initial 
    begin
      $dumpfile("uni_sr.vcd");   
      $dumpvars(1, uni_shift_reg_tb);
        end
endmodule 
