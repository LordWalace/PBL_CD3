module Ma_Es_CE(In, De, PA, clk, Q0, Q1, Erro);

	input In, De, PA, clk;
	output Q0, Q1, Erro;


	// Negações
	not(notIn, In);
	not(notDe, De);
	not(notQ0, Q0);
	not(notQ1, Q1);

	//Flip-Flops
	Flip_Flop_D(Q0f, clk, 0 , 0 , Q0);
	Flip_Flop_D(Q1f, clk, 0 , 0 , Q1);

	//Expressão F: Q1f = In Q1 + Q1 Q0 + !De Q1 + !PA Q1 + PA In !De Q0						
	and(and1, In, Q1);
	and(and2, Q1, Q0);
	and(and3, notDe, Q1);
	and(and4, notPA, Q1);
	and(and5, PA, In, notDe, Q0);
	
	or(Q1f, and1, and2, and3, and4, and5);
	
	//Expressão F: Q0f = !PA Q0 + In De Q0 + !In !De Q0 + PA In !De Q1 + PA In !De !Q0 + PA !In De Q1 !Q0						
	and(and6, notPA, Q0);
	and(and7, In, De, Q0);
	and(and8, notIn, notDe, Q0);
	and(and9, PA, In, notDe, Q1);
	and(and10, PA, In, notDe, notQ0);
	and(and11, PA, notIn, De, Q1, notQ0);
	
	or(Q0f, and6, and7, and8, and9, and10, and11);
	
	//Expressão F: Erro = PA In !De Q1 Q0	
	and(Erro, PA, In, notDe, Q1, Q0);



endmodule 