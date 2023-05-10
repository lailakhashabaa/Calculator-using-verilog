`timescale 1ns / 1ps

module BCDcontrol(
input [7:0] digit1,
input [7:0] digit2,
input [7:0] digit3,
input [7:0] digit4,
input [1:0] refreshcounter,
output reg [7:0] outDigit
    );
    
    always @(refreshcounter)
        begin 
        case(refreshcounter)
        2'd0:
          outDigit= digit1;
        2'd1:
          outDigit= digit2;
        2'd2:
          outDigit= digit3;
        2'd3:
          outDigit= digit4;
          
          endcase
          end
endmodule
