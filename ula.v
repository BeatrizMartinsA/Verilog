module ula(sel, A, B,segmentos);
input [2:0] sel;
input [3:0] A,B;
reg [3:0] ALUOut;
output [6:0] segmentos;
always @(sel,A,B) begin 
case (sel)
3'b000: ALUOut = A & B;
3'b001: ALUOut = A | B;
3'b010: ALUOut = A + B;
3'b011: ALUOut = A - B;
3'b100: ALUOut = A * B;
3'b101: ALUOut = A / B;
default: ALUOut <= 4'b0000;
endcase
end
decodificador decod(.saida(segmentos), .entrada(ALUOut));
endmodule