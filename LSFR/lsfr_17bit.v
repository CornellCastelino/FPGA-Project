module lsfr_17bit #(parameter seed = 17'b101011)	
(input	clk,sh_en, rst_n,	
output [16:0] Q_out,
output reg max_tick_reg);
		
reg [16:0] Q_state;	
wire [16:0] Q_ns;	

always @(posedge clk) begin	
    
    
    if (Q_state == seed)        //max tick logic
        max_tick_reg = 1'b1;
    else
        max_tick_reg = 1'b0;
        
    if	(rst_n)	
        Q_state	<=	seed;
    else if (!(sh_en & (Q_state == 17'b11000000000001010)))             // pauses when sh_en is low
        Q_state	<=	Q_ns;
  
end	
    
//next	state	logic
assign	Q_fb	=	Q_state[13]	^	Q_state[16];	
assign	Q_ns	=	{Q_state[15:0],Q_fb};	
//output	logic
assign	Q_out	=	Q_state;	
endmodule
