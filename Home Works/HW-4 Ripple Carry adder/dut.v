module fa(
  input a,b,c,
  output sum,carry
);
  assign sum=a^b^c;
  assign carry=(a&b)|((a^b)&c);
  end
endmodule

module ripple(
    input [3:0] a,b,
    input cin,
    output [3:0] sum,
    output cout
);
    fa u1(.a(a[0]),.b(b[0]),.c(cin),.sum(sum[0]),.carry(c1));
    fa u1(.a(a[1]),.b(b[1]),.c(c1),.sum(sum[1]),.carry(c2));
    fa u1(.a(a[2]),.b(b[2]),.c(c2),.sum(sum[2]),.carry(c3));
    fa u1(.a(a[3]),.b(b[3]),.c(c3),.sum(sum[3]),.carry(cout));
	
endmodule

    