//design file 
module _4_1mux(input [1:0]a,b,c,d,input s0,s1,output reg[1:0]y);
  integer i;
  
  always@(*)
    begin 
      y=a;
      
      i={s1,s0};
  
  while(i<4)
    begin
      case(i)
        0:y=a;
        1:y=b;
        2:y=c;
        3:y=d;
      
      endcase
      i = 4;
    end 
  end 
 endmodule 
//test bench file 
module _4_1mux_tb;
  reg [1:0]a,b,c,d;
  reg s0,s1;
  reg [1:0]y;
  _4_1mux uut(a,b,c,d,s0,s1,y);
  initial 
    begin 
      $monitor("time=%0t s0=%b s1=%b y=%b",$time,s0,s1,y);
      a=2'b00;b=2'b01;c=2'b10;d=2'b11;
      #3 s1=1;s0=1;
       #3 s1=0;s0=1;
       #3 s1=0;s0=0;
    end
endmodule 
