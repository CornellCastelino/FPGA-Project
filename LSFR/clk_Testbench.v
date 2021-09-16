`timescale 1ns / 1ps

module clk_Testbench;

reg clk,reset;
wire clk4,clk2,clk3;

clkscale scl (.clk(clk),.reset(reset),.factor(3'b0),.newclk(clk4));
clkscale scl1 (.clk(clk),.reset(reset),.factor(3'b011),.newclk(clk2));
clkscale scl2 (.clk(clk),.reset(reset),.factor(3'b111),.newclk(clk3));
always 
        begin
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;
        end
initial
    begin 
    reset = 1'b1;
    #100;
    reset = 1'b0;
    #100;
    end

endmodule
