module mealy (up,down,reset,clock,segmentos);
input up, down, reset, clock;
output [6:0] segmentos;
reg [3:0] saida, atual, prox;
wire dclk;
parameter A = 4'b0000 , B = 4'b0001, C = 4'b0010, D = 4'b0011,
E = 4'b0100 , F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000, 
J = 4'b1001;
 
divfreq divisor(.clk(clock),.out(dclk)); 
 
always @(up or down) // define os circuitos combinacionais 
	begin
		case (atual)
			A: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b0011; // 3
							end
						
						else // down == 1
						// decrescente
							begin
							prox = I;
							saida = 4'b1000; // 8
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = B;
					      saida= 4'b0101; // 5
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end
		
		B: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b0101; // 5
							end
						
						else // down == 1
						// decrescente
							begin
							prox = A;
							saida = 4'b0011; // 3
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = C;
					      saida= 4'b0010; // 2
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end
		
		C: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b0010; // 2
							end
						
						else // down == 1
						// decrescente
							begin
							prox = B;
							saida = 4'b0101; // 5
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = D;
					      saida= 4'b1000; // 8
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end
		
		D: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b1000; // 8
							end
						
						else // down == 1
						// decrescente
							begin
							prox = C;
							saida = 4'b0010; // 2
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = E;
					      saida= 4'b0100; // 4
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end
		
		E: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b0100; // 4
							end
						
						else // down == 1
						// decrescente
							begin
							prox = D;
							saida = 4'b1000; // 8
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = F;
					      saida= 4'b0000; // 0
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end
					
		F: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b0000; // 0
							end
						
						else // down == 1
						// decrescente
							begin
							prox = E;
							saida = 4'b0100; // 4
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = G;
					      saida= 4'b0010; // 2
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end			
		
		G: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b0010; // 2
							end
						
						else // down == 1
						// decrescente
							begin
							prox = F;
							saida = 4'b0000; // 0
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = H;
					      saida= 4'b0001; // 1
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end
		
		H: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b0001; // 1
							end
						
						else // down == 1
						// decrescente
							begin
							prox = G;
							saida = 4'b0010; // 2
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = I;
					      saida= 4'b1000; // 8
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end
		
		I: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b1000; // 8
							end
						
						else // down == 1
						// decrescente
							begin
							prox = H;
							saida = 4'b0001; // 1
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = A;
					      saida= 4'b0011; // 3
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end
		
		default: if (up == 0)
					begin
						if(down == 0) 
						// mantem
							begin
							prox = atual;
					      saida= 4'b1111; // 15
							end
						
						else // down == 1
						// decrescente
							begin
							prox = A;
							saida = 4'b0011; // 3
							end
					end
						
				else // up == 1
					begin
						if(down == 0) 
						// crescente
							begin
							prox = A;
					      saida= 4'b0011; // 3
							end
						
						else // down == 1
						// limpa
							begin
							prox = J;
							saida = 4'b1111; // 15 -> para apagar o Display
							end
					end

		endcase				
	end
	
always @(posedge dclk or posedge reset) // define o circuito sequencial
	begin
		if(reset == 1)
			atual <= A;
		else
			atual <= prox;
	end
decodificador decod(.entrada(saida), .saida(segmentos));
endmodule
