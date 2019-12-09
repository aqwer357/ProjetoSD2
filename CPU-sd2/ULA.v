module ULA(ulaout, tula, barramento, acumulador);
	input wire [3:0] barramento;
	input wire [3:0] acumulador;
	input wire [3:0] tula;
	output reg [3:0] ulaout;
	
	parameter ADD = 4'b0000;
	
	always @(tula or barramento or acumulador)
	begin
		case(tula)
			ADD: ulaout <= barramento + acumulador;
		endcase
	end
	
endmodule
