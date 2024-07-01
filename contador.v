module contador(
    input wire clk,
	 input wire ButtonIniciar = 1,
	 input wire ButtonReset = 1,
	 input wire ButtonContar = 1,
	 input wire ButtonPausar,
	 input wire ButtonParar,
    output reg [6:0] segCentena,
    output reg [6:0] segDezena,
    output reg [6:0] segUnidade,
    output reg [6:0] segDecimo
	 
);

reg [3:0] centena = 0;
reg [3:0] dezena = 0;
reg [3:0] unidade = 0;
reg [3:0] decimo = 0;
reg flag = 0;

reg [31:0] count = 0;

always @(posedge clk) begin

    count <= count + 1;
	 if(flag == 0)begin
		 if(count == 5000000) begin
			  count <= 0;
			  decimo <= decimo + 1;
			  if(decimo == 9) begin
					decimo <= 0;
					unidade <= unidade + 1;
					if(unidade == 9) begin
						 unidade <= 0;
						 dezena <= dezena + 1;
						 if(dezena == 9) begin
							  dezena <= 0;
							  centena <= centena + 1;
							  if(centena == 9) begin
									flag <= 1;
									centena <= 0;
							  end
						 end
					end
			  end
		 end
	 end
end


if() begin
	always @(*) begin
		 case(decimo)
			  4'b0000: segDecimo = 7'b1000000; // 0
			  4'b0001: segDecimo = 7'b1111001; // 1
			  4'b0010: segDecimo = 7'b0100100; // 2
			  4'b0011: segDecimo = 7'b0110000; // 3
			  4'b0100: segDecimo = 7'b0011001; // 4
			  4'b0101: segDecimo = 7'b0010010; // 5
			  4'b0110: segDecimo = 7'b0000010; // 6
			  4'b0111: segDecimo = 7'b1111000; // 7
			  4'b1000: segDecimo = 7'b0000000; // 8
			  4'b1001: segDecimo = 7'b0010000; // 9
			  default: segDecimo = 7'b1111111; // blank
		 endcase
	end

	always @(*) begin
		 case(unidade)
			  4'b0000: segUnidade = 7'b1000000; // 0
			  4'b0001: segUnidade = 7'b1111001; // 1
			  4'b0010: segUnidade = 7'b0100100; // 2
			  4'b0011: segUnidade = 7'b0110000; // 3
			  4'b0100: segUnidade = 7'b0011001; // 4
			  4'b0101: segUnidade = 7'b0010010; // 5
			  4'b0110: segUnidade = 7'b0000010; // 6
			  4'b0111: segUnidade = 7'b1111000; // 7
			  4'b1000: segUnidade = 7'b0000000; // 8
			  4'b1001: segUnidade = 7'b0010000; // 9
			  default: segUnidade = 7'b1111111; // blank
		 endcase
	end

	always @(*) begin
		 case(dezena)
			  4'b0000: segDezena = 7'b1000000; // 0
			  4'b0001: segDezena = 7'b1111001; // 1
			  4'b0010: segDezena = 7'b0100100; // 2
			  4'b0011: segDezena = 7'b0110000; // 3
			  4'b0100: segDezena = 7'b0011001; // 4
			  4'b0101: segDezena = 7'b0010010; // 5
			  4'b0110: segDezena = 7'b0000010; // 6
			  4'b0111: segDezena = 7'b1111000; // 7
			  4'b1000: segDezena = 7'b0000000; // 8
			  4'b1001: segDezena = 7'b0010000; // 9
			  default: segDezena = 7'b1111111; // blank
		 endcase
	end

	always @(*) begin
		 case(centena)
			  4'b0000: segCentena = 7'b1000000; // 0
			  4'b0001: segCentena = 7'b1111001; // 1
			  4'b0010: segCentena = 7'b0100100; // 2
			  4'b0011: segCentena = 7'b0110000; // 3
			  4'b0100: segCentena = 7'b0011001; // 4
			  4'b0101: segCentena = 7'b0010010; // 5
			  4'b0110: segCentena = 7'b0000010; // 6
			  4'b0111: segCentena = 7'b1111000; // 7
			  4'b1000: segCentena = 7'b0000000; // 8
			  4'b1001: segCentena = 7'b0010000; // 9
			  default: segCentena = 7'b1111111; // blank
		 endcase
	end
end

endmodule
