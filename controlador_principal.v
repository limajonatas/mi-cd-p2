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
   output reg [6:0] coluna5_saida
);
	reg [6:0] coluna1_jogo_salvo = 7'b1111111;
	reg [6:0] coluna2_jogo_salvo = 7'b1111111;
	reg [6:0] coluna3_jogo_salvo = 7'b1111111;
	reg [6:0] coluna4_jogo_salvo = 7'b1111111;
	reg [6:0] coluna5_jogo_salvo = 7'b1111111;
	

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
            end
        end else begin
            // Desliga todas as saídas se o jogo não estiver ligado
            coluna1_saida = 7'b1111111;
            coluna2_saida = 7'b1111111;
            coluna3_saida = 7'b1111111;
            coluna4_saida = 7'b1111111;
            coluna5_saida = 7'b1111111;
        end
    end
endmodule