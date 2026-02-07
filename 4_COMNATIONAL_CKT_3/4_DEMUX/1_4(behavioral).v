//design file 
module demux_1_4(input a,s0,s1,output reg [3:0]y);
  integer i;
 
  always @(*)
     begin 
       y=4'b0000;
        i={s1,s0};
       y[i]=a;
  end 
endmodule 

//test bench file 
module demux_tb;
    reg a;
  reg  [1:0]s;
  wire  [3:0] y;

  demux_1_4 uut(a,s[0],s[1],y);

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
