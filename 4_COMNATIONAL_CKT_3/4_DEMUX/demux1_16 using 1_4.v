//design file 
module demux_1x4(input a,input [1:0]s,output reg [3:0]y);
  integer i;
  always @(*)
     begin 
       y=4'b0000;
       i={s[1],s[0]};
        y[i]=a;
       end 
endmodule 


//instantiate
 
module demux_1x16(input a,input [3:0]s,output reg[15:0]y );
  wire [3:0]t ;

  demux_1x4 d1(a,s[3:2],t[3:0]);
  demux_1x4 d2(t[0],s[1:0],y[3:0]);
  demux_1x4 d3(t[1],s[1:0],y[7:4]);
  demux_1x4 d4(t[2],s[1:0],y[11:8]);
  demux_1x4 d5(t[3],s[1:0],y[15:12]);
endmodule 

//test bench file 
module demux_tb;
    reg a;
  reg  [3:0]s;
  wire [15:0] y;

  demux_1x16 uut(a,s,y);

    integer i;
    initial begin
        a = 1'b1;
        $monitor("time=%0t a=%b s=%b y=%b", $time, a, s, y);

      for (i = 0; i < 16; i = i + 1) begin
            s = i;
            #3;
        end
    end
endmodule
