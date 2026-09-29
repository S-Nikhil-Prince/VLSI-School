//nand gate
module nandgate(
  input a,b,
  output y
);
  nand g1(y,a,b);
endmodule


//not using nand
module notgate(
  input a,
  output y
);
  nandgate g2(.a(a),.b(a),.y(y));
endmodule


//and using nand
module andgate(
  input a,b,
  output y
);
  nandgate g3(.a(a),.b(b),.y(w1));
  nandgate g4(.a(w1),.b(w1),.y(y));
endmodule


//or using nand
module orgate(
  input a,b,
  output y
);
  nandgate g5(.a(a),.b(a),.y(w1));
  nandgate g6(.a(b),.b(b),.y(w2));
  nandgate g7(.a(w1),.b(w2),.y(y));
endmodule


//nor using nand
module norgate(
  input a,b,
  output y
);
  nandgate g8(.a(a),.b(a),.y(w1));
  nandgate g9(.a(b),.b(b),.y(w2));
  nandgate g10(.a(w1),.b(w2),.y(w3));
  nandgate g11(.a(w3),.b(w3),.y(y));
endmodule


//xor using nand
module xorgate(
  input a,b,
  output y
);
  nandgate g12(.a(a),.b(b),.y(w1));
  nandgate g13(.a(a),.b(w1),.y(w2));
  nandgate g14(.a(b),.b(w1),.y(w3));
  nandgate g15(.a(w3),.b(w2),.y(y));
endmodule


//xnor using nand
module xnorgate(
  input a,b,
  output y
);
  nandgate g16(.a(a),.b(b),.y(w1));
  nandgate g17(.a(a),.b(w1),.y(w2));
  nandgate g18(.a(b),.b(w1),.y(w3));
  nandgate g19(.a(w2),.b(w3),.y(w4));
  nandgate g20(.a(w4),.b(w4),.y(y));
endmodule
  