/*MÓDULO RESPONSÁVEL POR TRATAR O RUIDO DO BOTÃO*/
module debouncer_button(
	input button, 
	input clk, 
	output button_out);

reg [2:0] state = 3'b00;
reg debouncer = 1'b0;

always @(posedge clk) begin
	case (state)
		3'b00: begin
			if(button) state <= state + 1'b1;
		end
		3'b01: begin
			if(button) state <= state + 1'b1;
			else state <= 3'b0;
		end
		3'b10: begin 
			if(button) begin
				state <= state + 1'b1;
				debouncer <= 1'b1;
			end
			else state <= 3'b0;
		end
		3'b11: begin
			if(!button) begin
				state <= 3'b0;
				debouncer <= 1'b0;
			end
		end
	endcase			
end

assign button_out = debouncer;
endmodule