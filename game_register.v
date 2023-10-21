module game_register(
	input register_game,
	input reset,
	input [3:0] game_selected,
	output [6:0] col1_out,
	output [6:0] col2_out,
	output [6:0] col3_out,
	output [6:0] col4_out,
	output [6:0] col5_out
);
	reg game_save = 1'b0;
	reg [6:0] col1 = 7'b00000000;
	reg [6:0] col2 = 7'b00000000;
	reg [6:0] col3 = 7'b00000000;
	reg [6:0] col4 = 7'b00000000;
	reg [6:0] col5 = 7'b00000000;

	/*O register e reset são acionados apenas e o status do 
	jogo estiver no modo posicionamento controlador principal*/
	always @(posedge register_game or posedge reset) begin
		if(register_game)
			game_save = 1'b1;
		else if(reset)
			game_save = 1'b0;
		else 
			game_save = 1'b0;
	end

	always @(*) begin
		if(!game_save) begin
			case (game_selected)
				4'b0001: begin //JOGO 1
					col1 <= 7'b0111100;
					col2 <= 7'b0011101;
					col3 <= 7'b0110101;
					col4 <= 7'b1000111;
					col5 <= 7'b1110111;
				end
				4'b0010: begin //JOGO 2
					col1 <= 7'b0001101;
					col2 <= 7'b1011100;
					col3 <= 7'b1011101;
					col4 <= 7'b1110111;
					col5 <= 7'b1000111;
				end
			endcase
		end
	end
	
	assign col1_out = col1;
	assign col2_out = col2;
	assign col3_out = col3;
	assign col4_out = col4;
	assign col5_out = col5;
endmodule
			
		