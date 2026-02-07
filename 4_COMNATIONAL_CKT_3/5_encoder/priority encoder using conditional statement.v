//design file 
module pri_encoder(input a,b,c,d,output v,output [1:0]y);
  assign y=d?(2'b11):c?(2'b10):b?(2'b01):a?(2'b00):2'bxx;
  assign v=(a|b|c|d);
endmodule 

//test bench file 
 module pri_encoder_tb;
   reg a,b,c,d;
  wire v;
  wire [1:0]y;
   integer i;
   pri_encoder uut(a,b,c,d,v,y);
  initial 
    begin 
      $monitor("$time=%0t d=%b c=%b b=%b a=%b y=%b v=%b",$time,d,c,b,a,y,v);
    a=0;b=0;c=0;d=0;
      #3 a=0;b=0;c=1;d=1;
    #2 a=0;b=1;c=0;d=0;
    
  #4a=0;b=0;c=1;d=0;
      $finish;
    end 
endmodule
