module controlador_principal(
	input modo,
	input ligado,
	input salvar_jogo,
	input confirmar_ataque,
	input [2:0] ataque_colunas,
	input [2:0] ataque_linhas,
	input [6:0] coluna1_posicionamento,
   input [6:0] coluna2_posicionamento,
   input [6:0] coluna3_posicionamento,
   input [6:0] coluna4_posicionamento,
   input [6:0] coluna5_posicionamento,
	output reg [6:0] coluna1_saida,
   output reg [6:0] coluna2_saida,
   output reg [6:0] coluna3_saida,
   output reg [6:0] coluna4_saida,
   output reg [6:0] coluna5_saida,
	output reg led
);
	reg [6:0] coluna1_jogo_salvo = 7'b1111111;
	reg [6:0] coluna2_jogo_salvo = 7'b1111111;
	reg [6:0] coluna3_jogo_salvo = 7'b1111111;
	reg [6:0] coluna4_jogo_salvo = 7'b1111111;
	reg [6:0] coluna5_jogo_salvo = 7'b1111111;
	

	parameter SETE_ALTOS = 7'b1111111;

	always @* begin
        if (ligado) begin
            if (modo == 1'b0) begin
                coluna1_saida = coluna1_posicionamento;
                coluna2_saida = coluna2_posicionamento;
                coluna3_saida = coluna3_posicionamento;
                coluna4_saida = coluna4_posicionamento;
                coluna5_saida = coluna5_posicionamento;
                
                if (salvar_jogo) begin
                    coluna1_jogo_salvo = coluna1_posicionamento;
                    coluna2_jogo_salvo = coluna2_posicionamento;
                    coluna3_jogo_salvo = coluna3_posicionamento;
                    coluna4_jogo_salvo = coluna4_posicionamento;
                    coluna5_jogo_salvo = coluna5_posicionamento;
                end
            end else begin
                coluna1_saida = coluna1_jogo_salvo;
                coluna2_saida = coluna2_jogo_salvo;
                coluna3_saida = coluna3_jogo_salvo;
                coluna4_saida = coluna4_jogo_salvo;
                coluna5_saida = coluna5_jogo_salvo;
					 if(confirmar_ataque) begin
						/*COLUNA 1 LINHA 1*/
						if(coluna1_jogo_salvo[0] == 1'b0 && ataque_colunas==3'b001 && ataque_linhas==3'b001)
							led <= 1'b1;
						else if(coluna1_jogo_salvo[1] == 1'b0 && ataque_colunas==3'b001 && ataque_linhas==3'b010)
							led <= 1'b1;
						else if(coluna1_jogo_salvo[2] == 1'b0 && ataque_colunas==3'b001 && ataque_linhas==3'b011)
							led <= 1'b1;
						else if(coluna1_jogo_salvo[3] == 1'b0 && ataque_colunas==3'b001 && ataque_linhas==3'b100)
							led <= 1'b1;
						else if(coluna1_jogo_salvo[4] == 1'b0 && ataque_colunas==3'b001 && ataque_linhas==3'b101)
							led <= 1'b1;
						else if(coluna1_jogo_salvo[5] == 1'b0 && ataque_colunas==3'b001 && ataque_linhas==3'b110)
							led <= 1'b1;
						else if(coluna1_jogo_salvo[6] == 1'b0 && ataque_colunas==3'b001 && ataque_linhas==3'b111)
							led <= 1'b1;
					 end
            end
        end else begin
            // Desliga todas as saídas se o jogo não estiver ligado
            coluna1_saida = SETE_ALTOS;
            coluna2_saida = SETE_ALTOS;
            coluna3_saida = SETE_ALTOS;
            coluna4_saida = SETE_ALTOS;
            coluna5_saida = SETE_ALTOS;
				coluna1_jogo_salvo = SETE_ALTOS;
				coluna2_jogo_salvo = SETE_ALTOS;
				coluna3_jogo_salvo = SETE_ALTOS;
				coluna4_jogo_salvo = SETE_ALTOS;
				coluna5_jogo_salvo = SETE_ALTOS;
        end
    end
endmodule