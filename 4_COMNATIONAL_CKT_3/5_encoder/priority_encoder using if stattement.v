//design file 
module  pri_encoder(input [3:0]a,output  v,output reg [1:0]y);
  always@(*)
    begin
      if (a[3]==1)
        y=2'b11;
       
      else if(a[2]==1)
        y=2'b10;
        
      else if(a[1]==1)
        y=2'b01;
       
      else if (a[0]==1)
        y=2'b00;
       
      else 
        y=2'bxx;
            
    end 
  assign 
    v=(a[0]|a[1]|a[2]|a[3]);
endmodule 

//test bench file 
 module pri_encoder_tb;
   reg [3:0]a;
  wire v;
  wire [1:0]y;
   integer i;
   pri_encoder uut(a,v,y);
  initial 
    begin 
      $monitor("$time=%0t a=%b  v=%d y=%b ",$time ,a,v,y);
     a=4'b0;
      for(i=0;i<4;i=i+1)
        begin 
          a=i;
          #3;
        end 
     
    end 
endmodule
