// Listing 1.1
module greater
   (
    input wire i0, i1, i2, i3,
    output wire eq
   );
   // signal declaration
   wire p0, p1, p2;
   // product terms
   assign p0 = i0 & ~i2;
   assign p1 = i1 & ~i2 & ~i3;
   assign p2 = i0 & i1 & i2 & ~i3;
   // sum of two product terms
   assign eq = p0 | p1 | p2 ;
endmodule