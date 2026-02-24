//design file 
//sequence 1001
module moore_over(input i,clk,rst,output reg q);
  reg [2:0]state;
  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  always @(posedge clk or posedge rst)
    begin 
      if(rst)
        state<=s0;
        else 
        begin 
        case(state)
          s0:state<=i?s1:s0;
          s1:state<=i?s1:s2; 
          s2:state<=i?s1:s3;
          s3:state<=i?s4:s0;
          s4:state<=i?s1:s2;
          default : state<=s0;
        endcase 
        end 
    end 
  

  always @(*) 
    begin
      if(state==s4)
      q = 1'b1;
    else
      q = 1'b0;
  end
endmodule

//test bench file 
module moore_over_tb;
  reg i,clk,rst;
  wire q;
  moore_over uut(i,clk,rst,q);
  initial 
    begin
      $dumpfile("fsm.vcd");   
      $dumpvars(1, moore_over_tb);
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
    i=0;#4;
    i=0;#4;
    i=1;#4;
    i=1;#4;
    i=0;#4;
    i=0;#4;
    i=1;#4;
    i=1;#4;
    i=0;#4;
    i=0;#4;
    i=1;#4;
    i=0;#4;
    i=0;#4;

   
       i=1;#4;
    i=0;#4;

     i=0;#3;
    i=1;#3;
    i=1;#3;
    i=0;#3;
    i=0;#3;
    i=1;#3;
    i=1;#3;
    i=0;#10;
   #20 $finish;
 end 
endmodule 
