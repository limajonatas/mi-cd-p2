module tratar_botao(
    input botao,
    input clock,
    output botao_saida
);

reg [1:0] estado = 2'b00;

always @(posedge clock) begin
    if (!botao) begin
        if (estado == 2'b01)
            estado <= 2'b11;
        else
            estado <= 2'b01;
    end else
        estado <= 2'b00;
end

assign botao_saida = (estado == 2'b11);
endmodule
