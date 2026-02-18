//design file 
module bidirec_shiftreg(input sin,clk,rst,ctrl,output reg[3:0]q,output sout);
  assign sout= rst?1'b0:ctrl?q[0]:q[3];
  always @(posedge clk or posedge rst)
    begin 
      if(rst)
        begin
        q<=4'b0;
      
        end 
      else if(ctrl==1)
        q<={sin,q[3:1]};   //right shift 
        
      else
       q<={q[2:0],sin};     //left shift
       end 
endmodule 

//test bench file 
module bid_shiftreg_tb;
  reg sin,clk,rst,ctrl;
  wire [3:0]q;
  wire sout;
  bidirec_shiftreg  uut(sin,clk,rst,ctrl,q,sout);

   initial begin 
    rst=1'b1;
    sin=1'b1;
    ctrl=1;
     #1 rst=1'b0;
     #5 sin=0;
     #2 sin=1;
     #3 sin=0;
      #5 ctrl=1'b0;
     #2 sin=1;
     #3 sin=0; 
    #10 $finish;
   end 
    initial begin 
      $monitor("$time=%0t sin=%b clk=%b rst=%b ctrl=%b q=%b sout=%b ",$time,sin,clk,rst,ctrl,q,sout);
     clk=1'b0;
    forever #1 clk=~clk;
  end 
    initial 
    begin
      $dumpfile("bid_sr.vcd");   
      $dumpvars(1,bid_shiftreg_tb);
        end
endmodule 
  
