`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 13:00:04
// Design Name: 
// Module Name: ALU16bit_tb1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 12:41:33
// Design Name: 
// Module Name: ALU16bit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU16bit_tb;
  reg [15:0]a;
  reg [15:0]b;
  reg [3:0]sel;
  wire [15:0]result;
  wire carry;
  wire zero;
  
  ALU16bit_tb uut(.a(a),
                  .b(b),
                  .sel(sel),
                  .result(result),
                  .carry(carry),
                  .zero(zero)
                  );
   initial begin
   
     a = 16'd20;
     b = 16'd10;
     
     sel=4'b0000;#10;
     sel=4'b0001;#10;
     sel=4'b0010;#10;
     sel=4'b0011;#10;
     sel=4'b0100;#10;
     sel=4'b0101;#10;
     sel=4'b0110;#10;
     sel=4'b0111;#10;
     sel=4'b1000;#10;
     sel=4'b1001;#10;
     sel=4'b1010;#10;
     sel=4'b1011;#10;
     sel=4'b1100;#10;
     sel=4'b1101;#10;
     sel=4'b1110;#10;
     sel=4'b1111;#10;
     $finish;
    end
        
  
endmodule

