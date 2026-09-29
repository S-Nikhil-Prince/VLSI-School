module ha(
  input a,b,
  output sum,carry
);
  assign = a^b;
  assign = a&b;
endmodule

module fa(
  input a,b,c,
  output sum,carry
);
  assign sum=a^b^c;
  assign carry=(a&b)|((a^b)&c);
  end
endmodule

module large_adder(
    output carry,
  output sum,
  input a,
  input b,
  input c,
  input d,
);

  assign sum = a ^ b ^ c ^ d;

  assign carry = 
    (a & b) |
    (a & c) |
    (a & d) |
    (b & c) |
    (b & d) |
    (c & d) |

endmodule

module extra_large_adder(
  output carry,
  output sum,
  input a,
  input b,
  input c,
  input d,
  input e
);

  assign sum = a ^ b ^ c ^ d ^ e;

  assign carry = (a & b) |
    (a & c) |
    (a & d) |
    (a & e) |
    (b & c) |
    (b & d) |
    (b & e) |
    (c & d) |
    (c & e) |
    (d & e);

endmodule

module mult_4x4(
  input [3:0] a,b,
  output y0,y1,y2,y3,y4,y5,y6,y7
);
  assign y0=a[0]&b[0];
  ha u1(.a(a[1]&b[0]),.b(a[0]&b[1]),.sum(y1),.carry(w1));
  ha u1(.a(a[1]&b[0]),.b(),.c(w1),.sum(),.carry());