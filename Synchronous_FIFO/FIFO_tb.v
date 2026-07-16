`timescale 1ns/1ps

module FIFO_tb;

reg clk;
reg reset;
reg wr_en;
reg rd_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

integer i;

// DUT
FIFO dut(
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    reset = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    #20;
    reset = 0;

    // Write 5,10,15
    wr_en = 1;

    data_in = 8'd5;
    #10;

    data_in = 8'd10;
    #10;

    data_in = 8'd15;
    #10;

    wr_en = 0;

    // Read 5,10,15
    rd_en = 1;
    #30;
    rd_en = 0;

    // Fill FIFO
    wr_en = 1;
    for(i=0; i<32; i=i+1) begin
        data_in = i;
        #10;
    end
    wr_en = 0;

    // Try write when full
    data_in = 8'hAA;
    wr_en = 1;
    #10;
    wr_en = 0;

    // Empty FIFO
    rd_en = 1;
    #320;
    rd_en = 0;

    // Try read when empty
    rd_en = 1;
    #10;
    rd_en = 0;

    // Simultaneous Read & Write
    wr_en = 1;
    rd_en = 1;
    data_in = 8'h55;
    #10;

    wr_en = 0;
    rd_en = 0;

    #50;
    $finish;
end

initial begin
    $monitor("Time=%0t Reset=%b WR=%b RD=%b DIN=%0d DOUT=%0d FULL=%b EMPTY=%b",
              $time, reset, wr_en, rd_en,
              data_in, data_out, full, empty);
end

endmodule