module Ma_Es(clk, At, A1, A2, A3, Erro, AndarB1, AndarB0);

	input clk, At, A1, A2, A3, Erro;
	output AndarB1, AndarB0;
	
	// Fios
	wire and1;

	// Negações
	not(notAt, At);
	not(notA1, A1);
	not(notA2, A2);
	not(notA3, A3);
	not(notAndarB0, AndarB0);
	not(notAndarB1, AndarB1);
	not(notErro, Erro);
	and(clkr, notErro, clk);
	
	// Flip-flops
	Flip_Flop_D(B0, clkr, reset, preset, AndarB0);
	Flip_Flop_D(B1, clkr, reset, preset, AndarB1);	
	
	// Expressão F: B0* = AndarB1 AndarB0 A3 + !AndarB1 AndarB0 A1 + AndarB1 At A1 + AndarB1 !AndarB0 A1 !A2 + AndarB1 !AndarB0 At !A2 +
   //	!AndarB1 !AndarB0 !At A2 + !AndarB0 !At !A2 A3 + AndarB0 !At !A1 !A2 !A3
	
	and(and1, AndarB1, AndarB0, A3);
	and(and2, notAndarB1, AndarB0, A1);
	and(and3, AndarB1, At, A1);
	and(and4, AndarB1, notAndarB0, A1, notA2);
	and(and5, AndarB1, notAndarB0, At, notA2);
	and(and7, notAndarB1, notAndarB0, notAt, A2);
	and(and8, notAndarB0, notAt, notA2, A3);
	and(and9, AndarB0, notAt, notA1, notA2, notA3);
	and(and9_0, notAndarB0, notAndarB1, notAt, A1, notA2, notA3);
	
	or(B0, and1, and2, and3, and4, and5, and6, and7, and8, and9, and9_0);
	
	// Expressão F: B1* = AndarB1 A2 + AndarB1 A3 + AndarB1 AndarB0 + AndarB1 !At !A1 + AndarB0 !At !A1 A2 + AndarB0 !At !A1 A3
	and(and10, AndarB1, A2);
	and(and11, AndarB1, A3);
	and(and12, AndarB1, AndarB0);
	and(and13, AndarB1, notAt, notA1);
	and(and14, AndarB0, notAt, notA1, A2);
	and(and15, AndarB0, notAt, notA1, A3);
	
	or(B1, and10, and11, and12, and13, and14, and15);
	
endmodule