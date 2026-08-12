`timescale 1ns / 1ps
module instruction_memory(

    input [7:0]pc,
    
    output [7:0]instruction

    );
    
    reg [7:0] memory [0:255];
    
    integer i;
    
    initial begin
        memory[0] = 8'b00010001;
        memory[1] = 8'b00110011;
        memory[2] = 8'b11001100;
        memory[3] = 8'b11101110;
        memory[4] = 8'b10101010;
        memory[5] = 8'b10101011;
        memory[6] = 8'b11001100;
        memory[7] = 8'b10001100;
        
        for (i = 8; i < 256; i = i + 1)
        begin
             memory[i] = 8'b00000000;
        end
   end
   
   assign instruction = memory[pc];
endmodule
