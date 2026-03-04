module tb;
integer i,a,b;
initial 
  begin
    for(i=1;i<20;i=i+1)
    begin
    a=$random %201;
      if(a < 0)  
      a = -a;     
      b = a - 100;
    $display("random numbers = %0d", b);
      end 
   end 
endmodule 
