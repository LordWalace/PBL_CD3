module Barra_e_Matriz_Leds(Su, De, PA, PF, L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, Cl, Cl2);

input Su, De, PA, PF;
output L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, Cl, Cl2;
	
	// Negações
	not(notPA, PA);

	// Barra de Leds
	//Expressão F: LED0 = 1	
	not(L0, 0);
	//Expressão F: LED1 = 1	
	not(L1, 0);
	//Expressão F: LED2 = P	
	and(L2, notPA);
	//Expressão F: LED3 = PF	
	and(L3, notPA);
	//Expressão F: LED4 = PF	
	and(L4, notPA);
	//Expressão F: LED5 = PF	
	and(L5, notPA);
	//Expressão F: LED6 = PF	
	and(L6, notPA);
	//Expressão F: LED7 = PF	
	and(L7, notPA);
	//Expressão F: LED8 = 1	
	not(L8, 0);
	//Expressão F: LED9 = 1	
	not(L9, 0);
	
	//Matriz de Leds
	and(Cl, Su);
	and(Cl2, De);
	
endmodule 