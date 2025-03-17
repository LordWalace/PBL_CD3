module debouncing(clk, botao, out); // Preciso ver se isso ta funcionando

	input clk, botao;
	output out;
	
	// Negação
	not(notQ0, Q0);
	not(notQ1, Q1);
	
	
	Flip_Flop_D (botao, clk, preset, reset, Q0);
	Flip_Flop_D (Q0, clk,preset, reset, Q1);
	
	and (out, Q0, notQ1);
	
endmodule