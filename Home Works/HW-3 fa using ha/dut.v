module ha(
  input a,b,
  output sum,carry
);
  assign sum=a^b;
  assign carry=a&b;
endmodule

module fa_using_ha(
  input a,b,c,
  output sum,carry
);
  ha u1(.a(a),.b(b),.sum(w1),.carry(w2));
  ha u2(.a(w1),.b(c),.sum(sum),.carry(w3));
  or g1(carry,w2,w3);
endmodule