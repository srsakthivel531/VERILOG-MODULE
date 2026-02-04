//design file 
module bin_gray_data(input [3:0] B,output [3:0] G);
  assign G[3]=B[3];
  assign G[2]=B[3]^B[2];
  assign G[1]=B[2]^B[1];
  assign G[0]=B[1]^B[0];
  endmodule 

//test bench file 
module bin_gray_tb;
  reg [3:0] B;
  wire[3:0] G;
  bin_gray_data uut(B,G);
  initial 
    begin
      $monitor("time=%0t B=%b G=%b",$time,B,G);
      B=4'b1000;#3
      B=4'b1001;#3
      B=4'b1011;#3
      $finish;
    end 
endmodule 
