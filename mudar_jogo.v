/*MÓDULO RESPONSÁVEL POR SELECIONAR O JOGO*/
module mudar_jogo(
    input botao,
    output reg [6:0] coluna1,
    output reg [6:0] coluna2,
    output reg [6:0] coluna3,
    output reg [6:0] coluna4,
    output reg [6:0] coluna5
);
    reg [1:0] jogo = 2'd0;
    parameter SETE_ALTOS = 7'b1111111;

	 	initial begin
		coluna1 = 7'b1111111;
		coluna2 = 7'b1111111;
		coluna3 = 7'b1111111;
		coluna4 = 7'b1111111;
		coluna5 = 7'b1111111;
	end
	 
    always @(posedge botao) begin
        case(jogo)
            2'd0: begin // JOGO 1
                coluna1 <= 7'b0111100;
                coluna2 <= 7'b0011101;
                coluna3 <= 7'b0110101;
                coluna4 <= 7'b1000111;
                coluna5 <= 7'b1110111;
                jogo <= jogo + 1;
            end
            2'd1: begin // JOGO 2
                coluna1 <= 7'b0001101;
                coluna2 <= 7'b1011100;
                coluna3 <= 7'b1011101;
                coluna4 <= 7'b1110111;
                coluna5 <= 7'b1000111;
                jogo <= jogo + 1;
            end
            2'd2: begin // JOGO 3
                coluna1 <= 7'b0111000;
                coluna2 <= 7'b0001110;
                coluna3 <= 7'b0111111;
                coluna4 <= 7'b1111101;
                coluna5 <= 7'b1111000;
                jogo <= jogo + 1;
            end
            2'd3: begin // JOGO 4
                coluna1 <= 7'b1100011;
                coluna2 <= 7'b1110111;
                coluna3 <= 7'b1111101;
                coluna4 <= 7'b0111101;
                coluna5 <= 7'b0001000;
                jogo <= 2'd0;
            end
            default: begin // ERROR
                coluna1 <= SETE_ALTOS;
                coluna2 <= SETE_ALTOS;
                coluna3 <= SETE_ALTOS;
                coluna4 <= SETE_ALTOS;
                coluna5 <= SETE_ALTOS;
            end
        endcase
    end
endmodule
