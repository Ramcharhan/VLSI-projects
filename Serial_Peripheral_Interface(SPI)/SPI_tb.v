`timescale 1ns / 1ps
module SPI_tb;
       reg clk;
       reg rst;
       reg start;
       reg [7:0]data_in;
       
       wire MOSI;
       wire SCLK;
       wire SS;
       wire Done;
       
       SPI dut(.clk(clk),
            .rst(rst),
            .start(start),
            .data_in(data_in),
            .MOSI(MOSI),
            .SCLK(SCLK),
            .SS(SS),
            .Done(Done)
            );
            
  initial begin
      clk = 0;
      forever #5 clk = ~clk;
  end
  
  initial begin
     rst = 1;
     start = 0;
     data_in = 8'b00000000;
     
     #20;
     rst = 0;
     
     #10;
     data_in = 8'b10110010;
     start = 1;
     
     #10;
     start = 0;
     
     #120;
     
     data_in = 8'b11001100;
     start = 1;
     
     #10;
     start = 0;
     
     #120;
     
     $finish;
 end
 
 initial begin
    $monitor("Time=%0t,state=%0d,start=%b,MOSI=%b,SS=%b,SCLK=%b,Done=%b,Bit_count=%0d,Shift_reg=%0d",$time,dut.state,start,MOSI,SS,SCLK,Done,dut.bit_count,
              dut.shift_reg);
 end    
endmodule