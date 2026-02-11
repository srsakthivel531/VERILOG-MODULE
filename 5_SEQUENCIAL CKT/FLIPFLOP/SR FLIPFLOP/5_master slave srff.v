//design file 
module mas_sla_srff(input s,r,clk,output reg qs);
  reg qm;
  always@ (s or r or clk)begin 
     
    if (clk)
      begin 
      
        case({s,r})
        2'b00:qm<=qm;
        2'b01:qm<=1'b0;
         2'b10:qm<=1'b1;
         2'b11:qm<=1'bx;
        default:qm<=0;
      endcase
      end 
  end 
  always@(s or r or clk)
    begin 
      if(clk==0)
        begin 
        case(qm)
          1:qs<=1'b1;
          0:qs<=1'b0;
          default:qs<=0;
        endcase
        end 
    end 
endmodule

//test bench file 
module mas_sla_ff_tb;
  reg s,r,clk;
  wire qs;
  mas_sla_srff uut(s,r,clk,qs);
  initial 
    begin 
      $monitor("$time=%0t s=%b r=%b clk=%b  qs=%b",$time ,s,r,clk,qs);
    clk=1'b0;
    forever #5 clk=~clk;
  end 
    initial 
      begin 
   s=1;r=0;
   #10 s=0;r=0;    
    #10 s=0;r=1;
    #10 s=1;r=0;
    #10 s=1;r=1;
       #10 $finish;
      end 
  initial begin 
    $dumpfile("mas_sla_srff.vcd");
    $dumpvars(0,mas_sla_ff_tb);
  end 
endmodule 
