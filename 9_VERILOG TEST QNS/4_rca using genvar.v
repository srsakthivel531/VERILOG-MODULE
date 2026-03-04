//design file 
module rca(input [3:0]a,b,input cin,output reg[3:0]sout,output cout);
  reg [4:1]c;
 genvar i;
  generate
    for(i=0;i<4;i=i+1)
      begin:rca
        always @(*)
          begin
            if(i==0)
            {c[i+1],sout[i]}=a[i]+b[i]+cin;
            else 
            {c[i+1],sout[i]}=a[i]+b[i]+c[i];
          end
      end 
endgenerate
assign cout=c[4];
endmodule 
//test bench file 
module RCA_4bit_tb;
  reg [3:0]a,b;
  reg cin;
  wire [3:0]sout;
  wire cout;
  rca uut(a,b,cin,sout,cout);
  initial 
    begin 
      $monitor("time=%0t a=%d b=%d cin=%b sout=%d cout=%b",$time,a,b,cin,sout,cout);
      a = 4'b10;b= 4'b10;cin=4'b1;#3
      a = 3;b= 4;cin=5;#3
      a = 4;b= 10;cin=1;
    end 
endmodule 
