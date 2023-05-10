`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 12:16:58 PM
// Design Name: 
// Module Name: refreshCounter
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


module refreshCounter(
input refreshClock,
output reg[1:0] refreshcounter=0

    );
    always@(posedge refreshClock)
    refreshcounter <= refreshcounter +1;// counts from 0-3
endmodule
