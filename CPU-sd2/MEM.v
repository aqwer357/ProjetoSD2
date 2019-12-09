module MEM(tx, in1, in2, entrada, contador, clock);
	
	input wire [3:0] in1, in2, tx;
	input wire clock;
	output reg [3:0] entrada;
	output reg contador;
	
	parameter CLEAR = 4'd0;
	parameter LOAD = 4'd1;
	parameter HOLD = 4'd2;
	
	initial
	begin
		entrada <= 4'd0;
		contador <= 1'b0;
	end
	
	always@(posedge clock)
	begin
		if(tx == LOAD)
		begin
			case(contador)
				1'b0: begin
					entrada <= in1;
					contador <= 1'b1;
				end
				1'b1: begin
					entrada <= in2;
					contador <= 1'b0;
				end
				default;
			endcase
		end
	end

endmodule
