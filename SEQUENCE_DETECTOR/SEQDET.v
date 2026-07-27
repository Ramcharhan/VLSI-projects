`timescale 1ns / 1ps
module SEQDET(
          input clk,
          input rst,
          input in,
          
          output  reg out

    );
    
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    
    reg [2:0]state;
    
    
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            state <= S0;
            out <= 1'b0;
        end
        else 
        begin
            case(state)
            
            S0:
            begin
              out <= 1'b0;
              if(in)
                 state <= S1;
              else 
                 state <= S0;
           end
                 
            S1:
            begin
              out <= 1'b0;
              if(in)
                 state <= S1;
              else 
                 state <= S2;
           end
           
           S2:
            begin
              out <= 1'b0;
              if(in)
                 state <= S3;
              else 
                 state <= S0;
           end
           
           S3:
            begin
              out <= 1'b0;
              if(in)
                 state <= S4;
              else 
                 state <= S2;
           end
           
           S4:
            begin
              out <= 1'b1;
              if(in)
                 state <= S1;
              else 
                 state <= S2;
           end
           
           default:
           begin
               state <= S0;
               out <= 1'b0;
           end
         endcase
     end
   end    
endmodule