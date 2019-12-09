module CPU(tx, ty, tz, tula, acumulador, barramento, ulaout, entrada, out, current_state, in1, in2, clock);
	input wire clock;
	input wire [3:0] in1, in2;
	
	output [3:0] out;
	output [3:0] current_state, tx, ty, tz, tula, acumulador, barramento, ulaout, entrada;
	
	MEM memoria(tx, in1, in2, entrada, contador, current_state, clock);
	Control controle(current_state, tx, ty, tz, tula, clock);
	ULA ula(ulaout, tula, barramento, acumulador);
	RegX registradorX(entrada, barramento, tx, clock);
	RegY registradorY(ulaout, acumulador, ty, clock);
	RegZ registradorZ(tz, acumulador, out, clock);
	
endmodule
