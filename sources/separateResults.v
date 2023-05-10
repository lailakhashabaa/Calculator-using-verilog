`timescale 1ns / 1ps



module seperate_results(input clk,
input [13:0] result,

output reg [3:0] final1, final2, final3, final4
    );
    always @(posedge clk) begin
        
        final1<= (result)%10;
        final2<= (result/10)%10;
        final3<= (result/100)%10;
        final4<= (result/1000)%10;
    end
    
endmodule

