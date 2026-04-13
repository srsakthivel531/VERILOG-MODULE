//design file 
module mux4x1(input [1:0]a,b,c,d,input s0,s1,output reg[1:0] y);
  always@(*)
    begin
      case({s1,s0})
      2'b00 :y=a;
      2'b01 :y=b;
      2'b10:y=c;
      2'b11:y=d;
        default:y=0;
    endcase
  end     
endmodule


//test bench file 
module mux4x1_tb;
reg [1:0]a,b,c,d;
reg s0,s1;
wire [1:0]y;
mux4x1 uut(a,b,c,d,s0,s1,y);
//CREATE EXPECTED OUTPUT
function [1:0]expected;
input [1:0]a_in,b_in,c_in,d_in;
input s0_in,s1_in;
begin
expected=s1_in?(s0_in?d_in:c_in):(s0_in?b_in:a_in);
end
endfunction
//COMPARE AND CHECK 
task comp_check;
input [1:0]a_t,b_t,c_t,d_t; 
input s0_t,s1_t;
reg [1:0]t_e;
  begin
    a=a_t;
    b=b_t;
    c=c_t;
    d=d_t;
    s0=s0_t;
    s1=s1_t;
    #2;
    t_e=expected(a_t,b_t,c_t,d_t,s0_t,s1_t);
    if(t_e==y)
      $display("TEST CASE PASSED:a=%02b,b=%02b,c=%02b,d=%02b,s1=%0b,s0=%0b,y=%02b,t_e=%02b",a,b,c,d,s1,s0,y,t_e);
    else 
      $display("TEST CASE FAILED:a=%02b,b=%02b,c=%02b,d=%02b,s1=%0b,s0=%0b,y=%02b,t_e=%02b",a,b,c,d,s1,s0,y,t_e);
  end 
endtask
initial begin
  repeat(7)
    comp_check(2'b00,2'b01,2'b10,2'b11,$random,$random);
end
endmodule 
OUTPUT:
TEST CASE PASSED:a=00,b=01,c=10,d=11,s1=1,s0=0,y=10,t_e=10
TEST CASE PASSED:a=00,b=01,c=10,d=11,s1=1,s0=1,y=11,t_e=11
TEST CASE PASSED:a=00,b=01,c=10,d=11,s1=1,s0=1,y=11,t_e=11
TEST CASE PASSED:a=00,b=01,c=10,d=11,s1=0,s0=1,y=01,t_e=01
TEST CASE PASSED:a=00,b=01,c=10,d=11,s1=1,s0=1,y=11,t_e=11
TEST CASE PASSED:a=00,b=01,c=10,d=11,s1=1,s0=0,y=10,t_e=10
TEST CASE PASSED:a=00,b=01,c=10,d=11,s1=0,s0=1,y=01,t_e=01
