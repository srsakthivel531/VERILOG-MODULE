//design file 
//d ff
module d_ff(input d,clk,rst,output reg q);
  always @(posedge clk or posedge rst)
    begin 
      if (rst)
        q<=0;
     
      else 
        q<=d;
    end 
endmodule
//4x1 mux
module mux4x1(input a,b,c,d,input s1,s0,output y);
  assign y=s1?(s0?d:c):(s0?b:a);
endmodule 
//instantiate
module uni_shift_reg(input sin,clk,rst,input [1:0]s,input [3:0]pin,output reg [3:0]q,output sout);
  wire [3:0]d;
  assign sout=rst?1'b0:s[1]?(s[0]?1'b0:q[3]):(s[0]?q[0]:1'b0) ;
  d_ff d1(d[0],clk,rst,q[0]);
  d_ff d2(d[1],clk,rst,q[1]);
  d_ff d3(d[2],clk,rst,q[2]);
  d_ff d4(d[3],clk,rst,q[3]);
  //mux instantiate
  mux4x1 m1(q[0],q[1],sin,pin[0],s[1],s[0],d[0]);
  mux4x1 m2(q[1],q[2],q[0],pin[1],s[1],s[0],d[1]);
  mux4x1 m3(q[2],q[3],q[1],pin[2],s[1],s[0],d[2]);
  mux4x1 m4(q[3],sin,q[2],pin[3],s[1],s[0],d[3]);
endmodule 

//test bench file 
module uni_shift_reg_tb;
  reg sin,clk,rst,ctrl;
  reg [1:0]s;
  reg [3:0]pin;
  wire [3:0]q;
  wire sout;
  uni_shift_reg  uut(sin,clk,rst,s,pin,q,sout);

   initial begin 
    rst=1'b1;
    sin=1'b1;s=2'b00;pin=4'b1010;
    #1 rst=1'b0;
    #2 s=2'b00;
     #2 s=2'b01;
     #10 s=2'b10;
     #2 sin=1'b0;
   
     #5 s=2'b11;
    #10 $finish;
   end 
    initial begin 
      $monitor("$time=%0t sin=%b clk=%b rst=%b s=%b pin=%b q=%b sout=%b ",$time,sin,clk,rst,s,pin,q,sout);
     clk=1'b0;
    forever #1 clk=~clk;
  end 
    initial 
    begin
      $dumpfile("uni_sr.vcd");   
      $dumpvars(1, uni_shift_reg_tb);
        end
endmodule 
