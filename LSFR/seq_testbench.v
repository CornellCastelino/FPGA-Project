`timescale 1ns / 10ps

module seq_testbench;
    
reg clk, reset, MSb;
wire [16:0] count1; 


MSB_counter MsB (.clk(clk),.msb(MSb),.max_tick(reset),.out(count1));
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
        #200;
        reset = 1'b0;
        #100;
      
    end
    
 initial
    begin   // there should 7 identifications of the input codeword
        //test vector 1
        #200
        MSb = 1'b1; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b1; 
        #20;
        // ...
        //test vector 2
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b1; 
        #20;
        MSb = 1'b1; 
        #20;
        // ...
        //test vector 3
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b1; 
        #20;
        MSb = 1'b0; 
        #20;
        // ...
         //test vector 4
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b1; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        // ...
        //test vector 5
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b1; 
        #20;
        // ...
         //test vector 6
        MSb = 1'b1; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b1; 
        #20;
        MSb = 1'b0; 
        #20;
        MSb = 1'b1; 
        #20;
        // ...
        
    end  

endmodule
