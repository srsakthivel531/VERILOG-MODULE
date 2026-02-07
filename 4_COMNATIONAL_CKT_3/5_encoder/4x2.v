//design file 
module encoder_4x2(input [3:0] a,output reg  [1:0] y);
  always@ (*)
    begin 
      if (a[0]==1||a==4'b0 )
        y=2'b00;
      else if(a[1]==1)
        y=2'b01;
      else if(a[2]==1)
        y=2'b10;
      else 
        y=2'b11;
     
    end 
endmodule 

//test bench file 
module encoder_4x2_tb;
  reg [3:0] a;
  wire [1:0]y;
  encoder_4x2 uut(a,y);
  initial 
    begin 
      $monitor("$time=%0t a=%b y=%b",$time ,a,y);
      a=4'b0000;
    #3a=4'b0010;
    #3a=4'b0100;
    #2a=4'b1000;
      $finish;
    end 
endmodule
