
`timescale 1ns / 1ps
module ADV_AFIFO_tb3;
     reg wr_clk;
     reg rd_clk;
     reg rst;
     reg wr_en;
     reg rd_en;
     reg [7:0]data_in;
     wire [7:0]data_out;
     wire full;
     wire empty;
     
  ADV_AFIFO dut(.wr_clk(wr_clk),
                .rd_clk(rd_clk),
                .rst(rst),
                .wr_en(wr_en),
                .rd_en(rd_en),
                .data_in(data_in),
                .data_out(data_out),
                .full(full),
                .empty(empty)
                );
    initial begin
       wr_clk = 0;
       forever #5 wr_clk = ~wr_clk;
    end
    initial begin
       rd_clk = 0;
       forever #5 rd_clk = ~rd_clk;
    end
    
   initial begin
   
      rst =  1;
      wr_en = 0;
      rd_en = 0;
      data_in = 0;
      
      #20;
      rst = 0;
      wr_en = 1;
      data_in = 8'd10;#10;
      data_in = 8'd20;#10;
      data_in = 8'd30;#10;
      wr_en = 0;
      
      #50;
      rd_en = 1;
      
      #60
      rd_en = 0;
      
      #100;
      $finish;
      
    end
    
    initial begin
       $monitor("T=%0t,WR=%b,RD=%b,DIN=%b,DOUT=%b,FULL=%b,EMPTY=%b",$time,wr_en,rd_en,data_in,data_out,full,empty);
    end      
endmodule

