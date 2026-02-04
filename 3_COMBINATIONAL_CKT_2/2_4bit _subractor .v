//design file 
module full_sub_gate(input a,b,c,output diff, bor );
  wire c1,c2,c3,c4;
  xor x1(diff,a,b,c);
  not n1(c1,a);
  and a1(c2,c1,b);
  and a2(c3,c1,c);
  and a3(c4,b,c);
  or  o1(bor,c2,c3,c4);
endmodule

module full_sub_4bit(a,b,bin,diff,bor);
  input [3:0]a,b;
  input bin;
  output [3:0] diff,bor;
  
  full_sub_gate Fs1(.diff(diff[0]),.bor(bor[0]),.a(a[0]),.b(b[0]),.c(bin));
  full_sub_gate Fs2(.diff(diff[1]),.bor(bor[1]),.a(a[1]),.b(b[1]),.c(bor[0]));
  full_sub_gate Fs3(.diff(diff[2]),.bor(bor[2]),.a(a[2]),.b(b[2]),.c(bor[1]));
  full_sub_gate Fs4(.diff(diff[3]),.bor(bor[3]),.a(a[3]),.b(b[3]),.c(bor[2]));             
endmodule  

//test bench file 
module full_sub_4bit_tb;
  reg [3:0]a,b;
  reg bin;
  wire [3:0]diff,borrow;
  full_sub_4bit uut(a,b,bin,diff,borrow);
  initial 
    begin
      $monitor ("time=%0t a=%b b=%b  bin=%b diff=%d borrow=%d ", $time,a,b,bin,diff,borrow);
      a=0;b=0;bin=0;
      #5 a=4;b=5;bin=6;
      #5 a=5;b=6;bin=1;
      #5 a=4'b0000;b=4'b01110;bin=4'b1111;
      #80 $finish;
    end 
endmodule
