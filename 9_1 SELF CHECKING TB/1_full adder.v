//design file
module full_adder_data(input a,b,c,output sum,cout);
  assign sum=a^b^c;
  assign cout=(a&b)|(b&c)|(a&c);
endmodule 

//test bench file 
module full_adder_data_tb;
reg a,b,c;
wire sum,cout;
full_adder_data uut(a,b,c,sum,cout);
//EXPECTED OUTPUT
function [1:0]expected;
input a_in,b_in,c_in;
  begin
expected=a_in+b_in+c_in;
end 
endfunction
//COMPARE AND CHECK
task comp_check;
input t_a,t_b,t_c;
reg [1:0]t_e;
 begin
 a=t_a;
 b=t_b;
 c=t_c;
 #2;
//CALLING FUNCTION
t_e=expected(t_a,t_b,t_c);
//COMPARE THE EXPECTED VS DUT OUTPUT
 if(sum!==t_e[0] && cout!==t_e[1])
 $display("TEST CASES FAILED:a=%0b,b=%0b,c=%0b,cout=%0b,sum=%0b,t_e=%02b",a,b,c,cout,sum,t_e);
  else 
 $display("TEST CASES PASSED:a=%0b,b=%0b,c=%0b,cout=%0b,sum=%0b,t_e=%02b",a,b,c,cout,sum,t_e);
 end 
endtask
initial begin
  comp_check(0,0,0);
  comp_check(0,0,1);
  comp_check(0,1,0);
  comp_check(0,1,1);
  comp_check(1,0,0);
  comp_check(1,0,1);
  comp_check(1,1,0);
  comp_check(1,1,1);
end 
endmodule
OUTPUT:
TEST CASES PASSED: a=0,b=0,c=0,cout=0,sum=0,t_e=00
TEST CASES PASSED: a=0,b=0,c=1,cout=0,sum=1,t_e=01
TEST CASES PASSED: a=0,b=1,c=0,cout=0,sum=1,t_e=01
TEST CASES PASSED: a=0,b=1,c=1,cout=1,sum=0,t_e=10
TEST CASES PASSED: a=1,b=0,c=0,cout=0,sum=1,t_e=01
TEST CASES PASSED: a=1,b=0,c=1,cout=1,sum=0,t_e=10
TEST CASES PASSED: a=1,b=1,c=0,cout=1,sum=0,t_e=10
TEST CASES PASSED: a=1,b=1,c=1,cout=1,sum=1,t_e=11
