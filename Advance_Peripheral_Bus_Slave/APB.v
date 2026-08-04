`timescale 1ns / 1ps
module APB(
    input clk,
    input rst,
    input PSEL,
    input PENABLE,
    input PREADY,
    
    output reg transfer_ready
    );
    
   parameter IDEAL = 2'b00;
   parameter SETUP = 2'b01;
   parameter ACCESS = 2'b10;
 
   reg [1:0]state;
   
   always @(posedge clk or posedge rst)begin
         if(rst)
             state <= IDEAL;
        else
        begin
           case(state)
               IDEAL:
               begin
                 if(PSEL)
                    state <= SETUP;
                 else 
                    state <= IDEAL;
               end
               SETUP:
               begin
                 if(PENABLE)
                    state <= ACCESS;
                 else 
                    state <= SETUP;
               end
                  ACCESS:
               begin
                 if(PREADY)
                    state <= IDEAL;
                 else 
                    state <= ACCESS;
               end
               default:
               begin
                   state <= IDEAL;
               end
             endcase
          end
       end
    always @(*)begin
          transfer_ready = 1'b0;
          case(state)
          IDEAL:
               transfer_ready = 1'b0;
          SETUP:
               transfer_ready = 1'b0;
          ACCESS:
          begin
               if(PREADY)
                 transfer_ready = 1'b1;
               else
                 transfer_ready = 1'b0;
          end
          default:
          begin
              transfer_ready = 1'b0;
          end
        endcase
     end    
endmodule