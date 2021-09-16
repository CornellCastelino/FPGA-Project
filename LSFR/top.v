
module top(
    input clk, reset,dispToggle,
    input [2:0]clkscale,
    output [7:0]sseg,
    output [3:0]an
    );
    wire newclk, max_tick_out;
    wire [16:0] Output, count;
    wire en = 1'b1;
    //intantiation of all modules
    lsfr_17bit  lsfr  (.clk(newclk),.sh_en(dispToggle),.rst_n(reset),.Q_out(Output),.max_tick_reg(max_tick_out));
    MSB_counter sequenceDetector (.clk(newclk),.msb(Output[16]),.max_tick(max_tick_out),.out(count));
    clkscale clkscl  ( .clk(clk),.reset(reset), .factor(clkscale),.newclk(newclk));
    SevenSegdisp SevenSegDisp (.clk(newclk),.reset(max_tick_out),.Value(count),.an(an),.sseg(sseg),.toggle(dispToggle));
endmodule
