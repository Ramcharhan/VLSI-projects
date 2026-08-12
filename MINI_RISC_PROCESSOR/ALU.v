`timescale 1ns / 1ps
module ALU(
     input [7:0]A,
     input [7:0]B,
     input [2:0]ALU_sel,
     
     output reg[7:0]ALU_out

    );
    
    always @(*)
    begin
       case(ALU_sel)
            
            3'b000: ALU_out = A+B;
            3'b001: ALU_out = A-B;
            3'b010: ALU_out = A&B;
            3'b011: ALU_out = A|B;
            3'b100: ALU_out = A^B;
            3'b101: ALU_out = ~A;
            default: ALU_out = 8'd0;
       endcase
    end         
endmodule