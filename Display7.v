module Display7(
    input wire [3:0] centena,
    input wire [3:0] dezena,
    input wire [3:0] unidade,
    input wire [3:0] decimo,
    output reg [6:0] segCentena,
    output reg [6:0] segDezena,
    output reg [6:0] segUnidade,
    output reg [6:0] segDecimo,
    input wire displayativo
);


always @(*) begin
    if (displayativo == 1) begin
        case (decimo)
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

        case (unidade)
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

        case (dezena)
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

        case (centena)
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
    end //else begin
        //segCentena = 7'b1111111; // blank
        //segDezena = 7'b1111111;  // blank
        //segUnidade = 7'b1111111; // blank
        //segDecimo = 7'b1111111;  // blank
    //end
end

endmodule



