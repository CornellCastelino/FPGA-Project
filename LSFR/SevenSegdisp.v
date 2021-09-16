module SevenSegdisp(
    input clk, reset,toggle,// toggle is used to pause the seven seg display
    input [16:0] Value,
    output reg [3:0]an,
    output reg [7:0] sseg
    
    );
    reg [3:0] hex_in;
    reg [1:0]q_reg;
    wire [1:0] q_next;
    
    always @(posedge clk , posedge reset)
        begin   
            if(reset) 
                q_reg <= 0;
            else if(!(toggle & reset))
                q_reg <= q_next;
        end
    assign q_next = q_reg +1;
   // 2 MSBs of counter to control 4-to-1 multiplexing
   // and to generate active-low enable signal
   always @*
      case (q_reg)
         2'b00:
            begin
               an =  4'b1110;
               hex_in =  Value[3:0];
            end
         2'b01:
            begin
               an =  4'b1101;
               hex_in =  Value[7:4];
            end
         2'b10:
            begin
               an =  4'b1011;
               hex_in =  Value[11:8];
            end
         default:
            begin
               an =  4'b0111;
               hex_in =  Value[15:12] ;
            end
       endcase
       // hex to seven-segment led display
   always @*
   begin
      case(hex_in)
         4'b0000: sseg[6:0] = 7'b0000001;
         4'b0001:  sseg[6:0] = 7'b1001111;
         4'b0010:  sseg[6:0] = 7'b0010010;
         4'b0011:  sseg[6:0] = 7'b0000110;
         4'b0100:  sseg[6:0] = 7'b1001100;
         4'b0101:  sseg[6:0] = 7'b0100100;
         4'b0110:  sseg[6:0] = 7'b0100000;
         4'b0111:  sseg[6:0] = 7'b0001111;
         4'b1000:  sseg[6:0] = 7'b0000000;
         4'b1001:  sseg[6:0] = 7'b0000100;
         4'b1010:  sseg[6:0] = 7'b0001000;
         4'b1011:  sseg[6:0] = 7'b1100000;
         4'b1100:  sseg[6:0] = 7'b0110001;
         4'b1101:  sseg[6:0] = 7'b1000010;
         4'b1110: sseg[6:0] = 7'b0110000;
         4'b1111:  sseg[6:0] = 7'b0111000;
         default: sseg[6:0] = 7'b1111111;  
         
     endcase
      sseg[7] = 1'b1;
   end
   
    
endmodule
