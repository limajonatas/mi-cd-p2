/*MÓDULO RESPONSÁVEL POR SELECIONAR O JOGO*/
module game_selection(
    input button,
    output [6:0] col1_out,
    output [6:0] col2_out,
    output [6:0] col3_out,
    output [6:0] col4_out,
    output [6:0] col5_out
);
    reg game_selected_option = 1'b0;
    reg [6:0] col1 = 7'b1111111;
    reg [6:0] col2 = 7'b1111111;
    reg [6:0] col3 = 7'b1111111;
    reg [6:0] col4 = 7'b1111111;
    reg [6:0] col5 = 7'b1111111;

    always @(posedge button) begin
            case (game_selected_option)
                1'b0: begin //JOGO 1 
                    col1 <= 7'b0111100;
                    col2 <= 7'b0011101;
                    col3 <= 7'b0110101;
                    col4 <= 7'b1000111;
                    col5 <= 7'b1110111;
						  game_selected_option <= 1'b1;
                end
                1'b1: begin //JOGO 2
                    col1 <= 7'b0001101;
                    col2 <= 7'b1011100;
                    col3 <= 7'b1011101;
                    col4 <= 7'b1110111;
                    col5 <= 7'b1000111;
						  game_selected_option <= 1'b0;
                end
                default: begin // Outros casos
                     col1 <= 7'b1111111;
							col2 <= 7'b1111111;
							col3 <= 7'b1111111;
							col4 <= 7'b1111111;
							col5 <= 7'b1111111;
                end
            endcase
    end

    assign col1_out = col1;
    assign col2_out = col2;
    assign col3_out = col3;
    assign col4_out = col4;
    assign col5_out = col5;
endmodule
