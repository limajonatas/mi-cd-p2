module game_select(
    output [3:0] game,
    input game_charge
);

    reg [3:0] game_reg = 4'b0000;

    always @(posedge game_charge) begin
        if (game_charge) begin
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

    assign game = game_reg;

endmodule
