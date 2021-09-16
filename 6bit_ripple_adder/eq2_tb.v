// Listing 1.7
// The `timescale directive specifies that
// the simulation time unit is 1 ns  and
// the simulation timestep is 10 ps
`timescale 1 ns/10 ps

module eq4_testbench;
   // signal declaration
   
   reg  [5:0] test_inA, test_inB;
   wire [5:0] test_out;
   reg [2:0] Fxn;
   integer i = 0;

   // instantiate the circuit under test
   AorB uut (.A(test_inA), .B(test_inB), .out(test_out), .fxn(Fxn));
//    bit6_ripple_adder uut (.x(test_inA), .y(test_inB), .sum(test_out) );
   
   //  test vector generator
   initial
   begin
   for(i = 0; i <=20; i = i + 1)
        begin
          // test vector 1
          test_inA = $urandom %64;
          test_inB = $urandom %64;
          Fxn = $urandom %8;
          #200;
       end
      // stop simulation
      $stop;
    end
    //display
    initial 
    begin
    $display ("                    time test-in0 test-in1 test-out  ");
    $monitor (" %d     %b       %b       %b   " ,$time, test_inA , test_inB , test_out) ; 
    end
endmodule