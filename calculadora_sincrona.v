module calculadora_sincrona (
    input  wire       clk,
    input  wire       rst,
    input  wire [2:0] codigo,
    input  wire [7:0] entrada,
    output reg  [7:0] saida
);

reg [7:0] acc;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        acc   <= 8'b0;
        saida <= 8'b0;
    end else begin
        case (codigo)
            3'b000: begin
                saida <= entrada;
            end
            3'b001: begin
                acc   <= acc + entrada;
                saida <= 8'b0; // limpa a saída como pede o teste
            end
            3'b010: begin
                acc   <= acc - entrada;
                saida <= 8'b0; // idem
            end
            3'b011: begin
                saida <= acc;
            end
            default: begin
                saida <= 8'b0; // segurança
            end
        endcase
    end
end

endmodule
