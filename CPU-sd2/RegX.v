module RegX (entrada, barramentodados, tx, clock);
	input wire clock;
	input wire [3:0] entrada, tx;
	output reg [3:0] barramento;
	
	parameter CLEAR = 4'd0;
	parameter LOAD = 4'd1;
	parameter HOLD = 4'd2;
	
	always@(posedge clock)
		begin
			case(tx)
				CLEAR: barramento <= 4'd0;
				LOAD: barramento <= entrada;
				//HOLD faz nada
			endcase
		end

endmodule
