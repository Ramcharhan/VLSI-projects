`timescale 1ns / 1ps
module TLC_tb;
      reg clk;
      reg rst;
      
      wire NS_G;
      wire NS_Y;
      wire NS_R;
      wire EW_G;
      wire EW_Y;
      wire EW_R;
      
      TLC dut(.clk(clk),
              .rst(rst),
              .NS_G(NS_G),
              .NS_Y(NS_Y),
              .NS_R(NS_R),
              .EW_G(EW_G),
              .EW_Y(EW_Y),
              .EW_R(EW_R)
              );
 initial begin 
     clk =0;
     forever #5 clk = ~clk;
 end
 
 initial begin 
    rst = 1;
    #20;
    rst = 0;
    #300;
    $finish;
    
 end
 initial begin 
    $monitor("Time=%0t,state=%0d,count=%0d,NS(G,Y,R)=%b%b%b,EW(G,Y,R)=%b%b%b",$time,dut.state,
              dut.count,NS_G,NS_Y,NS_R,EW_G,EW_Y,EW_R);
 end   
endmodule