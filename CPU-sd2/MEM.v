module MEM(tx, n1, n2, entrada, contador, current_state, clock);
	input wire clock;
	output reg [3:0] entrada, current_state, n1, n2;
	output reg contador;
	
	parameter CLEAR = 4'd0;
	parameter LOAD = 4'd1;
	parameter HOLD = 4'd2;
	
	initial
	begin
		n1 <= 4'd5;
		n2 <= 4'd3;
		entrada <= 4'd0;
		contador <= 1'b0;
		current_state <= 4'd0;
	end
	
	always@(posedge clock)
	begin
		if(tx == LOAD)
		begin
			case(contador)
				1'b0: begin
					entrada <= n1;
					contador <= 1'b1;
				end
				1'b1: begin
					entrada <= n2;
					contador <= 1'b0;
				end
				default;
			endcase
		end
		
		case(current_state) //Estados da maquina
			4'd0: current_state <= 4'd1;
			4'd1: current_state <= 4'd2;
			4'd2: current_state <= 4'd3;
			4'd3: current_state <= 4'd4;
			4'd4: current_state <= 4'd5;
			4'd5: current_state <= 4'd0;
			default;
		endcase;
	end

endmodule
