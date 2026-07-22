`timescale 1ns / 1ps
module syn_2ff #(parameter SIZE = 5)(
    input clk,
    input rst,
    input [SIZE -1:0]d,
    output reg [SIZE -1:0]q
    );
    reg [SIZE -1:0]q1;
    
    always @(posedge clk or posedge rst)begin
        if(rst)begin
          q1 <= 0;
          q <= 0;
        end
        else
        begin
          q1 <= d;
          q <= q1;
        end
    end
endmodule
        
        
          
    
module ADV_AFIFO #(parameter DATA_WIDTH =8,
                   parameter ADDR_WIDTH =4)
     (
     input wr_clk,
     input rd_clk,
     input rst,
     input wr_en,
     input rd_en,
     input [DATA_WIDTH-1:0]data_in,
     output  reg [DATA_WIDTH-1:0]data_out,
     output full,
     output empty
    );
    localparam DEPTH = (1<<ADDR_WIDTH);
    reg [DATA_WIDTH:0] mem [0:DEPTH-1];
    reg [ADDR_WIDTH:0]wr_bin;
    reg [ADDR_WIDTH:0]rd_bin;
    wire [ADDR_WIDTH:0]wr_gray;
    wire [ADDR_WIDTH:0]rd_gray;
    wire [ADDR_WIDTH:0]wr_gray_sync;
    wire [ADDR_WIDTH:0]rd_gray_sync;
    
    assign wr_gray = wr_bin ^ (wr_bin >> 1);
    assign rd_gray = rd_bin ^ (rd_bin >> 1);
    
    syn_2ff #(ADDR_WIDTH+1)
         syn_rd2wr(
            .clk(wr_clk),
            .rst(rst),
            .d(rd_gray),
            .q(rd_gray_sync)
            );
     syn_2ff #(ADDR_WIDTH+1)
         syn_wr2rd(
            .clk(rd_clk),
            .rst(rst),
            .d(wr_gray),
            .q(wr_gray_sync)
            );  
            
   always @ (posedge wr_clk or posedge rst)begin
         if(rst)
            wr_bin = 0;
         else if(wr_en && !full)begin
            mem[wr_bin[ADDR_WIDTH-1:0]] <= data_in;
            wr_bin = wr_bin+1;
        end
   end          
   always @ (posedge wr_clk or posedge rst)begin
         if(rst)begin
            rd_bin = 0;
            data_out = 0;
         end
         else if(rd_en && !empty)begin
            data_out <= mem[rd_bin[ADDR_WIDTH-1:0]];
            rd_bin = rd_bin+1;
        end
   end   
   
   assign empty = (rd_gray == wr_gray_sync);
   
   assign full = (wr_gray == {~rd_gray_sync[ADDR_WIDTH:ADDR_WIDTH-1],rd_gray_sync[ADDR_WIDTH-2:0]});
    
endmodule
