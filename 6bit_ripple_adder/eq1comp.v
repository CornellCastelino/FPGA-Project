// Listing 1.1
module equal
   // I/O ports
   (
    input wire i0, i1,
    output wire eq
   );

   assign eq = !(i0 ^ i1);


endmodule