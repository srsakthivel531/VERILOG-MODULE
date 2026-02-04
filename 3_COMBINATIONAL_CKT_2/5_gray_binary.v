//design file 
module gray_bin_data(input [3:0] G,output [3:0] B);
  assign B[3]=G[3];
  assign B[2]=B[3]^G[2];
  assign B[1]=B[2]^G[1];
  assign B[0]=B[1]^G[0];
  endmodule 

//test bench file 
module gray_bin_tb;
  reg [3:0] G;
  wire[3:0] B;
  gray_bin_data uut(G,B);
  initial 
    begin
      $monitor("time=%0t G=%b B=%b",$time,G,B);
      G=4'b1000;#3
      G=4'b1001;#3
      G=4'b1011;#3
      $finish;
    end 
endmodule 
