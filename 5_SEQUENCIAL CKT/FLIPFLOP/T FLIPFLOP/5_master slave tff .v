//design file 
module mas_sla_tff(input t,clk,input rst,output reg qs);
  reg qm;
  always@(clk or t)
    begin 
      if(rst)
      qm<=1'b0;
      else if(clk && t)
      qm<=~qm;
     end 
 always@( clk)
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
  reg t,clk,rst;
  wire qs;
  mas_sla_tff uut(t,clk,rst,qs);
  initial 
    begin 
      $monitor("$time=%0t  t=%b clk=%b rst=%b qs=%b",$time ,t,clk,rst,qs);
    clk=1'b0;
    forever #5 clk=~clk;
  end 
    initial 
      begin 

   t=0;rst=1;
        #2 rst=0;
   #10 t=1;
    #2 t=0;
   #7 t=1;
    #5 t=0;
    #3 t=0;
   #7 t=1;
    #8 t=0;
      #3 t=0;
   #7 t=1;
    #8 t=0;
        
       #10 $finish;
      end 
  initial begin 
    $dumpfile("mas_sla_tff.vcd");
    $dumpvars(0,mas_sla_ff_tb);
  end 
endmodule 
