module modulo_principal(
	input botao_mudar_jogo,
	input clock,
	output [4:0] colunas,
   output [6:0] linhas
);
	wire clock_saida_381HZ, botao_mudar_jogo_saida;
	wire coluna1_posicionamento, coluna2_posicionamento,coluna3_posicionamento,coluna4_posicionamento,coluna5_posicionamento;
	
	// divisor de clock
    modulo_clock(
        clock,
        clock_saida_381HZ
    );
	 
	//Debouncer para botão de mudar o jogo
	tratar_botao tratar_botao_mudar_jogo(
		.botao(botao_mudar_jogo),
		.clock(clock_saida_381HZ),
		.botao_saida(botao_mudar_jogo_saida)
	);
	
	mudar_jogo mudar_jogo(
		.botao(botao_mudar_jogo_saida),
		.coluna1(coluna1_posicionamento),
		.coluna2(coluna2_posicionamento),
		.coluna3(coluna3_posicionamento),
		.coluna4(coluna4_posicionamento),
		.coluna5(coluna5_posicionamento)
		);
		
	
	matriz matriz(
		 .coluna1(coluna1_posicionamento), 
		 .coluna2(coluna2_posicionamento),
		 .coluna3(coluna3_posicionamento),
		 .coluna4(coluna4_posicionamento),
		 .coluna5(coluna5_posicionamento),
       .clock(clock_saida_381HZ),
       .colunas(colunas),
       .linhas(linhas)
		 );
 

endmodule