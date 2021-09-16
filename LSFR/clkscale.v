module clkscale(
    input clk,reset,
    input [2:0]factor,
    output reg newclk
    );
    reg [26:0] count = 0;
    localparam Time = 200000;//arbitrary value used for the display to work properly
    always @(posedge clk)
    begin   
        if(reset)
            begin
                count <=0;
                newclk <=0;
            end
        count <= count + 1;
        if(count >= Time>>factor)// logic shitft right to decrease the value of the Time scale.
            begin
                newclk <= !newclk;
                count <= 0;
                
            end
    end
endmodule
