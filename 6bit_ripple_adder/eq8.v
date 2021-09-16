module eq8
   (
    input  wire[7:0] a, b,		
    output wire aeqb				
   );
   wire e0, e1, e2, e3, c0 , c1, c2, c3, a0, a1 ,a2 ,a3 ;
   // body
   greater2 bit2_0 (.a(a[7:6]), .b(b[7:6]), .aeqb(e0));
   greater2 bit2_1 (.a(a[5:4]), .b(b[5:4]), .aeqb(e1));
   greater2 bit2_2 (.a(a[3:2]), .b(b[3:2]), .aeqb(e2));
   greater2 bit2_3 (.a(a[1:0]), .b(b[1:0]), .aeqb(e3));
   
   equal2 comp0 (.a(a[7:6]), .b(b[7:6]), .aeqb(c0));
   equal2 comp1 (.a(a[5:4]), .b(b[5:4]), .aeqb(c1));
   equal2 comp2 (.a(a[3:2]), .b(b[3:2]), .aeqb(c2));
   equal2 comp3 (.a(a[1:0]), .b(b[1:0]), .aeqb(c3));
   
  // assign a0 = c0 & c1 & c2 & c3; // equality
   assign a1 =  e3 & c0 & c1 & c2; //  1st 6 bits equall, last 2bits greater than
   assign a2 = e2 & c0 & c1; // 1st 4 bits equall, next 2 bits greater than
   assign a3 = e1 & c0;// 1st 2bits equall, next 2 bits greater than
   
   assign aeqb =  a1 | a2 | a3 | e0 ; // e0 is first 2 bits greater than
endmodule
