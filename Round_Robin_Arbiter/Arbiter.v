`timescale 1ns / 1ps
module Arbiter(
      input clk,
      input rst,
      input [3:0]req,
      
      output reg[3:0]grant
      

    );
    
     reg [1:0]pointer;
     
     always @(posedge clk or posedge rst)begin
         if(rst)begin
            pointer <= 2'b00;
            grant <= 4'b0000;
         end
         else
         begin
             grant <= 4'b0000;
             case(pointer)
               2'b00:
               begin
                 if(req[0])begin
                    grant <= 4'b0001;
                    pointer <= 2'b01;
                 end
                 else if (req[1])begin
                    grant <= 4'b0010;
                    pointer <= 2'b10;
                 end
                 else if (req[2])begin
                    grant <= 4'b0100;
                    pointer <= 2'b11;
                 end
                 else if (req[3])begin
                    grant <= 4'b1000;
                    pointer <= 2'b00;
                 end
               end
               2'b01:
               begin
                 if(req[1])begin
                    grant <= 4'b0010;
                    pointer <= 2'b10;
                 end
                 else if (req[2])begin
                    grant <= 4'b0100;
                    pointer <= 2'b11;
                 end
                 else if (req[3])begin
                    grant <= 4'b1000;
                    pointer <= 2'b00;
                 end
                 else if (req[0])begin
                    grant <= 4'b0001;
                    pointer <= 2'b01;
                 end
               end
               2'b10:
               begin
                 if(req[2])begin
                    grant <= 4'b0100;
                    pointer <= 2'b11;
                 end
                 else if (req[2])begin
                    grant <= 4'b1000;
                    pointer <= 2'b00;
                 end
                 else if (req[3])begin
                    grant <= 4'b0001;
                    pointer <= 2'b01;
                 end
                 else if (req[0])begin
                    grant <= 4'b0010;
                    pointer <= 2'b10;
                 end
               end
               2'b11:
               begin
                 if(req[2])begin
                    grant <= 4'b1000;
                    pointer <= 2'b00;
                 end
                 else if (req[2])begin
                    grant <= 4'b0001;
                    pointer <= 2'b01;
                 end
                 else if (req[3])begin
                    grant <= 4'b0010;
                    pointer <= 2'b10;
                 end
                 else if (req[0])begin
                    grant <= 4'b0100;
                    pointer <= 2'b11;
                 end
               end
               default 
               begin
                  pointer <= 2'b00;
                  grant <= 4'b0000;
               end
             endcase
           end
         end
endmodule