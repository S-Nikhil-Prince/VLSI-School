module mux2x1 #(parameter N=2)(
  input [N-1:0] a,b,
  input sel,
  output [N-1:0] y
);
  assign y = sel ? b : a;
endmodule