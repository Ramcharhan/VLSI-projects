`timescale 1ns / 1ps
module SEQDEC_tb;
     reg clk;
     reg rst;
     reg in;
     
     wire out;
     
     
     SEQDET dut(.clk(clk),
                .rst(rst),
                .in(in),
                .out(out)
                );
     
     initial  begin
          clk = 0;
          forever #5 clk = ~clk;
     end
     
     initial begin
        rst = 1;
        in = 0;
        
        #20;
        rst = 0;
        in = 1;#10;
        in = 0;#10;
        in = 1;#10;
        in = 1;#10;
        in = 0;#10;
        in = 1;#10;
        in = 0;#10;
        in = 1;#10;
        in = 1;#10;
        
        #20;
        $finish;
        
    end
    
    initial begin
       $monitor("Time=%0t,input=%b,state=%b,output=%b",$time,in,dut.state,out);
    end   
endmodule