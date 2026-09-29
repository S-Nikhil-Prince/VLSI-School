module ha(
  input a,b,
  output sum,carry
);
  assign sum=a^b;
  assign carry=a&b;
endmodule

module fa(
  input a,b,c,
  output sum,carry
);
  assign sum=a^b^c;
  assign carry=(a&b)|(b&c)|(c&a);
endmodule

module large_adder(
  input a,b,c,d,
  output s0,s1,cout
);
  fa u_fa(.a(a),.b(b),.c(c),.sum(w1),.carry(w2));
  ha u_ha0(.a(d),.b(w1),.sum(s1),.carry(w4));
  ha u_ha1(.a(w4),.b(w2),.sum(s0),.carry(cout));
  
endmodule
