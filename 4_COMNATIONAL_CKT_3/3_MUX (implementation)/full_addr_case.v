//design file 
module full_add_mux(input a,b,c,output reg sum,cout);
  always @(a or b or c)
    begin 
      case({a,b})
        2'b00:begin 
          sum=c;
          cout=0;
        end 
        2'b01:begin 
          sum=~c;
          cout=c;
        end 
        2'b10:begin 
           sum=~c;
          cout=c;
        end 
        2'b11:begin 
          
           sum=c;
           cout=1;
        end 
      endcase 
    end 
        
endmodule

//test bench file 
module full_add_mux_tb;
  reg a,b,c;
  wire   sum,cout;
  full_add_mux uut(a,b,c,sum,cout);
  initial 
    begin
      $monitor ("time=%0t a=%b b=%b  c=%d sum=%b cout=%b ", $time,a,b,c,sum,cout);
      a=0;b=0;c=0;
      #5 a=0;b=0;c=1;
      #5 a=1;b=1;c=0;
      #5 a=0;b=1;c=1;
      #5 a=1;b=0;c=0;
      #5 a=1;b=0;c=1;
      #5 a=1;b=1;c=0;
      #5 a=1;b=1;c=1;
      #80 $finish;
   end 
endmodule

