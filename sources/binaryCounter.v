module counter(
    input clk,
    input rst,
    input B,
    output reg [7:0] Q
    );
 
always @ (posedge(clk),posedge(B), posedge(rst))   // When will Always Block Be Triggered
begin
    if (rst == 1'b1)
        // How Output reacts when Reset Is Asserted
        Q <= 8'b0;
    else if (B==1'b1)
        // How Output reacts when Rising Edge of Clock Arrives?
        Q <= Q + 1'b1;
    if (Q== 4'b1001)
    Q <= 8'b0;
end
 
endmodule