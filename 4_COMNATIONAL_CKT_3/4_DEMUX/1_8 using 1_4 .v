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

module demux_1x2(input a,s,output reg [1:0]y);
  assign y=s?2'b10:2'b01;
endmodule
//instantiate
 
module demux_1x8(input a,input [2:0]s,output reg [7:0]y );
  wire [1:0]t ;
  demux_1x2 d1(a,s[2],t[1:0]);
  demux_1x4 d2(t[0],s[1:0],y[3:0]);
  demux_1x4 d3(t[1],s[1:0],y[7:4]);
endmodule 

//test bench file 
module demux_tb;
    reg a;
  reg  [2:0]s;
  wire [7:0] y;

  demux_1x8 uut(a,s,y);

    integer i;
    initial begin
        a = 1'b1;
        $monitor("time=%0t a=%b s=%b y=%b", $time, a, s, y);

      for (i = 0; i < 8; i = i + 1) begin
            s = i;
            #3;
        end
    end
endmodule
