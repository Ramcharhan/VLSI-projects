`timescale 1ns / 1ps
module UART_RX1 # (
                  parameter CLKS_PER_BIT = 434
                  )
                  (
   input clk,
   input rst,
   input rx,
   
   output reg [7:0]data_out,
   output reg rx_done,
   output reg rx_busy
   

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
              data_out <= 8'd0;
              rx_done <= 1'b0;
              rx_busy <= 1'b0;
        end
        else
        begin
             case(state)
                  IDLE:
                  begin 
                      rx_done <= 1'b0;
                      rx_busy <= 1'b0;
                      baud_count <= 0;
                      bit_count <= 0;
                      if(rx == 1'b0)
                      begin
                          rx_busy <= 1'b1;
                          state <= START_BIT;
                      end
                      
                  end
                  START_BIT:
                  begin
                       rx_busy <= 1'b1;
                       if(baud_count == (CLKS_PER_BIT/2)-1)
                       begin
                          baud_count <= 0;
                          if(rx == 1'b0)
                           state <= DATA_BITS;
                          else
                           state <= IDLE;
                      end
                      else
                      begin
                           baud_count <= baud_count + 1;
                      end
                  end
                  DATA_BITS:
                  begin
                      rx_busy <= 1'b1;
                      if(baud_count == CLKS_PER_BIT-1)
                      begin
                          baud_count <= 0;
                          shift_reg[bit_count] <= rx;
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
                           baud_count <= baud_count + 1;
                      end
                   end
                   STOP_BIT:
                   begin
                        rx_busy <= 1'b1;
                        if(baud_count == (CLKS_PER_BIT/2)-1)
                        begin
                             baud_count <= 0;
                             if(rx == 1'b1)
                                state <= DONE;
                             else
                                state <= IDLE;
                        end
                        else
                        begin
                             baud_count <= baud_count + 1;
                        end
                   end
                   DONE:
                   begin
                       data_out <= shift_reg;
                       rx_done <= 1'b1;
                       rx_busy <= 1'b0;
                       state <= IDLE;
                  end
                  default:
                  begin
                       state <= IDLE;
                  end
               endcase
             end
          end
 endmodule
