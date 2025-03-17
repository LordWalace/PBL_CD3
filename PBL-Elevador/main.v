module main(clk, At, A1, A2, A3, SAt, SA1, SA2, SA3, In, De,  A7, B7, C7, D7, E7, F7, G7, P7, Q0f, Q1f, Erro, L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, Cl, Cl2, Disp1, Disp2, Disp3, Disp4);

	input clk, At, A1, A2, A3, SAt, SA1, SA2, SA3, In, De;
	output A7, B7, C7, D7, E7, F7, G7, P7, Q0f, Q1f, Erro, L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, Cl, Cl2;
	
	output Disp1, Disp2, Disp3, Disp4;

// Negações
		not(Disp2, 0);
		not(Disp3, 0);
		not(notFS, FS);
		not(notLD, LD);
		not(notBotao, Botao);
		not(notIn, In);
		not(notDe, De);

// Divisor de frequençia	
	DivisorFrequencia(clk, F1s, F8s, F4s, F2s, FS);

	debouncing a(FS, notIn, In0);
	debouncing b(FS, notDe, De0);

// Maquinas de estados 	
	Ma_Es(F2s, At, A1, A2, A3, Erro, B1, B0);
	Ma_Es_CE(In0, De0, PA, FS, Q0f, Q1f, Erro);

// Saidas do elevador	
	Novas_Saidas_ELE(B1, B0, At, A1, A2, A3, Sub, Des, PA, PF);

// Saidas na Placa	
	Barra_e_Matriz_Leds(Sub, Des, PA, PF, L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, Cl, Cl2);

// Displays de 7 segmentos das maquinas de estados 
	Display_Ma_Es(B0, B1, MaA7, MaB7, MaC7, MaD7, MaE7, MaF7, MaG7, MaP7);
	Display_Ma_Es_CE(Q0f, Q1f, CeA7, CeB7, CeC7, CeD7, CeE7, CeF7, CeG7, CeP7);

// Multiplexadores
	Mux(FS, MaA7, CeA7, A7);
	Mux(FS, MaB7, CeB7, B7);
	Mux(FS, MaC7, CeC7, C7);
	Mux(FS, MaD7, CeD7, D7);
	Mux(FS, MaE7, CeE7, E7);
	Mux(FS, MaF7, CeF7, F7);
	Mux(FS, MaG7, CeG7, G7);
	Mux(FS, MaP7, CeP7, P7);
	
	not(Disp1, notFS);
	not(Disp4, FS);

endmodule 