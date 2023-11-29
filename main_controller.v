module main_controller(
	input save_game,
	input reset,
	input onOff,
	input status, //chave 0 -> posicionamento / 1-> ataque
	input attack_button,
	input [6:0] col1_in,
	input [6:0] col2_in,
	input [6:0] col3_in,
	input [6:0] col4_in,
	input [6:0] col5_in,
	output reg [6:0] col1_out,
	output reg [6:0] col2_out,
	output reg [6:0] col3_out,
	output reg [6:0] col4_out,
	output reg [6:0] col5_out,
	input [2:0] columns_attack,
	input [2:0] rows_attack
);
reg show = 2'b00;

always @(status or onOff) begin
	if(!status && onOff)
		show <= 2'b01;
	else if(status && onOff)
		show <= 2'b10;
	else
		show <= 2'b00;
	end
	
	always @(show) begin
		if(show == 2'b01) begin
			col1_out <= col1_in;
			col2_out <= col2_in;
			col3_out <= col3_in;
			col4_out <= col4_in;
			col5_out <= col5_in;
		end
		else if(show == 2'b10) begin
			col1_out <= 7'b0000000;
			col2_out <= 7'b0100010;
			col3_out <= 7'b0000000;
			col4_out <= 7'b1000001;
			col5_out <= 7'b0111110;
		end
		else begin
			col1_out <= 7'b0000000;
			col2_out <= 7'b0000000;
			col3_out <= 7'b0000000;
			col4_out <= 7'b0000000;
			col5_out <= 7'b0000000;
		end
	end
  
endmodule