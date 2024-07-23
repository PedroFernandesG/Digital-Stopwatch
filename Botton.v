module Botton(
    input wire clk,
    input wire ButtonIniciar,
    input wire ButtonReset,
    input wire ButtonContar,
    input wire ButtonPausar,
    input wire ButtonParar,
    output reg [2:0] state
);

    // ESTADOS POSSIVEIS DO BOTÃO
    /*
     3'b001 = RESET
     3'b010 = COUNT
     3'b011 = PAUSE
     3'b100 = STOP
     */

    reg [2:0] Estado;
    
    // Registrando estados anteriores dos botões
    reg ButtonReset_prev, ButtonContar_prev, ButtonPausar_prev, ButtonParar_prev;

    always @(posedge clk) begin
		 if(ButtonIniciar == 1) begin
			  // Detecção da borda de subida do ButtonReset
			  if (ButtonReset && !ButtonReset_prev) begin
					Estado <= 3'b001;
			  end
			  // Detecção da borda de subida do ButtonContar
			  else if (ButtonContar && !ButtonContar_prev) begin
					Estado <= 3'b010;
			  end
			  // Detecção da borda de subida do ButtonPausar
			  else if (ButtonPausar && !ButtonPausar_prev) begin
					Estado <= 3'b011;
			  end
			  // Detecção da borda de subida do ButtonParar
			  else if (ButtonParar && !ButtonParar_prev) begin
					Estado <= 3'b100;
			  end
			  
			  // Atualizando os estados anteriores dos botões
			  ButtonReset_prev <= ButtonReset;
			  ButtonContar_prev <= ButtonContar;
			  ButtonPausar_prev <= ButtonPausar;
			  ButtonParar_prev <= ButtonParar;
			  
			  // Atualizando o estado atual
			  state <= Estado;
	    end
    end
endmodule
