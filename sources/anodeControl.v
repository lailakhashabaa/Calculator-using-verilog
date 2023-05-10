`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 12:18:52 PM
// Design Name: 
// Module Name: anodeControl
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


module anodeControl(
input [1:0] refreshcounter,
output reg [3:0] anode =0
    );
    
    always @(refreshcounter)
    begin 
    case(refreshcounter)
    2'b00:
      anode= 4'b1110;
    2'b01:
      anode= 4'b1101;
    2'b10:
      anode= 4'b1011;
    2'b11:
      anode= 4'b0111;
      
      endcase
      end
     
endmodule
