//design file 
module full_add_data(input a,b,c,output sum,cout);
  assign sum=a^b^c;
  assign cout=(a&b)|(b&c)|(a&c);
endmodule 

module addr_sub_4bit(input [3:0] a,b, input c,output [3:0] sum,cout);
  wire [3:0]B;
 
  assign B[0] = b[0] ^ c;
  assign B[1] = b[1] ^ c;
  assign B[2] = b[2] ^ c;
  assign B[3] = b[3] ^ c;

  //instanstiate
  full_add_data FA1(a[0],B[0],c,sum[0],cout[0]);
  full_add_data FA2(a[1],B[1],cout[0],sum[1],cout[1]);
  full_add_data FA3(a[2],B[2],cout[1],sum[2],cout[2]);
  full_add_data FA4(a[3],B[3],cout[2],sum[3],cout[3]);
endmodule

//test bench file 
module addr_sub_4bit_tb;
  reg [3:0]a,b;
  reg c;
  wire [3:0]sum,cout;
  addr_sub_4bit uut(a,b,c,sum,cout);
  initial 
    begin 
      $monitor("time=%0t a=%b b=%b c=%b sum=%b cout=%b",$time,a,b,c,sum,cout);
      a = 5;b= 2;c=1;#3
      a = 4;b=3;c=1;
    end 
endmodule 
