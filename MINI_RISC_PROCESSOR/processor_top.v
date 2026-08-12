`timescale 1ns / 1ps
module processor_top(
     input clk,
     input rst,
     
     output [7:0] pc,
     output [7:0] instruction

    );
    wire reg_write;
    wire mem_write;
    wire mem_read;
    
    wire [2:0]ALU_sel;
    
    wire [7:0]read_data1;
    wire [7:0]read_data2;
    
    wire [7:0]ALU_out;
    
    wire [7:0]memory_data;
    
    wire [2:0] read_addr1;
    wire [2:0] read_addr2;
    wire [2:0] write_addr;
    
    wire [7:0] write_back_data;
    
    assign read_addr1 = instruction[4:2];
    assign read_addr2 = {1'b0, instruction[1:0]};
    assign write_addr = instruction[4:2];
    
    assign write_back_data = (mem_read) ? memory_data : ALU_out;
    
    
    
     program_counter PC(
    
        .clk(clk),
        .rst(rst),
        .pc(pc)
        
        );
        
     instruction_memory IM(
     
        .pc(pc),
        .instruction(instruction)
        
        );
        
      control_unit CU(
      
        .instruction(instruction),
        
        .reg_write(reg_write),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .ALU_sel(ALU_sel)
        
        );
        
        register_file RF(
          
         .clk(clk),
         .we(reg_write),
         
         .read_addr1(read_addr1),
         .read_addr2(read_addr2),
         
         .write_addr(write_addr),
         
         .write_data(write_back_data),
         
         .read_data1(read_data1),
         .read_data2(read_data2)
         
        
         
         );
         
         ALU alu(
         
         .A(read_data1),
         .B(read_data2),
         
         .ALU_sel(ALU_sel),
         
         .ALU_out(ALU_out)
         
         );
         
        data_memory DM(
        
            .clk(clk),
            
            .mem_write(mem_write),
            .mem_read(mem_read),
            
            .address(ALU_out),
            .write_data(read_data2),
            
            .read_data(memory_data)
            
         );        
endmodule