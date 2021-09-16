module AorB(
    input[5:0] A, B,
    input[2:0] fxn,
    output [5:0] out
);
wire [5:0] Tog1, Tog2, max, p, q, r, s;
assign Tog1 = 6'b111111;


bit6_ripple_adder first ( .x(!Tog1),.y(Tog1),.sel(fxn[0]), .sum(max));
bit6_ripple_adder second ( .x(!Tog1),.y(Tog1),.sel(fxn[2]), .sum(Tog2));


assign p = A & max & Tog2;
assign q = A & !max & Tog2;

bit6_ripple_adder fourth ( .x(!Tog1),.y(p),.sel(fxn[1]), .sum(r));
bit6_ripple_adder fifth ( .x(!Tog1),.y(q),.sel(fxn[1]), .sum(s));

assign out = max;

endmodule