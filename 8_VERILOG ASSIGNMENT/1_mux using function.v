//design file 
module mux_fcn(input a,b,s,output y);
function mux;
input x,y,c;
    begin 
    case(c)
     0:mux=a;
     1:mux=b;
    default:mux=1'bx;
  endcase 
end 
endfunction
assign y=mux(a,b,s);
endmodule 
  //test bench file 
module mux_tb;
  reg a,b,s;
  wire y;
  mux_fcn uut(a,b,s,y);
  initial 
    begin 
      $monitor("time=%0t a=%b b=%b s=%b  y=%b",$time,a,b,s,y);
      a=0;b=1;
      #3 s=1;
      #3 s=0;
    end
endmodule 
