module modulo_clock(
    input sinal_clock,
    //input reset,
    output clock_saida
);

    reg [15:0] contador = 16'd0;
	 reg saida = 1'b0;
    
    always @(posedge sinal_clock ) begin
		if (contador == 16'b1111111111111111) begin
			saida <= ~saida;
			contador <= 16'd0;
		end
		else begin
			contador <= contador + 16'd1;
		end
    end
	 
	 assign clock_saida = saida;
endmodule