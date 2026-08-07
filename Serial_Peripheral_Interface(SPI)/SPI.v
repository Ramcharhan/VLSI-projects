`timescale 1ns / 1ps
module SPI(
       input clk,
       input rst,
       input start,
       input [7:0]data_in,
       
       output reg MOSI,
       output reg SCLK,
       output reg SS,
       output reg Done

    );
    
      parameter IDLE = 2'b00;
      parameter LOAD = 2'b01;
      parameter SHIFT = 2'b10;
      parameter DONE = 2'b11;
      
      reg [1:0]state;
      reg [7:0]shift_reg;
      reg [3:0]bit_count;
      
      always @(posedge clk or posedge rst)begin
          if(rst)begin
             state <= IDLE;
             shift_reg <= 8'b0;
             bit_count <= 0;
          end
          else
          begin
            case(state)
               IDLE:
               begin
                  if(start)
                     state <= LOAD;
                  else
                     state <= IDLE;
               end
               LOAD:
               begin
                     shift_reg <= data_in;
                     bit_count <= 0;
                     state <= SHIFT;  
              end
              SHIFT:
              begin
                   MOSI <= shift_reg[7];
                   shift_reg <= shift_reg <<  1;
                   bit_count <= bit_count + 1;
                   
                   if(bit_count == 7)
                     state <= DONE;
                   else
                     state <= SHIFT;
             end
             DONE:
             begin
                 state <= IDLE;
             end
             default:
             begin
                 state <= IDLE;    
             end
          endcase
        end
     end
     
     
  always @(*)begin
       SS = 1'b1;
       SCLK = 1'b0;
       Done = 1'b0;
       
       case(state)
         IDLE:
         begin
            SS = 1'b1;
            SCLK = 1'b0;
            Done = 1'b0;
         end
         LOAD:
         begin
             SS = 1'b0;
             SCLK = 1'b0;
             Done = 1'b0;
         end
         SHIFT:
         begin
             SS = 1'b0;
             SCLK = clk;
             Done = 1'b0;
         end
         DONE:
         begin
             SS = 1'b1;
             SCLK = 1'b0;
             Done = 1'b0;
         end
         default:
         begin
             SS = 1'b1;
             SCLK = 1'b0;
             Done = 1'b0;
         end
       endcase
    end      
endmodule