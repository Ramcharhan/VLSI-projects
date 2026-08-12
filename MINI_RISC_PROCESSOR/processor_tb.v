`timescale 1ns / 1ps
module processor_tb;

    reg clk;
    reg rst;
    
processor_top DUT (

    .clk(clk),
    .rst(rst)
    
    );
    
    initial begin
    
       clk = 0 ;
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
   
       $monitor("Time = %0t, PC=%d,insruction=%b",$time,DUT.pc,DUT.instruction);
   end   
endmodule