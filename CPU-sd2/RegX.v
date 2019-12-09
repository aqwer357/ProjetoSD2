module RegX (entrada, barramentodados, tx, clock);
	input wire clock;
	input wire [3:0] entrada, tx;
	output reg [3:0] barramento;
	
	parameter CLEAR = 4'b0000;
	parameter LOAD = 4'b0001;
	parameter HOLD = 4'b0010;
	
	always@(posedge clock)
		begin
			case(tx)
				CLEAR: barramento <= 4'd0;
				LOAD: barramento <= entrada;
				//HOLD faz nada
			endcase
		end

endmodule
