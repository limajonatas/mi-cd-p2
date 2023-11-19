module matriz_controller(
    input clk,
	 input [1:0] show, //exibe o tabuleiro ou os "pontos" de acerto 
	 /*colunas que pre-visualiza os jogos*/
	 input [6:0] col1,
	 input [6:0] col2,
	 input [6:0] col3,
	 input [6:0] col4,
	 input [6:0] col5,
	 /*colunas que visualiza pixel de acerto*/
	 input [6:0] colHit1,
	 input [6:0] colHit2,
	 input [6:0] colHit3,
	 input [6:0] colHit4,
	 input [6:0] colHit5,
    output reg [4:0] columns,
    output reg [6:0] lines
);

    reg [3:0] count = 4'd0;

    always @(posedge clk) begin
		if(show[0]) begin //EXIBE O TABULEIRO QUE O JOGADOR 1 DESEJA ESCOLHER 
			  case (count)
					4'd0: begin //COLUNA 01
						 columns <= 5'b00001;
						 count <= count + 1'b1;
						 //lines <= 7'b0111100;
						 lines <= col1;
					end
					4'd1: begin //COLUNA 02
						 columns <= 5'b00010;
						 count <= count + 1'b1;
						 //lines <= 7'b0011101;
						 lines <= col2;
					end
					4'd2: begin //COLUNA 03
						 columns <= 5'b00100;
						 count <= count + 1'b1;
						 //lines <= 7'b0110101;
						 lines <= col3;
					end
					4'd3: begin //COLUNA 04
						 columns <= 5'b01000;
						 count <= count + 1'b1;
						 ///lines <= 7'b1000111;
						 lines <= col4;
					end
					4'd4: begin //COLUNA 05
						 columns <= 5'b10000;
						 count <= 4'd0; // Reinicie o contador
						 //lines <= 7'b1110111;
						 lines <= col5;
					end
					default: begin //ERROR
						 count <= 4'd0;
						 lines <= 7'b0000000;
					end
			  endcase
			end
			else if(show[1]) begin //EXIBE NA MATRIZ OS PONTOS QUE O JOGADOR 2 ACERTOU O ALVO
				case (count)
					4'd0: begin //COLUNA 01
						 columns <= 5'b00001;
						 count <= count + 1'b1;
						 //lines <= 7'b0111100;
						 lines <= colHit1;
					end
					4'd1: begin //COLUNA 02
						 columns <= 5'b00010;
						 count <= count + 1'b1;
						 //lines <= 7'b0011101;
						 lines <= colHit2;
					end
					4'd2: begin //COLUNA 03
						 columns <= 5'b00100;
						 count <= count + 1'b1;
						 //lines <= 7'b0110101;
						 lines <= colHit3;
					end
					4'd3: begin //COLUNA 04
						 columns <= 5'b01000;
						 count <= count + 1'b1;
						 ///lines <= 7'b1000111;
						 lines <= colHit4;
					end
					4'd4: begin //COLUNA 05
						 columns <= 5'b10000;
						 count <= 4'd0; // Reinicie o contador
						 //lines <= 7'b1110111;
						 lines <= colHit5;
					end
					default: begin //ERROR
						 count <= 4'd0;
						 lines <= 7'b0000000;
					end
			  endcase
			end
			else begin
				count <= 4'd0;
				lines <= 7'b0000000;
			end
    end

endmodule
