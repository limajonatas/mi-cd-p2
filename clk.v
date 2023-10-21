module clk(
    input clock,
    //input reset,
    output clock_out
);

    reg [15:0] count = 16'd0;
	 reg out = 1'b0;
    
    always @(posedge clock ) begin
        /*if (reset) begin
            out <= 1'b0;
            count <= 16'd0;
        end*/
        //else begin
            if (count == 16'b1111111111111111) begin
                out <= ~out;
                count <= 16'd0;
            end
            else begin
                count <= count + 16'd1;
            end
        //end
    end
	 
	 assign clock_out = out;
endmodule
