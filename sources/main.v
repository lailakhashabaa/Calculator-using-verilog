module topmodule( input clk,
input rst,
output [3:0] anode,
output [7:0] cathode,
input B1, B2, B3, B4,
input [4:0] operation);

wire refreshclock;
wire [1:0] refreshcounter;


wire [3:0] digit1;
wire [3:0] digit2;
wire [3:0] digit3;
wire [3:0] digit4;

wire [7:0] digit1disp;
wire [7:0] digit2disp;
wire [7:0] digit3disp;
wire [7:0] digit4disp;

wire dot;

wire [3:0] final1, final2, final3, final4; 
wire [13:0] result;     
wire negative_sign;                

clockDivider refreshclockGenerator( .clk(clk),.clk_out(refreshclock),.rst(rst));
refreshCounter counter(.refreshClock(refreshclock),.refreshcounter(refreshcounter));


anodeControl anodeControl(.refreshcounter(refreshcounter),.anode(anode));

increment case1(.clk(refreshclock), .rst(rst),.button(B1),.in(digit1));
increment case2(.clk(refreshclock), .rst(rst),.button(B2),.in(digit2));
increment case3(.clk(refreshclock), .rst(rst),.button(B3),.in(digit3));
increment case4(.clk(refreshclock), .rst(rst),.button(B4),.in(digit4));

operations operate(.clk(refreshclock),.operation(operation), .reset(rst), .dig1(digit1), .dig2(digit2), .dig3(digit3),.dig4(digit4), .result(result), .negative_sign(negative_sign),.dot(dot));
seperate_results seperate(.clk(refreshclock), .result(result), .final1(final1), .final2(final2), .final3(final3), .final4(final4));

seven_seg display1(.clk(refreshclock),.in(final1),.dot(1),.rst(rst),.out(digit1disp));
seven_seg display2(.clk(refreshclock),.in(final2),.dot(1),.rst(rst),.out(digit2disp));
seven_seg display3(.clk(refreshclock),.in(final3),.dot(dot),.rst(rst),.out(digit3disp));
seven_seg display4(.clk(refreshclock),.in((negative_sign) ? 4'b1010 : final4),.dot(1),.rst(rst),.out(digit4disp)); 


BCDcontrol control(.digit1(digit1disp), .digit2(digit2disp),.digit3(digit3disp), .digit4(digit4disp),.refreshcounter(refreshcounter),.outDigit(cathode));

endmodule

