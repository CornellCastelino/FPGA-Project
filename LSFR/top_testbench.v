`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2020 03:45:32 PM
// Design Name: 
// Module Name: top_testbench
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


module top_testbench;

reg clk,reset;
wire [7:0] disp;
wire [3:0] an;
                                    // for faster clk cycle
top tp ( .clk(clk),.reset(reset),.dispToggle(1'b0),.clkscale(3'b111),.sseg(disp),.an(an));
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
    #10000000;
    reset = 1'b0;
    #100;
    end

endmodule
