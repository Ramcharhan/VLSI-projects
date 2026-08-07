`timescale 1ns / 1ps
module I2C(
     input clk,
     input rst,
     input start,
     input ack,
     input [6:0]address,
     input [7:0]data_in,
     
     output reg SCL,
     output reg SDA,
     output reg done

    );
    
    parameter IDLE = 3'b000;
    parameter START = 3'B001;
    parameter ADDRESS = 3'b010;
    parameter ACK = 3'b011;
    parameter DATA = 3'b100;
    parameter STOP = 3'b101;
    
    reg [2:0]state;
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
                        state <= START;
                     else
                        state <= IDLE;
                  end
                  START:
                  begin
                     shift_reg <= {address,1'b0};
                     bit_count <= 0;
                     state <= ADDRESS;
                  end
                  ADDRESS:
                  begin 
                     shift_reg <= shift_reg << 1;
                     if(bit_count == 7)
                     begin
                         bit_count <= 0;
                         state <= ACK;
                     end
                     else
                         bit_count <= bit_count + 1;
                 end
                 ACK:
                 begin
                     if(ack)
                     begin
                         shift_reg <= data_in;
                         bit_count <= 0;
                         state <= DATA;
                     end
                     else
                         state <= STOP;
                end
                DATA:
                begin
                    shift_reg <= shift_reg << 1;
                     if(bit_count == 7)
                     begin
                         bit_count <= 0;
                         state <= STOP;
                     end
                     else
                         bit_count <= bit_count + 1;
                 end
                 STOP:
                 begin
                     state <= IDLE;
                end
                default:
                    state <= IDLE;
            endcase
          end
     end
     
     always @(*)begin
         SCL = 1'b1;
         SDA = 1'b1;
         done = 1'b0;
         
         case(state)
             IDLE:
             begin
                SCL = 1'b1;
                SDA = 1'b1;
                done = 1'b0;
             end
             START:
             begin
                SCL = 1'b1;
                SDA = 1'b0;
                done = 1'b0;
             end
             ADDRESS:
             begin
                SCL = clk;
                SDA = shift_reg[7];
                done = 1'b0;
             end
             ACK:
             begin
                SCL = clk;
                SDA = 1'b1;
                done = 1'b0;
             end
             DATA:
             begin
                SCL = clk;
                SDA = shift_reg[7];
                done = 1'b0;
             end
             STOP:
             begin
                SCL = 1'b1;
                SDA = 1'b1;
                done = 1'b1;
             end
             default:
             begin
                SCL = 1'b1;
                SDA = 1'b1;
                done = 1'b0;
             end
         endcase
     end   
endmodule