`timescale 1ns / 1ps
module APB_tb;
    reg clk;
    reg rst;
    reg PSEL;
    reg PENABLE;
    reg PREADY;
    
    wire transfer_ready;
    
    APB dut(.clk(clk),
            .rst(rst),
            .PSEL(PSEL),
            .PENABLE(PENABLE),
            .PREADY(PREADY),
            .transfer_ready(transfer_ready)
            );
            
  initial begin
      clk = 0;
      forever #5 clk = ~clk;
  end
  
  initial begin 
      clk = 0;
      rst = 1;
      PSEL = 0;
      PENABLE = 0;
      PREADY = 0;
      
      #20;
      rst = 0;
      
      #10;
      PSEL = 1;
      #10;
      PENABLE = 1;
      #20;
      PREADY = 1;
      
      #10;
      PSEL = 0;
      PENABLE = 0;
      PREADY = 0;
      
      #20;
      PSEL = 1;
      #10;
      PENABLE = 1;
      #30;
      PREADY = 0;
      
      #20;
      PREADY = 1;
      
      #10;
      PSEL = 0;
      PENABLE = 0;
      PREADY = 0;
      
      #30;
      $finish;
  end
  initial begin
      $monitor("Time:%0t,state=%b,PSEL=%b,PENABLE=%b,PREADY=%b",$time,dut.state,PSEL,PENABLE,
                                                          PREADY);
  end    
endmodule