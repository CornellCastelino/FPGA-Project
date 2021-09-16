module fxn(
    input [5:0] A, B,
    input [2:0] fxn,
    output [5:0] out
    );
        
    AorB first ( .A(A), .B(B), .fxn(fxn), .out(out));
    
    endmodule