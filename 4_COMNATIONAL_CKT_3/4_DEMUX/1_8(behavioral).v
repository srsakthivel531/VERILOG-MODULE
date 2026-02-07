//design file 
module demux1_8(
    input a,
    input s0, s1, s2,
    output reg [7:0] y
);
    integer i;

    always @(*) 
      begin
        y = 8'b0;              
        i = {s2, s1, s0};     
        y[i] = a;
    end
endmodule

//test bench file 
module demux_tb;
    reg a;
  reg  [2:0]s;
  wire [7:0] y;

  demux1_8 uut(a,s[0],s[1],s[2],y);

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

