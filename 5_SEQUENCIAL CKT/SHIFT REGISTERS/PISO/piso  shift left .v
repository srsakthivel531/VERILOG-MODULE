//design file 
module piso(input [3:0]pin,input clk,rst,load,output reg[3:0]q,output  sout);
 
  always @(posedge clk or posedge rst)
    begin 
      if(rst)
        q<=4'b0;
      else if(load) 
        q<=pin;
       else 
         q<={q[2:0],1'b0};
    end 
  assign sout=q[3];
endmodule  
//test bench file 
module piso_tb;
  reg [3:0] pin; 
  reg rst,clk,load;
  wire [3:0]q;
  wire sout;

  piso uut(pin,clk,rst,load,q,sout);
  initial begin 
    $monitor("$time=%0t pin=%b clk=%b rst=%b load=%b  q=%b sout=%b",$time,pin,clk,rst,load,q,sout);
     clk=1'b0;
    forever #5 clk=~clk;
  end 
  initial 
    begin
      $dumpfile("piso.vcd");   
      $dumpvars(1,piso_tb);
        end
  initial begin 
    rst=1'b1; load=1'b1;pin=4'b1110;
    #1 rst=1'b0;
  
    #10 load=1'b0;
    #100 $finish;
  end 
endmodule 
