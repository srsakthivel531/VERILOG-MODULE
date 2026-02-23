//design file 

module mealy_over(input i,clk,rst,output reg q);
  reg [1:0] state;
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;

  always @(posedge clk or posedge rst) 
    begin
    if(rst) 
      state<=s0;
    else 
     begin
      case(state)
        s0:state<=i?s1:s0;
        s1:state<=i?s2:s0; 
        s2:state<=i?s2:s3;
        s3:state<=i?s1:s0;
        default:state<=s0;
      endcase
    end
  end

  always @(*) 
    begin
    if(state==s3 && i==1)
      q = 1'b1;
    else
      q = 1'b0;
  end
endmodule 

//test bench file 
module mealy_over_tb;
  reg i,clk,rst;
  wire q;
  mealy_over uut(i,clk,rst,q);
  initial 
    begin
      $dumpfile("fsm.vcd");   
      $dumpvars(1, mealy_over_tb);
    end 
   initial begin 
     $monitor("$time=%0t i=%b clk=%b rst=%b q=%b ",$time,i,clk,rst,q);
     clk=1'b0;
    forever #2 clk=~clk;
  end 
 initial begin 
   i=0;
    rst=1;#1;
 
    rst=0;#3;
    i=1;#4;
    i=1;#4;
    i=0;#4;
    i=1;#4;
    i=0;#4;
    i=1;#4;
    i=0;#4;
    i=1;#4;
    i=1;#4;
    i=1;#4;
    i=0;#4;
    i=1;#4;
    i=0;#4;
    i=1;#4;
    i=0;#10;
     i=1;#3;
    i=1;#3;
    i=1;#3;
    i=0;#3;
    i=1;#3;
    i=0;#3;
    i=1;#3;
    i=0;#10;
   #20 $finish;
 end 
endmodule 
