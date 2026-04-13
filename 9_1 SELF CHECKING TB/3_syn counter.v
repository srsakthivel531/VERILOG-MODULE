//design file 
module syn_upcounter (input clk,rst,output reg [2:0]count);
  always @(posedge clk )
    begin 
      if(rst)
        count<=0;
      else 
        count<=count + 1;
    end 
endmodule 
module syn_upcounter_tb;
  reg clk,rst;
  wire [2:0]count;
  reg[2:0]expected;
  syn_upcounter uut(clk,rst,count);
  initial begin 
    clk=1'b0;
    forever #2 clk=~clk;
  end 
 task comp_check;
   begin
   @(posedge clk);
     if(expected!==count)
       $display("TEST CASE FAILED:clk=%0b,rst=%0b,count=%0d,expected=%0d", 
              clk,rst,count,expected);
   else 
     $display("TEST CASE PASSED:clk=%0b,rst=%0b,count=%0d,expected=%0d", 
              clk,rst,count,expected);
    expected=expected+1;
   end
 endtask
  task reset_t;
    begin
   @(posedge clk);
    rst=1;
    expected=0;
      $display("RESET IS ACTIVE:rst=%0b",rst);
    @(posedge clk);
    rst=0;
  $display("RESET IS ACTIVE:rst=%0b",rst);
    end 
  endtask
  initial begin
    reset_t();
    repeat(8)
      comp_check();
     #5$finish;
  end 
endmodule 
OUTPUT:
RESET IS ACTIVE:rst=1
RESET IS ACTIVE:rst=0
TEST CASE PASSED:clk=1,rst=0,count=0,expected=0
TEST CASE PASSED:clk=1,rst=0,count=1,expected=1
TEST CASE PASSED:clk=1,rst=0,count=2,expected=2
TEST CASE PASSED:clk=1,rst=0,count=3,expected=3
TEST CASE PASSED:clk=1,rst=0,count=4,expected=4
TEST CASE PASSED:clk=1,rst=0,count=5,expected=5
TEST CASE PASSED:clk=1,rst=0,count=6,expected=6
TEST CASE PASSED:clk=1,rst=0,count=7,expected=7
