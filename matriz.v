module matriz(
    input clock,
	 input [6:0] coluna1,
	 input [6:0] coluna2,
	 input [6:0] coluna3,
	 input [6:0] coluna4,
	 input [6:0] coluna5,
    output reg [4:0] colunas,
    output reg [6:0] linhas
);

    reg [3:0] contador = 4'd0;

    always @(posedge clock) begin
	 
			  case (contador)
					4'd0: begin //COLUNA 01
						 colunas <= 5'b00001;
						 contador <= contador + 1'd1;
						 linhas <= coluna1;
					end
					4'd1: begin //COLUNA 02
						 colunas <= 5'b00010;
						 contador <= contador + 1'd1;
						 linhas <= coluna2;
					end
					4'd2: begin //COLUNA 03
						 colunas <= 5'b00100;
						 contador <= contador + 1'd1;
						 linhas <= coluna3;
					end
					4'd3: begin //COLUNA 04
						 colunas <= 5'b01000;
						 contador <= contador + 1'd1;
						 linhas <= coluna4;
					end
					4'd4: begin //COLUNA 05
						 colunas <= 5'b10000;
						 contador <= 4'd0; // Reinicie o contador
						 linhas <= coluna5;
					end
					default: begin //ERROR
						 contador <= 4'd0;
						 linhas <= 7'b1111111;
					end
			  endcase
			
    end

endmodule