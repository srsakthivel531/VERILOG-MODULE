//design file 
module mux_nx1 #(parameter N=8,parameter Sel=2)
  (input [N-1:0]a,input [Sel:0] s,output y);
  assign y=a[s];
endmodule 

//test bench file 
module mux_n1_tb;
  parameter N=8;
  parameter sel=2;
  reg  [N-1:0]a;
  reg  [sel:0] s;
  wire  y;
  mux_nx1  uut(a,s,y);
  integer i;
  initial
    begin
      $monitor ("$time=%0t a=%b s=%b y=%b",$time,a,s,y);
      a=8'b10100011;
      for(i=0;i<N;i=i+1)
        begin
        s=i;
      #5;
    end 
 #100 $finish;
    end 
endmodule 
