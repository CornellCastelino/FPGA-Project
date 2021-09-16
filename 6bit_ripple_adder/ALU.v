module ALU(
        input [5:0] A,B,
        input [2:0] Fxn,
        output [5:0] out
    );
    fxn ans (.A(A), .B(B), .fxn(Fxn), .out(out));
endmodule
