module Main(
    input wire clk,
    input wire ButtonIniciar,
    input wire ButtonReset,
    input wire ButtonContar,
    input wire ButtonPausar,
    input wire ButtonParar,
    output wire [6:0] segCentena,
    output wire [6:0] segDezena,
    output wire [6:0] segUnidade,
    output wire [6:0] segDecimo
);

reg [31:0] Contador1 = 0;
reg [3:0] Centena = 0;
reg [3:0] Dezena = 0;
reg [3:0] Unidade = 0;
reg [3:0] Decimo = 0;
reg Ativo = 0;        // Flag para controlar a contagem
reg Display = 0;      // Flag para ativar/desativar o display

wire [2:0] Estado;

Botton botao (
    .clk(clk),
    .ButtonIniciar(ButtonIniciar),
    .ButtonReset(ButtonReset),
    .ButtonContar(ButtonContar),
    .ButtonPausar(ButtonPausar),
    .ButtonParar(ButtonParar),
    .state(Estado)
);

always @(posedge clk) begin

    if(ButtonIniciar == 1) begin
        case (Estado)
            3'b001: begin // RESET
                Contador1 <= 0;
                Centena <= 0;
                Dezena <= 0;
                Unidade <= 0;
                Decimo <= 0;
                Ativo <= 0;
                Display <= 1;
            end
            3'b010: begin // COUNT
                Ativo <= 1;
                Display <= 1;
            end
            3'b011: begin // PAUSE
                Ativo <= 1;
                Display <= 0;
            end
            3'b100: begin // STOP
                Ativo <= 0;
                Display <= 0;
            end
        endcase
    end

    if (Ativo == 1) begin // Apenas conta se estiver no estado COUNT
        Contador1 <= Contador1 + 1;
        if (Contador1 == 5000000) begin
            Contador1 <= 0;
            Decimo <= Decimo + 1;
            if (Decimo == 9) begin
                Decimo <= 0;
                Unidade <= Unidade + 1;
                if (Unidade == 9) begin
                    Unidade <= 0;
                    Dezena <= Dezena + 1;
                    if (Dezena == 9) begin
                        Dezena <= 0;
                        Centena <= Centena + 1;
                    end
                end
            end
        end
    end
end

Display7 display (
    .centena(Centena),
    .dezena(Dezena),
    .unidade(Unidade),
    .decimo(Decimo),
    .segCentena(segCentena),
    .segDezena(segDezena),
    .segUnidade(segUnidade),
    .segDecimo(segDecimo),
    .displayativo(Display)
);

endmodule
