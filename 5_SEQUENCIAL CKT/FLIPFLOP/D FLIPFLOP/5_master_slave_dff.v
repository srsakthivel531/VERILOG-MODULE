//design file 
module mas_sla_dff(input d,clk,output reg qs);
  reg qm;
  always@ (d or clk)begin 
     
    if (clk)
    
        qm<=d;
   else 
     qm<=qm;
       
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
  reg d,clk;
  wire qs;
  mas_sla_dff uut(d,clk,qs);
  initial 
    begin 
      $monitor("$time=%0t  d=%b clk=%b  qs=%b",$time ,d,clk,qs);
    clk=1'b1;
    forever #5 clk=~clk;
  end 
    initial 
      begin 

   d=0;
   #10 d=1;
    #2 d=0;
   #7 d=1;
    #5 d=0;
    #3 d=0;
   #7 d=1;
    #8 d=0;
      #3 d=0;
   #7 d=1;
    #8 d=0;
        
       #10 $finish;
      end 
  initial begin 
    $dumpfile("mas_sla_dff.vcd");
    $dumpvars(0,mas_sla_ff_tb);
  end 
endmodule 
