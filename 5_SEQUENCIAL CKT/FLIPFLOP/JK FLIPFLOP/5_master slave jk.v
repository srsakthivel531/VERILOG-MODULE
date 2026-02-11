//design file 
module mas_sla_jkff(input j,k,clk,output reg qs);
  reg qm;
  always@ (j or k or clk)begin 
     
    if (clk)
      begin 
      
        case({j,k})
        2'b00:qm<=qm;
        2'b01:qm<=1'b0;
         2'b10:qm<=1'b1;
         2'b11:qm<=~qm;
        default:qm<=0;
      endcase
      end 
  end 
  always@(j or k or clk)
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
  reg j,k,clk;
  wire qs;
  mas_sla_jkff uut(j,k,clk,qs);
  initial 
    begin 
      $monitor("$time=%0t j=%b k=%b clk=%b  qs=%b",$time ,j,k,clk,qs);
    clk=1'b0;
    forever #5 clk=~clk;
  end 
    initial 
      begin 
   j=1;k=0;
   #10 j=0;k=0;    
    #10 j=0;k=1;
    #10 j=1;k=0;
    #10 j=1;k=1;
       #10 $finish;
      end 
  initial begin 
    $dumpfile("mas_sla_jkff.vcd");
    $dumpvars(0,mas_sla_ff_tb);
  end 
endmodule 
