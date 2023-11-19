
/*ALTERNA ENTRE AS OPÇÕES DOS JOGOS*/
module game_option_change(
    output [3:0] game_option,
    input game_change_button //button
);

    reg [3:0] game_reg = 4'b0000;

    always @(posedge game_change_button) begin
        if (game_change_button) begin
            case (game_reg)
                4'b0000: game_reg <= 4'b0001;
                4'b0001: game_reg <= 4'b0010;
                4'b0010: game_reg <= 4'b0100;
                4'b0100: game_reg <= 4'b1000;
                4'b1000: game_reg <= 4'b0001; // Reinicie de volta a 0001
                default: game_reg <= 4'b0000; // Tratamento de erro
            endcase
        end
    end

    assign game_option = game_reg;

endmodule
