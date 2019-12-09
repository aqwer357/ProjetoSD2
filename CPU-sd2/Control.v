module Control(current_state, tx, ty, tz, tula, clock);
	input wire clock;
	output reg [3:0] current_state;
	output reg [3:0] tx, ty, tz, tula;
	
	parameter CLEAR = 4'd0;
	parameter LOAD = 4'd1;
	parameter HOLD = 4'd2;
	parameter SHIFTR = 4'd3;
	
	initial
	begin
		current_state <= 4'd0;
	end
	
	always@(posedge clock)
	begin
		tula <= 4'd0; //a ULA vai apenas somar, nao e necessario trocar o estado dela
		case(current_state)
			4'd0: begin //estado 0, inicializador
				current_state <= 4'd1;
				tx <= LOAD; //carrega a primeira entrada no barramento de dados
				ty <= CLEAR;
				tz <= CLEAR;
			end
			
			4'd1: begin //estado 1
				current_state <= 4'd2;
				tx <= LOAD; //carrega a segunda entrada no barramento de dados
				ty <= LOAD; //carrega a primeira entrada no acumulador
				tz <= CLEAR;
			end
			4'd2: begin //estado 2
				current_state <= 4'd3;
				tx <= CLEAR; //limpa o barramento
				ty <= LOAD; //carrega barramento + acumulador
				tz <= CLEAR;
			end
			4'd3: begin //estado 3
				current_state <= 4'd4;
				tx <= CLEAR;
				ty <= SHIFTR; //divide o acumulador por 2 usando shift-right
				tz <= CLEAR;
			end
			4'd4: begin //estado 4
				current_state <= 4'd5;
				tx <= CLEAR;
				ty <= CLEAR;
				tz <= LOAD; //carrega o acumulador no output
			end
			4'd5: begin //estado 5, final
				current_state <= 4'd0; //reinicia o ciclo
				tx <= LOAD;
				ty <= LOAD;
				tz <= CLEAR;
			end
			default;
		endcase
	end
	
endmodule
