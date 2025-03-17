module Display_Ma_Es (B0, B1, A7, B7, C7, D7, E7, F7, G7, P7);

input B0, B1;
output A7, B7, C7, D7, E7, F7, G7, P7;

// Negações
not(notB0, B0);
not(notB1, B1);

// Expressão F: A = !B1 B0	
and(A7, notB1, B0);

// Expressão F: B = 0	
not(B7, 1);

// Expressão F: C = B1 !B0	
and(C7, B1, notB0);

// Expressão F: D = !B1 B0	
and(D7, notB1, B0);

// Expressão F: E = B0	
and(E7, B0); // Depois ver se esse ta certo

// Expressão F: F = B1 + B0	
or(F7, B1, B0);

// Expressão F: G = !B1	
not(G7, B1); // Depois ver se esse ta certo

// Expressão F: P = 1 	
not(P7, 0);

endmodule