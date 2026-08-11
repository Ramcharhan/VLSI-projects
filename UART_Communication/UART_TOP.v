`timescale 1ns / 1ps
module UART_TOP # (
                   parameter CLKS_PER_BIT = 434
                   )
                   (
    input clk,
    input rst,
    input tx_start,
    input [7:0]data_in,
    
    output tx,
    output tx_done,
    output tx_busy,
    
    output [7:0]data_out,
    output rx_done,
    output rx_busy
    
    );
    
    
   UART_TX # (
             .CLKS_PER_BIT(CLKS_PER_BIT)
             )
             TX
             (
             .clk(clk),
             .rst(rst),
             .tx_start(tx_start),
             .data_in(data_in),
             .tx(tx),
             .tx_done(tx_done),
             .tx_busy(tx_busy)
             );
  UART_RX1 # (
             .CLKS_PER_BIT(CLKS_PER_BIT)
             )
             RX 
             (
             .clk(clk),
             .rst(rst),
             .rx(tx),
             .data_out(data_out),
             .rx_done(rx_done),
             .rx_busy(rx_busy)
             );   
endmodule