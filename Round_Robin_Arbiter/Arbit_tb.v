`timescale 1ns / 1ps
module Arbit_tb;
      reg clk;
      reg rst;
      reg [3:0]req;
      
      wire [3:0]grant;
      
      Arbiter dut(.clk(clk),
                  .rst(rst),
                  .req(req),
                  .grant(grant)
                  );
                  
                  
 initial begin
    clk = 0;
    forever #5 clk = ~clk;
 end
 initial begin
    rst = 1;
    req = 4'b0000;
    
    #20;
    rst = 0;
    req = 1111;
    
    #40;
    req = 1010;
    
    #40;
    req = 0101;
    
    #40;
    req = 0100;
    
    #40;
    req = 0000;
    
    #40;
    req = 1001;
    
    #40;
    $finish;
 end
 initial begin
    $monitor("Time=%0t,Req=%b,Grant=%b,Pointer=%b",$time,req,grant,dut.pointer);
 end   
endmodule