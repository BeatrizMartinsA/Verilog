module divfreq (clk, out);
input clk;
output reg out;
reg [25:0] saida;
always @(posedge clk)
	if(saida == 26'd50000000)
		begin
			saida <= 26'd0;
			out <= 1;
		end
	else
		begin
			saida <= saida + 1;
			out <= 0;
		end
endmodule
	