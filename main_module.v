module main_module(
	input [1:0]status,
	input [2:0] columns_attack,
	input [2:0] rows_attack,
	input attack_button,
	input game_charge_button,
	input save_game_button,
	input reset_save_game_button,
   input clock,
   output [4:0] columns,
   output [6:0] lines,
	output clock_output
);
	wire clock381HZ, button_debouncer, wire_charge_game, game_selected, wire_reset_save_game, wire_save_game;
	wire col1_out, col2_out, col3_out, col4_out, col5_out;
	
	// divisor de clock
    clk clock_divider(
        .clock(clock),
        .clock_out(clock381HZ)
    );
	 
	//Debouncer para botão de mudar o jogo
	debouncer_button btn_charge_game(
		.button(game_charge_button),
		.clk(clock381HZ),
		.button_out(wire_charge_game)
	);
	
	//Debouncer para botão de mudar o jogo
	debouncer_button btn_reset_save_game(
		.button(reset_save_game_button),
		.clk(clock381HZ),
		.button_out(wire_reset_save_game)
	);
	
	//Debouncer para botão de mudar o jogo
	debouncer_button btn_save_game(
		.button(save_game_button),
		.clk(clock381HZ),
		.button_out(wire_save_game)
	);
	
	//Selecionar o jogo
	game_select select_game(
		.game(game_selected),
		.game_charge(wire_charge_game)
		);
	
	//registro do game - exibir o jogo no status POSICIONAMENTO
	game_register game(
		.register_game(wire_save_game),
		.reset(wire_reset_save_game),
		.game_selected(game_selected),
		.col1_out(col1_out),
		.col2_out(col2_out),
		.col3_out(col3_out),
		.col4_out(col4_out),
		.col5_out(col5_out)
	);
	
    matriz_controller matrix(
		 .show(2'b01),
		 .col1(col1_out),
		 .col2(col1_out),
		 .col3(col1_out),
		 .col4(col1_out),
		 .col5(col1_out),
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
