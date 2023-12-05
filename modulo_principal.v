module modulo_principal(
	input botao_mudar_jogo,
	input clock,
	input modo,
	inout botao_salvar_jogo,
	input ligado,
	input botao_confirmar_ataque,
	input [2:0] ataque_colunas,
	input [2:0] ataque_linhas,
	output [4:0] colunas,
   output [6:0] linhas,
	output [1:0] ledRGB
);

	wire clock_saida_381HZ, botao_mudar_jogo_saida, botao_salvar_jogo_saida, botao_confirmar_ataque_saida;
	wire [6:0] coluna1_posicionamento, coluna2_posicionamento, coluna3_posicionamento; 
	wire [6:0] coluna4_posicionamento, coluna5_posicionamento;
	wire [6:0] coluna1_saida, coluna2_saida, coluna3_saida, coluna4_saida, coluna5_saida;
	
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
	
	//Debouncer para botão confirmar ataque
	tratar_botao tratar_botao_confirmar_ataque(
		.botao(botao_confirmar_ataque),
		.clock(clock_saida_381HZ),
		.botao_saida(botao_confirmar_ataque_saida)
	);
	
	//Debouncer para botão salvar jogo
	tratar_botao tratar_botao_salvar_jogo(
		.botao(botao_salvar_jogo),
		.clock(clock_saida_381HZ),
		.botao_saida(botao_salvar_jogo_saida)
	);
	
	mudar_jogo mudar_jogo(
		.botao(botao_mudar_jogo_saida),
		.coluna1(coluna1_posicionamento),
		.coluna2(coluna2_posicionamento),
		.coluna3(coluna3_posicionamento),
		.coluna4(coluna4_posicionamento),
		.coluna5(coluna5_posicionamento)
	);

	controlador_principal controlador(
		.modo(modo),
		.ligado(ligado),
		.salvar_jogo(botao_salvar_jogo_saida),
		.confirmar_ataque(botao_confirmar_ataque_saida),
		.ataque_colunas(ataque_colunas),
		.ataque_linhas(ataque_linhas),
		.coluna1_posicionamento(coluna1_posicionamento),
		.coluna2_posicionamento(coluna2_posicionamento),
		.coluna3_posicionamento(coluna3_posicionamento),
		.coluna4_posicionamento(coluna4_posicionamento),
		.coluna5_posicionamento(coluna5_posicionamento),
		.coluna1_saida(coluna1_saida),
		.coluna2_saida(coluna2_saida),
		.coluna3_saida(coluna3_saida),
		.coluna4_saida(coluna4_saida),
		.coluna5_saida(coluna5_saida),
		.ledRGB(ledRGB)
		);
	
	matriz matriz(
		 .coluna1(coluna1_saida), 
		 .coluna2(coluna2_saida),
		 .coluna3(coluna3_saida),
		 .coluna4(coluna4_saida),
		 .coluna5(coluna5_saida),
       .clock(clock_saida_381HZ),
       .colunas(colunas),
       .linhas(linhas)
		 );
 

endmodule