`timescale 1ns / 1ps
module AFIFO # (parameter DATA_WIDTH = 8,
                parameter ADDS_WIDTH = 4)
                (
                  input wr_clk,
                  input rd_clk,
                  input rst,
                  input wr_en,
                  input rd_en,
                  input[DATA_WIDTH-1:0]data_in,
                  output reg[DATA_WIDTH-1:0]data_out,
                  output full,
                  output empty
                 );
                 localparam DEPTH = 1<<ADDS_WIDTH;
                 reg[DATA_WIDTH-1:0] mem [0:DEPTH-1];
                 reg [ADDS_WIDTH:0]wr_ptr;
                 reg [ADDS_WIDTH:0]rd_ptr;
                 
       always @(posedge wr_clk)begin
         if(rst)
           wr_ptr = 0;
         else if(wr_en && !full)begin
           mem[wr_ptr[ADDS_WIDTH-1:0]] <= data_in;
           wr_ptr <= wr_ptr+1;
         end
       end
       
       always @(posedge rd_clk)begin
          if(rst)begin
            rd_ptr = 0;
            data_out <= 0;
          end
          else if(rd_en && !empty)begin
            data_out = mem[rd_ptr[ADDS_WIDTH-1:0]];
            rd_ptr = rd_ptr+1;
          end
       end
       
       assign empty = (wr_ptr == rd_ptr);
       
       assign full = (wr_ptr[ADDS_WIDTH:0] != rd_ptr[ADDS_WIDTH:0]) &&
                         (wr_ptr[ADDS_WIDTH-1:0] == rd_ptr[ADDS_WIDTH-1:0]);
endmodule