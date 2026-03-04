//design file 
module full_adder #(parameter N=8)(input [N-1:0]a,b,input c,output[N-1:0] sum,output cout);
  assign {cout,sum}=a+b+c;
endmodule
//test bench file 
module tb;
  //test signals 8
 reg [7:0]a8,b8;
  reg c8;
  wire [7:0]sum8;
  wire cout8;
  //test signals 16
  reg [15:0]a16,b16;
  reg c16;
  wire [15:0]sum16;
  wire cout16;
  full_adder #(.N(8)) uut(.a(a8),.b(b8),.c(c8),.sum(sum8),.cout(cout8));
  full_adder #(.N(16)) dut(.a(a16),.b(b16),.c(c16),.sum(sum16),.cout(cout16));
  initial begin
   
    a8 = 8'd20;
    b8 = 8'd2;
    c8 = 0;
   
    $strobe("$time=%0t a8=%b b8=%b c8=%b sum=%d cout8=%b",$time,a8,b8,c8,sum8,cout8);
     #5;    
    a8 = 8'd30;
    b8 = 8'd20;
    c8 = 1;
    $strobe("$time=%0t a8=%b b8=%b c8=%b sum=%d cout8=%b",$time,a8,b8,c8,sum8,cout8);

     #5;
    a16 = 16'd10;
    b16 = 16'd20;
    c16 =1;
    $strobe("$time=%0t a16=%b b16=%b c16=%b sum16=%d cout16=%b",$time,a16,b16,c16,sum16,cout16);
    
end
endmodule
