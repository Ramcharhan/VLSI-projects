`timescale 1ns / 1ps
module TLC(
      input clk,
      input rst,
      
      output reg NS_G,
      output reg NS_Y,
      output reg NS_R,
      output reg EW_G,
      output reg EW_Y,
      output reg EW_R
      );
      
      parameter S0 = 2'b00;
      parameter S1 = 2'b01;
      parameter S2 = 2'b10;
      parameter S3 = 2'b11;
      
      reg [1:0]state;
      reg [3:0]count;
      
      always @(posedge clk or posedge rst)begin
          if(rst)begin
             state <= S0;
             count <= 0;
          end
          else
          begin 
            case(state)
               S0:
               begin
                  NS_G <= 1'b1;
                  NS_Y <= 1'b0;
                  NS_R <= 1'b0;
                  EW_G <= 1'b0;                
                  EW_Y <= 1'b0;
                  EW_R <= 1'b1;
                  if(count == 9)begin
                     count <= 0;
                     state <= S1; 
                  end
                  else 
                    count <= count+1;
                end     
                S1:
               begin
                  NS_G <= 1'b0;
                  NS_Y <= 1'b1;
                  NS_R <= 1'b0;
                  EW_G <= 1'b0;                
                  EW_Y <= 1'b0;
                  EW_R <= 1'b1;
                  if(count == 2)begin
                     count <= 0;
                     state <= S2; 
                  end
                  else 
                    count <= count+1;
                end
                S2:
               begin
                  NS_G <= 1'b0;
                  NS_Y <= 1'b0;
                  NS_R <= 1'b1;
                  EW_G <= 1'b1;                
                  EW_Y <= 1'b0;
                  EW_R <= 1'b0;
                  if(count == 9)begin
                     count <= 0;
                     state <= S3; 
                  end
                  else 
                    count <= count+1;
                end
                S3:
               begin
                  NS_G <= 1'b0;
                  NS_Y <= 1'b0;
                  NS_R <= 1'b1;
                  EW_G <= 1'b0;                
                  EW_Y <= 1'b1;
                  EW_R <= 1'b0;
                  if(count == 2)begin
                     count <= 0;
                     state <= S0; 
                  end
                  else 
                    count <= count+1;
                end
                default:
                begin
                  state <= S0;
                  count <= 0;
                end
             endcase
          end
       end         
endmodule