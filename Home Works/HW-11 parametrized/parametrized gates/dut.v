module gates #(parameter N=2)(
  input [N-1:0] a,b,
  output [N-1:0] y1,y2,y3,y4,y5,y6,y7);

  assign y1 = a&b;
  assign y2 = a|b;
  assign y3 = ~(a&b);
  assign y4 = ~(a|b);
  assign y5 = a^b;
  assign y6 = ~(a^b);
  assign y7 = ~a;

endmodule