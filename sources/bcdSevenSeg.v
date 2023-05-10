
module seven_seg(
input clk,
input rst,
input [3:0] in,
input dot,
output reg [7:0] out

    );
    

    always @(posedge(clk)) begin
    
                    case(in)
                        4'b0000:            //0
                        out[6:0] = 7'b0000001;    
                        4'b0001:            //1
                         out[6:0] = 7'b1001111;
                        4'b0010:            //2
                         out[6:0] = 7'b0010010; 
                        4'b0011:            //3
                         out[6:0] = 7'b0000110;
                        4'b0100:            //4
                         out[6:0] = 7'b1001100;
                        4'b0101:            //5
                         out[6:0] = 7'b0100100;
                        4'b0110:            //6
                         out[6:0] = 7'b0100000;
                        4'b0111:            //7
                         out[6:0] = 7'b0001111;
                        4'b1000:            //8
                         out[6:0] = 7'b0000000;
                        4'b1001:            //9
                         out[6:0] = 7'b0000100;
                        4'b1010://negative sign
                         out[6:0] = 7'b1111110;                        

                    endcase 
                    out[7] <= dot;
                   
             
    end
    
    
  
endmodule
