`timescale 1ns / 1ps

module bit6_ripple_adder(
    input [5:0] x, y, 
    input sel,
    output overflow, c_out,
    output [5:0] sum,
    output [5:0] carry
    );
    wire [5:0] z; //  new y input for adjustment of 2's complement
    wire Cin; // deflaut wire  for first cin
    

   assign z[0] = y[0] ^ sel;
    assign z[1] = y[1] ^ sel;
    assign z[2] = y[2] ^ sel;
    assign z[3] = y[3] ^ sel;
    assign z[4] = y[4] ^ sel;
    assign z[5] = y[5] ^ sel;
    
    // 6 instances of 1-bit fulladder 
    
    FullAdder bit0 (.a(x[0]), .b(z[0]), .cin(sel), .cout(carry[0]), .s(sum[0]));
    FullAdder bit1 (.a(x[1]), .b(z[1]), .cin(carry[0]), .cout(carry[1]), .s(sum[1]));
    FullAdder bit2 (.a(x[2]), .b(z[2]), .cin(carry[1]), .cout(carry[2]), .s(sum[2]));
    FullAdder bit3 (.a(x[3]), .b(z[3]), .cin(carry[2]), .cout(carry[3]), .s(sum[3]));
    FullAdder bit4 (.a(x[4]), .b(z[4]), .cin(carry[3]), .cout(carry[4]), .s(sum[4]));
    FullAdder bit5 (.a(x[5]), .b(z[5]), .cin(carry[4]), .cout(carry[5]), .s(sum[5]));
    assign c_out = carry[5];            
    assign overflow = c_out ^ carry[4]; 
   
    
    
endmodule
