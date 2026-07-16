module FIFO #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 32
)(
    input clk,
    input reset,
    input wr_en,
    input rd_en,
    input [DATA_WIDTH-1:0] data_in,

    output reg [DATA_WIDTH-1:0] data_out,
    output full,
    output empty
);

localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);

reg [DATA_WIDTH-1:0] memory [0:FIFO_DEPTH-1];

reg [ADDR_WIDTH-1:0] wr_ptr;
reg [ADDR_WIDTH-1:0] rd_ptr;
reg [ADDR_WIDTH:0] depth_cnt;

// Write Logic
always @(posedge clk) begin
    if(reset)
        wr_ptr <= 0;
    else if(wr_en && !full) begin
        memory[wr_ptr] <= data_in;
        wr_ptr <= (wr_ptr == FIFO_DEPTH-1) ? 0 : wr_ptr + 1;
    end
end

// Read Logic
always @(posedge clk) begin
    if(reset) begin
        rd_ptr <= 0;
        data_out <= 0;
    end
    else if(rd_en && !empty) begin
        data_out <= memory[rd_ptr];
        rd_ptr <= (rd_ptr == FIFO_DEPTH-1) ? 0 : rd_ptr + 1;
    end
end

// FIFO Count Logic
always @(posedge clk) begin
    if(reset)
        depth_cnt <= 0;
    else begin
        case ({wr_en && !full, rd_en && !empty})
            2'b10: depth_cnt <= depth_cnt + 1;
            2'b01: depth_cnt <= depth_cnt - 1;
            default: depth_cnt <= depth_cnt;
        endcase
    end
end

assign empty = (depth_cnt == 0);
assign full  = (depth_cnt == FIFO_DEPTH);

endmodule