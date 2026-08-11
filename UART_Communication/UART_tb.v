`timescale 1ns / 1ps
module UART_tb;
    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0]data_in;
    
    wire tx;
    wire tx_done;
    wire tx_busy;
    
    wire [7:0]data_out;
    wire rx_done;
    wire rx_busy;
    
    UART_TOP # (
               .CLKS_PER_BIT(10)
               )
               DUT
               (
               .clk(clk),
               .rst(rst),
               .tx_start(tx_start),
               .data_in(data_in),
               .tx(tx),
               .tx_done(tx_done),
               .tx_busy(tx_busy),
               .data_out(data_out),
               .rx_done(rx_done),
               .rx_busy(rx_busy)
               );
  initial begin
      clk = 0;
      forever #5 clk = ~clk;
  end
  initial begin
      rst = 1;
      tx_start = 0;
      data_in = 8'b10110010;
      
      #20;
      rst = 0;
      
      #20;
      tx_start = 1;
      
      #10;
      tx_start = 0;
      
      wait(rx_done);
      
      #20;
       data_in = 8'b11001100;
       
       tx_start = 1;
       
       #10;
       tx_start = 0;
       
       wait(rx_done);
       
       #50;
       
       $finish;
 end
 initial begin
     $monitor("Time=%0t,TX=%b,TX_BUSY=%b,TX_DONE=%b,RX_BUSY=%b,RX_DONE=%b,data_in=%b,data_out=%b",$time,tx,tx_busy,tx_done,rx_busy,rx_done,data_in,data_out);
 end   
endmodule