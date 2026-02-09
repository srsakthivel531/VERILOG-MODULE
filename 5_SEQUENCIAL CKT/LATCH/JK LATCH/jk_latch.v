//design file 
module jk_latch (
    input  j,
    input  k,
    input  clk,   
    input  rst,
    output reg q
);
  always @(*) begin
        if (rst)
            q <= 1'b0;
        else if (clk) begin     
            case ({j,k})
                2'b00: q <= q;    
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1; 
                2'b11: q <= ~q;   
            endcase
        end
       
    end
endmodule

//test bench file 
module jk_latch_tb;
    reg j, k, rst, clk;
    wire q;

    jk_latch uut (j, k, clk, rst, q);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("time=%0t j=%b k=%b rst=%b clk=%b q=%b",
                 $time, j, k, rst, clk, q);

        rst = 1;
        j = 0; k = 0;
        #4 rst = 0;

        #6 j = 1; k = 0;  
        #6 j = 0; k = 1;  
        #6 j = 1; k = 1;  
        #6 j = 0; k = 0;  

        #10 $finish;
    end

    initial begin
        $dumpfile("jk_latch.vcd");
        $dumpvars(0, jk_latch_tb);
    end
endmodule
