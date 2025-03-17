module Display_Ma_Es_CE(Q0, Q1, A7, B7, C7, D7, E7, F7, G7, P7); 

	input Q0, Q1;
	output A7, B7, C7, D7, E7, F7, G7, P7;

	// Negações
	not(notQ0, Q0);
	not(notQ1, Q1);
	
	// Expressão F: A = !Q1 Q0
	and(A7, notQ1, Q0);
	// Expressão F: B = 0
	not(B7, 1);
	// Expressão F: C = Q1 !Q0
	and(C7, Q1, notQ0);
	// Expressão F: D = !Q1 Q0
	and(D7, notQ1, Q0);
	// Expressão F: E = Q0
	and(E7, Q0);
	// Expressão F: F = Q1 + Q0
	or(F7, Q1, Q0);
	// Expressão F: G = !Q1
	and(G7, notQ1);
	// Expressão F: P = 1			
	not(P7, 0);

endmodule