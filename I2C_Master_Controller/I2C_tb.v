`timescale 1ns / 1ps
module I2C_tb;
    reg clk;
    reg rst;
    reg start;
    reg ack;
    reg [6:0]address;
    reg [7:0]data_in;
    
    wire SCL;
    wire SDA;
    wire done;
    
    I2C dut(.clk(clk),
            .rst(rst),
            .start(start),
            .ack(ack),
            .address(address),
            .data_in(data_in),
            .SCL(SCL),
            .SDA(SDA),
            .done(done)
            );
            
  initial begin
      clk = 0;
      forever #5 clk = ~clk;
  end
  initial begin
     rst = 1;
     start = 0;
     ack = 0;
     address = 7'b1010101;
     data_in = 8'b10011100;
     
     #20;
     rst = 0;
     
     #10;
     start = 1;
     
     #20;
     start = 0;
     
     #100;
     ack = 1;
     
     #20;
     ack = 0;
     
     #150;
     
     $finish;
 end
 initial begin
      $monitor("Time:%0t,state=%0d,start=%b,ACK=%b,SCL=%b,SDA=%b,Done=%b,BIT_COUNT=%0d,Shift_reg=%b",$time,dut.state,start,ack,SCL,SDA,done,dut.bit_count,dut.shift_reg);
 end    
endmodule