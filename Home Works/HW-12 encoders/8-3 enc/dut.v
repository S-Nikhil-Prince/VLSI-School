module or4inp(
  input a, b, c, d,
  output y
);

  assign y = a | b | c | d;
endmodule

module enc_8_3(
  input [7:0] i,
  output [2:0] y
);
  or4inp u1(.a(i[1]), .b(i[3]), .c(i[5]), .d(i[7]), .y(y[0]));
  or4inp u2(.a(i[2]), .b(i[3]), .c(i[6]), .d(i[7]), .y(y[1]));
  or4inp u3(.a(i[4]), .b(i[5]), .c(i[6]), .d(i[7]), .y(y[2]));
endmodule
