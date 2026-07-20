`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 12:03:11
// Design Name: 
// Module Name: ALU16bit
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


module ALU16bit(
   input [15:0]a,
   input [15:0]b,
   input [3:0]sel,
   output reg[15:0]result,
   output reg carry,
   output zero
   );
   
   always @(*)begin
     carry = 0;
     case(sel)
       4'b0000 : {carry,result} = a+b;
       4'b0001 : {carry,result} = a-b;
       4'b0010 : result = a&b;
       4'b0011 : result = a|b;
       4'b0100 : result = a^b;
       4'b0101 : result = ~a;
       4'b0110 : result = ~(a&b);
       4'b0111 : result = ~(a|b); 
       4'b1000 : result = ~(a^b);     
       4'b1001 : result = a>>b;
       4'b1010 : result = a<<b;
       4'b1011 : result = (a==b);
       4'b1100 : result = (a>b);
       4'b1101 : result = (a<b);
       4'b1110 : result = a*b;
       4'b1111 : result = 16'b0;
       default : result = 16'b0;
     endcase
   end
   
   assign zero = (result == 16'b0);
 
endmodule
