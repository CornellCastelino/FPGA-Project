// Listing 1.4
module greater2
   (
    input  wire[1:0] a, b,			
    output wire aeqb
   );
   // internal signal declaration, used to wire outpus of the 1 bit comparators
   wire e0;
   // body
   greater eq_bit0_unit (.i1(a[0]), .i0(a[1]), .i3(b[0]), .i2(b[1]), .eq(e0));
   
   assign aeqb = e0 ;
endmodule