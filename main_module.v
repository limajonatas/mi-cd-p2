module main_module(
	input [1:0]status,
	input [2:0] columns_attack,
	input [2:0] rows_attack,
	input attack_button,
	input change_game_button,//mudar jogo
	input select_game_button, //selecionar jogo em exibição (não salva)
	input save_game_button, //salvar game selecionado
	input reset_game_button,
   input clock,
   output [4:0] columns,
   output [6:0] lines,
	output clock_output
);
	wire clock381HZ, change_game_button_wire, game_selected_wire, reset_game_button_wire, wire_save_game;
	wire col1_out, col2_out, col3_out, col4_out, col5_out;
	
	// divisor de clock
    clk clock_divider(
        .clock(clock),
        .clock_out(clock381HZ)
    );
	 
	//Debouncer para botão de mudar o jogo
	debouncer_button btn_change_game(
		.button(change_game_button),
		.clk(clock381HZ),
		.button_out(change_game_button_wire)
	);
	
	//Debouncer para botão de mudar o jogo
	debouncer_button btn_reset_game(
		.button(reset_game_button),
		.clk(clock381HZ),
		.button_out(reset_game_button_wire)
	);
	
	//Debouncer para botão de mudar o jogo
	debouncer_button btn_save_game(
		.button(save_game_button),
		.clk(clock381HZ),
		.button_out(wire_save_game)
	);
	
	//Selecionar a opção do jogo
	game_option_change change_game_option(
		.game_option(game_selected_wire),
		.game_change_button(change_game_button_wire)
	);
	
	//seleção do jogo - MODO POSICIONAMENTO
	game_selection select_game_option(
		.reset(reset_game_button_wire),
		.select_game(select_game_button),
		.game_selected_option(game_selected_wire),
		.col1_out(col1_out),
		.col2_out(col2_out),
		.col3_out(col3_out),
		.col4_out(col4_out),
		.col5_out(col5_out)
	);
	
    matriz_controller matrix(
		 .show(2'b01),
		 .col1(col1_out),
		 .col2(col2_out),
		 .col3(col3_out),
		 .col4(col4_out),
		 .col5(col5_out),
		 .colHit1(7'b0000000),
		 .colHit2(7'b0000000),
		 .colHit3(7'b0000000),
		 .colHit4(7'b0000000),
		 .colHit5(7'b0000000),
       .clk(clock381HZ),
       .columns(columns),
       .lines(lines)
    );
	 
	 assign clock_output = clock381HZ;
endmodule
