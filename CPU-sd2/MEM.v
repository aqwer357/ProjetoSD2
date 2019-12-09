module MEM(tx, entrada, contador, clock);
	input wire [3:0] tx;
	input wire clock;
	output reg [3:0] entrada;
	output integer contador;
	
	initial
	begin
		entrada <= 4'd0;
		contador <= 1'd0;
	end
	
	always@(posedge clock)
	begin
	end

endmodule
