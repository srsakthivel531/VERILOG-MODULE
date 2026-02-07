//design file  
module demux1_4(input a,s0,s1,output [3:0]y);
  assign {y[0],y[1],y[2],y[3]}= s1?(s0?{3'b0,a}:{2'b0,a,1'b0}):(s0?{1'b0,a,2'b0}:{a,3'b0});
endmodule 

//test bench file 
module demux_tb;
    reg a;
  reg  [1:0]s;
  wire [3:0] y;

  demux1_4 uut(a,s[0],s[1],y);

    integer i;
    initial begin
        a = 1'b1;
        $monitor("time=%0t a=%b s=%b y=%b", $time, a, s, y);

      for (i = 0; i < 4; i = i + 1) begin
            s = i;
            #3;
        end
    end
endmodule
