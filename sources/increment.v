`timescale 1ns / 1ps



module increment(
input clk,
input rst,
input button,
output reg [3:0]in 

    );
   
        reg push_f;
       reg push_sync;
       reg push_sync_f;
       wire push_edge;
       
       always@(posedge clk) begin
           push_f <= button;
           push_sync <= push_f;    
       end
       
       always @(posedge clk, posedge rst) begin
       if (rst) begin
           push_sync_f <= 1'b0;
       end else begin
           push_sync_f <= push_sync;
           end
       end
       
       assign push_edge = push_sync & ~push_sync_f;
       
       always @(posedge clk, posedge rst)
       begin
       if(rst)begin
       
       in<=0;
       end
       else if (push_edge)
       begin
          if (in!=9)
          in<=in+1;
          else
          in<=0;
          end
      end
endmodule
