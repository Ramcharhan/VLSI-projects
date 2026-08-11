`timescale 1ns / 1ps
module UART_TX #(
                 parameter CLKS_PER_BIT =  434
                 )
                 (
                 
    input clk,
    input rst,
    input tx_start,
    input [7:0]data_in,
    
    output reg tx,
    output reg tx_done,
    output reg tx_busy
    

    );
    
    parameter IDLE = 3'b000;
    parameter START_BIT = 3'b001;
    parameter DATA_BITS = 3'b010;
    parameter STOP_BIT = 3'b011;
    parameter DONE = 3'b100;
    
    reg [2:0]state;
    reg [7:0]shift_reg;
    reg [3:0]bit_count;
    reg [15:0]baud_count;
    
    
    always @(posedge clk or posedge rst)begin
        if(rst)begin
           state <= IDLE;
           shift_reg <= 8'd0;
           bit_count <= 4'd0;
           baud_count <= 16'd0;
           tx <= 1'b1;
           tx_done <= 1'b0;
           tx_busy <= 1'b0;
        end
        else
        begin
            case(state)
                IDLE:
                begin
                    tx <= 1'b1;
                    tx_done <= 1'b0;
                    tx_busy <= 1'b0;
                    baud_count <= 0;
                    bit_count <= 0;
                    if(tx_start)
                    begin
                         shift_reg <= data_in;
                         tx_busy <= 1'b1;
                         state <= START_BIT;
                    end
                end
                START_BIT:
                begin
                     tx <= 1'b0;
                     tx_busy <= 1'b1;
                     if(baud_count == CLKS_PER_BIT-1)
                     begin
                          baud_count <= 0;
                          state <= DATA_BITS;
                     end
                     else
                     begin
                          baud_count <= baud_count + 1;
                     end
                end
                DATA_BITS:
                begin
                     tx_busy <= 1'b1;
                     tx <= shift_reg[0];
                     if(baud_count == CLKS_PER_BIT-1)
                     begin
                          baud_count <= 0;
                          tx <= shift_reg[0];
                          shift_reg <= shift_reg >> 1;
                          if(bit_count == 7)
                          begin
                               bit_count <= 0;
                               state <= STOP_BIT;
                          end
                          else
                          begin
                               bit_count <= bit_count + 1;
                          end
                     end
                     else
                     begin
                          baud_count <= baud_count  + 1;
                     end
                 end
                 STOP_BIT:
                 begin
                      tx <= 1'b1;
                      tx_busy <= 1'b1;
                      if(baud_count == CLKS_PER_BIT-1)
                      begin
                           baud_count <= 0;
                           state <= DONE;
                      end
                      else
                      begin
                           baud_count <= baud_count + 1;
                      end
                  end
                  DONE:
                  begin
                       tx <= 1;
                       tx_done <= 1'b1;
                       tx_busy <= 1'b0;
                        baud_count <= 0;
                       state <= IDLE;
                  end
                  default:
                  begin
                       state <= IDLE;
                       tx <= 1;
                       tx_done <= 1'b0;
                       tx_busy <= 1'b0;
                       baud_count <= 0;
                       bit_count <= 0;
                  end
                  endcase
             end
          end                      
endmodule