module controlador_principal(
	input modo,
	input ligado,
	input salvar_jogo,
	input confirmar_ataque,
	input [2:0] ataque_colunas,
	input [2:0] ataque_linhas,
	input [6:0] coluna1_posicionamento,
   input [6:0] coluna2_posicionamento,
   input [6:0] coluna3_posicionamento,
   input [6:0] coluna4_posicionamento,
   input [6:0] coluna5_posicionamento,
	output reg [6:0] coluna1_saida,
   output reg [6:0] coluna2_saida,
   output reg [6:0] coluna3_saida,
   output reg [6:0] coluna4_saida,
   output reg [6:0] coluna5_saida,
	output reg [1:0]ledRGB
);
	reg [6:0] coluna1_jogo_salvo = 7'b1111111;
	reg [6:0] coluna2_jogo_salvo = 7'b1111111;
	reg [6:0] coluna3_jogo_salvo = 7'b1111111;
	reg [6:0] coluna4_jogo_salvo = 7'b1111111;
	reg [6:0] coluna5_jogo_salvo = 7'b1111111;
	reg [6:0] coluna1_ataque_bem_sucedido= 7'b1111111;
	reg [6:0] coluna2_ataque_bem_sucedido= 7'b1111111;
	reg [6:0] coluna3_ataque_bem_sucedido = 7'b1111111;
	reg [6:0] coluna4_ataque_bem_sucedido = 7'b1111111;
	reg [6:0] coluna5_ataque_bem_sucedido = 7'b1111111;
	reg jogo_salvo = 1'b0;
	
	parameter SETE_ALTOS = 7'b1111111;
	parameter UM = 3'b001;
	parameter DOIS = 3'b010;
	parameter TRES = 3'b011;
	parameter QUATRO = 3'b100;
	parameter CINCO = 3'b101;
	parameter SEIS = 3'b110;
	parameter SETE = 3'b111;

	always @* begin
        if (ligado) begin
            if (modo == 1'b0) begin
				ledRGB<=2'b00;
                coluna1_saida = coluna1_posicionamento;
                coluna2_saida = coluna2_posicionamento;
                coluna3_saida = coluna3_posicionamento;
                coluna4_saida = coluna4_posicionamento;
                coluna5_saida = coluna5_posicionamento;
                
                if (salvar_jogo) begin
						jogo_salvo <= 1'b1;
                    coluna1_jogo_salvo = coluna1_posicionamento;
                    coluna2_jogo_salvo = coluna2_posicionamento;
                    coluna3_jogo_salvo = coluna3_posicionamento;
                    coluna4_jogo_salvo = coluna4_posicionamento;
                    coluna5_jogo_salvo = coluna5_posicionamento;
                end
            end else begin
//                coluna1_saida = coluna1_jogo_salvo;
//                coluna2_saida = coluna2_jogo_salvo;
//                coluna3_saida = coluna3_jogo_salvo;
//                coluna4_saida = coluna4_jogo_salvo;
//                coluna5_saida = coluna5_jogo_salvo;
				
				
					 if(confirmar_ataque && jogo_salvo) begin
						/*COLUNA 1*/ 
					   if(coluna1_jogo_salvo[0] == 1'b0 && ataque_colunas==UM && ataque_linhas==UM) 
							begin
								ledRGB <= 2'b10;
								coluna1_ataque_bem_sucedido[0] <= 1'b0;
							end
						else 
						 if(coluna1_jogo_salvo[1] == 1'b0 && ataque_colunas==UM && ataque_linhas==DOIS) 
							begin
								ledRGB <= 2'b10;
								coluna1_ataque_bem_sucedido[1] <= 1'b0;
							end
						else 
						 if(coluna1_jogo_salvo[2] == 1'b0 && ataque_colunas==UM && ataque_linhas==TRES) 
							begin
								ledRGB <= 2'b10;
								coluna1_ataque_bem_sucedido[2] <= 1'b0;
							end
						else 
						 if(coluna1_jogo_salvo[3] == 1'b0 && ataque_colunas==UM && ataque_linhas==QUATRO) 
							begin
								ledRGB <= 2'b10;
								coluna1_ataque_bem_sucedido[3] <= 1'b0;
							end
						else 
						 if(coluna1_jogo_salvo[4] == 1'b0 && ataque_colunas==UM && ataque_linhas==CINCO) 
							begin
								ledRGB <= 2'b10;
								coluna1_ataque_bem_sucedido[4] <= 1'b0;
						 end
						else 
						 if(coluna1_jogo_salvo[5] == 1'b0 && ataque_colunas==UM && ataque_linhas==SEIS) 
							begin
								ledRGB <= 2'b10;
								coluna1_ataque_bem_sucedido[5] <= 1'b0;
							end
						else 
						 if(coluna1_jogo_salvo[6] == 1'b0 && ataque_colunas==UM && ataque_linhas==SETE) 
							begin
								ledRGB <= 2'b10;
								coluna1_ataque_bem_sucedido[6] <= 1'b0;
							end
							
					 else							
						/*COLUNA 2*/ 
						if(coluna2_jogo_salvo[0] == 1'b0 && ataque_colunas==DOIS && ataque_linhas==UM) 
							begin
								ledRGB <= 2'b10;
								coluna2_ataque_bem_sucedido[0] <= 1'b0;
							end
						else 
						if(coluna2_jogo_salvo[1] == 1'b0 && ataque_colunas==DOIS && ataque_linhas==DOIS) 
							begin
								ledRGB <= 2'b10;
								coluna2_ataque_bem_sucedido[1] <= 1'b0;
							end
						else
					  	 if(coluna2_jogo_salvo[2] == 1'b0 && ataque_colunas==DOIS && ataque_linhas==TRES) 
							begin
								ledRGB <= 2'b10;
								coluna2_ataque_bem_sucedido[2] <= 1'b0;
							end
						else 
						 if(coluna2_jogo_salvo[3] == 1'b0 && ataque_colunas==DOIS && ataque_linhas==QUATRO) 
							begin
								ledRGB <= 2'b10;
								coluna2_ataque_bem_sucedido[3] <= 1'b0;
							end
						else 
						 if(coluna2_jogo_salvo[4] == 1'b0 && ataque_colunas==DOIS && ataque_linhas==CINCO) 
							begin
								ledRGB <= 2'b10;
								coluna2_ataque_bem_sucedido[4] <= 1'b0;
							end
					else 
					 if(coluna2_jogo_salvo[5] == 1'b0 && ataque_colunas==DOIS && ataque_linhas==SEIS) 
							begin
								ledRGB <= 2'b10;
								coluna2_ataque_bem_sucedido[5] <= 1'b0;
							end
						else 
						 if(coluna2_jogo_salvo[6] == 1'b0 && ataque_colunas==DOIS && ataque_linhas==SETE) 
							begin
								ledRGB <= 2'b10;
								coluna2_ataque_bem_sucedido[6] <= 1'b0;
							end
							
							
					else	// 3 //////////////////////////////////////////////////////////////////////////////////
						/*COLUNA 3*/ 
						if(coluna3_jogo_salvo[0] == 1'b0 && ataque_colunas==TRES && ataque_linhas==UM) 
							begin
								ledRGB <= 2'b10;
								coluna3_ataque_bem_sucedido[0] <= 1'b0;
							end
						else 
						 if(coluna3_jogo_salvo[1] == 1'b0 && ataque_colunas==TRES && ataque_linhas==DOIS) 
							begin
								ledRGB <= 2'b10;
								coluna3_ataque_bem_sucedido[1] <= 1'b0;
							end
						else 
						 if(coluna3_jogo_salvo[2] == 1'b0 && ataque_colunas==TRES && ataque_linhas==TRES) 
							begin
								ledRGB <= 2'b10;
								coluna3_ataque_bem_sucedido[2] <= 1'b0;
							end
						else 
						 if(coluna3_jogo_salvo[3] == 1'b0 && ataque_colunas==TRES && ataque_linhas==QUATRO) 
							begin
								ledRGB <= 2'b10;
								coluna3_ataque_bem_sucedido[3] <= 1'b0;
							end
						else 
						 if(coluna3_jogo_salvo[4] == 1'b0 && ataque_colunas==TRES && ataque_linhas==CINCO) 
							begin
								ledRGB <= 2'b10;
								coluna3_ataque_bem_sucedido[4] <= 1'b0;
							end
						else 
						 if(coluna3_jogo_salvo[5] == 1'b0 && ataque_colunas==TRES && ataque_linhas==SEIS) 
							begin
								ledRGB <= 2'b10;
								coluna3_ataque_bem_sucedido[5] <= 1'b0;
							end
						else 
						 if(coluna3_jogo_salvo[6] == 1'b0 && ataque_colunas==TRES && ataque_linhas==SETE) 
							begin
								ledRGB <= 2'b10;
								coluna3_ataque_bem_sucedido[6] <= 1'b0;
							end	
						////////////////////////////////////////////////////////////////////////////////////////
						//4//
					else	/*COLUNA 4*/ 
						if(coluna4_jogo_salvo[0] == 1'b0 && ataque_colunas==QUATRO && ataque_linhas==UM) 
							begin
								ledRGB <= 2'b10;
								coluna4_ataque_bem_sucedido[0] <= 1'b0;
							end
						else 
						 if(coluna4_jogo_salvo[1] == 1'b0 && ataque_colunas==QUATRO && ataque_linhas==DOIS) 
							begin
								ledRGB <= 2'b10;
								coluna4_ataque_bem_sucedido[1] <= 1'b0;
							end
						else 
						 if(coluna4_jogo_salvo[2] == 1'b0 && ataque_colunas==QUATRO && ataque_linhas==TRES) 
							begin
								ledRGB <= 2'b10;
								coluna4_ataque_bem_sucedido[2] <= 1'b0;
							end
						else 
						 if(coluna4_jogo_salvo[3] == 1'b0 && ataque_colunas==QUATRO && ataque_linhas==QUATRO) 
							begin
								ledRGB <= 2'b10;
								coluna4_ataque_bem_sucedido[3] <= 1'b0;
							end
						else 
						 if(coluna4_jogo_salvo[4] == 1'b0 && ataque_colunas==QUATRO && ataque_linhas==CINCO) 
							begin
								ledRGB <= 2'b10;
								coluna4_ataque_bem_sucedido[4] <= 1'b0;
							end
						else
					   	if(coluna4_jogo_salvo[5] == 1'b0 && ataque_colunas==QUATRO && ataque_linhas==SEIS) 
							begin
								ledRGB <= 2'b10;
								coluna4_ataque_bem_sucedido[5] <= 1'b0;
							end
						else 
						 if(coluna4_jogo_salvo[6] == 1'b0 && ataque_colunas==QUATRO && ataque_linhas==SETE) 
							begin
								ledRGB <= 2'b10;
								coluna4_ataque_bem_sucedido[6] <= 1'b0;
							end
					else	//5///
						/*COLUNA 1*/ 
						if(coluna5_jogo_salvo[0] == 1'b0 && ataque_colunas==CINCO && ataque_linhas==UM) 
							begin
								ledRGB <= 2'b10;
								coluna5_ataque_bem_sucedido[0] <= 1'b0;
							end
						else 
						 if(coluna5_jogo_salvo[1] == 1'b0 && ataque_colunas==CINCO && ataque_linhas==DOIS) 
							begin
								ledRGB <= 2'b10;
								coluna5_ataque_bem_sucedido[1] <= 1'b0;
							end
						else 
						 if(coluna5_jogo_salvo[2] == 1'b0 && ataque_colunas==CINCO && ataque_linhas==TRES) 
							begin
								ledRGB <= 2'b10;
								coluna5_ataque_bem_sucedido[2] <= 1'b0;
							end
						else
					   	if(coluna5_jogo_salvo[3] == 1'b0 && ataque_colunas==CINCO && ataque_linhas==QUATRO) 
							begin
								ledRGB <= 2'b10;
								coluna5_ataque_bem_sucedido[3] <= 1'b0;
							end
						else 
						 if(coluna5_jogo_salvo[4] == 1'b0 && ataque_colunas==CINCO && ataque_linhas==CINCO) 
							begin
								ledRGB <= 2'b10;
								coluna5_ataque_bem_sucedido[4] <= 1'b0;
							end
						else 
						 if(coluna5_jogo_salvo[5] == 1'b0 && ataque_colunas==CINCO && ataque_linhas==SEIS) 
							begin
								ledRGB <= 2'b10;
								coluna5_ataque_bem_sucedido[5] <= 1'b0;
							end
						else
					   	if(coluna5_jogo_salvo[6] == 1'b0 && ataque_colunas==CINCO && ataque_linhas==SETE) 
							begin
								ledRGB <= 2'b10;
								coluna5_ataque_bem_sucedido[6] <= 1'b0;
							end
						////////////////////////////////////////////////////////////
							
						else
							ledRGB <= 2'b01;
					 end
					 
					 coluna1_saida = coluna1_ataque_bem_sucedido;
                coluna2_saida = coluna2_ataque_bem_sucedido;
                coluna3_saida = coluna3_ataque_bem_sucedido;
                coluna4_saida = coluna4_ataque_bem_sucedido;
                coluna5_saida = coluna5_ataque_bem_sucedido;
            end
        end else begin
				ledRGB<=2'b00;
				jogo_salvo = 1'b0;
            // Desliga todas as saídas se o jogo não estiver ligado
				coluna1_jogo_salvo = SETE_ALTOS;
				coluna2_jogo_salvo = SETE_ALTOS;
				coluna3_jogo_salvo = SETE_ALTOS;
				coluna4_jogo_salvo = SETE_ALTOS;
				coluna5_jogo_salvo = SETE_ALTOS;
				coluna1_ataque_bem_sucedido = SETE_ALTOS;
				coluna2_ataque_bem_sucedido = SETE_ALTOS;
				coluna3_ataque_bem_sucedido = SETE_ALTOS;
				coluna4_ataque_bem_sucedido = SETE_ALTOS;
				coluna5_ataque_bem_sucedido = SETE_ALTOS;
		oluna1_saida = SETE_ALTOS;
                coluna2_saida = SETE_ALTOS;
                coluna3_saida = SETE_ALTOS;
                coluna4_saida = SETE_ALTOS;
                coluna5_saida = SETE_ALTOS;
        end
    end
endmodule
