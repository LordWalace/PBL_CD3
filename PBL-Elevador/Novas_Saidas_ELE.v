module Novas_Saidas_ELE(AndarB1, AndarB0, At, A1, A2, A3, Su, De, PA, PF);

	input AndarB1, AndarB0, At, A1, A2, A3;
	output Su, De, PA, PF;

	not(notAt, At);
	not(notA1, A1);
	not(notA2, A2);
	not(notA3, A3);
	not(notAndarB0, AndarB0);
	not(notAndarB1, AndarB1);
	
	//Expressão F: Su = AndarB1 !AndarB0 !A2 A3 + !AndarB1 !AndarB0 !At A1 + !AndarB1 !At !A1 A2 + !AndarB1 !At !A1 A3
	and(and1, AndarB1, notAndarB0, notA2, A3);
	and(and2, notAndarB1, notAndarB0, notAt, A1);
	and(and3, notAndarB1, notAt, notA1, A2);
	and(and4, notAndarB1, notAt, notA1, A3);
	
	or(Su, and1, and2, and3, and4);
	
	//Expressão F: De = AndarB1 At !A2 !A3 + AndarB1 A1 !A2 !A3 + AndarB1 AndarB0 A2 !A3 + !AndarB1 AndarB0 At !A1												
	and(and5, AndarB1, At, notA2, notA3);
	and(and6, AndarB1, A1, notA2, notA3);
	and(and7, AndarB1, AndarB0, A2, notA3);
	and(and8, notAndarB1, AndarB0, At, notA1);
	
	or(De, and5, and6, and7, and8);
	
	//Expressão F: PA = !AndarB1 A1 + AndarB1 !AndarB0 A2 + AndarB1 AndarB0 A3 + !AndarB1 !AndarB0 At
	
	and(and9, notAndarB1, notAndarB0, At);
	and(and10, notAndarB1, AndarB0, A1);
	and(and11, AndarB1, notAndarB0, A2);
	and(and12, AndarB1, AndarB0, A3);
	
	or(PA, and9, and10, and11, and12);
	
	//Expressão F: PF = AndarB1 AndarB0 A2 + AndarB1 AndarB0 A1 + AndarB1 AndarB0 At + AndarB1 At A1 A3 + AndarB1 AndarB0 At A3 + AndarB1 AndarB0 A1 A3 + AndarB1 AndarB0 A2 A3																	
	and(and15, AndarB1, AndarB0, A2);
	and(and16, AndarB1, AndarB0, A1);
	and(and17, AndarB1, AndarB0, At);
	and(and18, AndarB1, At, A1, A3);
	and(and19, AndarB1, AndarB0, At, A3);
	and(and20, AndarB1, AndarB0, A1, A3);
	and(and21, AndarB1, AndarB0, A2, A3);
	
	or(PF, and15, and16, and17, and18, and19, and20, and21);
	
	
endmodule