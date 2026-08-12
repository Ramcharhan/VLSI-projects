`timescale 1ns / 1ps
module control_unit(

    input [7:0]instruction,
    
    output reg reg_write,
    output reg mem_write,
    output reg mem_read,
    output reg [2:0]ALU_sel

    );
    
    always @(*)
    begin
        reg_write <= 0;
        mem_write <= 0;
        mem_read <= 0;
        ALU_sel <= 3'b000;
        case(instruction[7:5])
            
            3'b000:
            begin
                   reg_write <= 1;
                   ALU_sel <= 3'b000;
            end
            
            3'b001:
            begin
                  reg_write <= 1;
                  ALU_sel <= 3'b001;
            end
            
            3'b010:
            begin
                  reg_write <= 1;
                  ALU_sel <= 3'b010;
            end
            
            3'b011:
            begin
                  reg_write <= 1;
                  ALU_sel <= 3'b011;
            end
            
            3'b100:
            begin
                  reg_write <= 1;
                  mem_read <= 1;
            end
            
            3'b101:
            begin
                  mem_write <= 1;
            end
            
            3'b110:
            begin
                  reg_write <= 1;
                  ALU_sel <= 3'b100;
            end
            
            default:
            begin
                  reg_write <= 0;
                  mem_write <= 0;
                  mem_read <= 0;
                  ALU_sel <= 3'b000;
            end
       endcase
   end           
endmodule