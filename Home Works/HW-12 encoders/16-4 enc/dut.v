module or8inp(
  input a,b,c,d,e,f,g,h,
  output y
);

  assign y = a|b|c|d|e|f|g|h;
endmodule

module enc_16_4(
  input [15:0] i,
  output [3:0] y
);
  or8inp u1(.a(i[1]),.b(i[3]),.c(i[5]),.d(i[7]),.e(i[9]),.f(i[11]),.g(i[13]),.h(i[15]),.y(y[0]));
  or8inp u2(.a(i[2]),.b(i[3]),.c(i[6]),.d(i[7]),.e(i[10]),.f(i[11]),.g(i[14]),.h(i[15]),.y(y[1]));
  or8inp u3(.a(i[4]),.b(i[5]),.c(i[6]),.d(i[7]),.e(i[12]),.f(i[13]),.g(i[14]),.h(i[15]),.y(y[2]));
  or8inp u4(.a(i[8]),.b(i[9]),.c(i[10]),.d(i[11]),.e(i[12]),.f(i[13]),.g(i[14]),.h(i[15]),.y(y[3]));
endmodule