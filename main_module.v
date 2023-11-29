module main_module(
	input onOff,
	input status, //chave 0 -> posicionamento / 1-> ataque
	input attack_button, 
	input change_game_button,//mudar jogo
	input save_game_button, //salvar game selecionado
	input reset_game_button,
   input clock,
	input [2:0] columns_attack,
	input [2:0] rows_attack,
	output  [4:0] columns,
   output [6:0] lines
);
	wire clock381HZ, change_game_button_wire, reset_game_button_wire, wire_save_game, wire_attack_button, game_selected_wire;
	//wire col1_out_hit, col2_out_hit, col3_out_hit, col4_out_hit, col5_out_hit;
	wire col1_out, col2_out, col3_out, col4_out, col5_out;
	wire col1_in, col2_in, col3_in, col4_in, col5_in; //game_selection para main_controller
	
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
	
	//Debouncer para botão de atacar
	debouncer_button btn_attack(
		.button(attack_button),
		.clk(clock381HZ),
		.button_out(wire_attack_button)
	);
	/*
	game_option_change change_game(
		.game_option(game_selected_wire),
		.game_change_button(change_game_button_wire)
	);*/
	
	//seleção do jogo - MODO POSICIONAMENTO
	game_selection select_game_option(
		.button(change_game_button_wire),
		.col1_out(col1_in),
		.col2_out(col2_in),
		.col3_out(col3_in),
		.col4_out(col4_in),
		.col5_out(col5_in)
	);
	
	main_controller controller(
		 .save_game(wire_save_game),
		 .reset(reset_game_button_wire),
		 .onOff(onOff),
		 .status(status), //chave 0 -> posicionamento / 1-> ataque
		 .attack_button(wire_attack_button), 
		 .col1_in(col1_in),
		 .col2_in(col2_in),
		 .col3_in(col3_in),
		 .col4_in(col4_in),
		 .col5_in(col5_in),
		 .col1_out(col1_out),
		 .col2_out(col2_out),
		 .col3_out(col3_out),
		 .col4_out(col4_out),
		 .col5_out(col5_out),
		 .columns_attack(columns_attack),
		 .rows_attack(rows_attack)
	);
	
    matriz_controller matrix(
		 .col1(col1_in), 
		 .col2(col2_in),
		 .col3(col3_in),
		 .col4(col4_in),
		 .col5(col5_in),
       .clk(clock381HZ),
       .columns(columns),
       .lines(lines)
    );
	 
endmodule
