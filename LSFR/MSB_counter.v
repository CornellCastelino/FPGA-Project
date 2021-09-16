module MSB_counter(
    input msb,clk,max_tick,
    output reg [16:0] out
    );
    
    reg [2:0]s;//state
    wire [2:0]ns;//next state
    wire x;
    always @(posedge clk)
    begin
        if( max_tick)begin
            out <= 17'b0;// counter 
            s <= 3'b0;  
            end
        else begin
            s <= ns;
            if(s[2] & x)
                out <= out + 1'b1; 
        end         
    end
    assign ns[0] = (~s[2]&~s[0]&(msb&~s[1] | ~msb&s[1])) | msb;// transition logic derived from K-map.
    assign ns[1] = ~msb&~s[2]&( ~s[1]&s[0] | s[1]&~s[0]);
    assign ns[2] = ~msb&~s[2]&s[1]&s[0];
    assign x = msb;

endmodule
