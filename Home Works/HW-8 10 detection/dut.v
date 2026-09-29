module logica(
  output y,
  input a,b
);
  not u1(b_out,b);
  and u2(y,a,b_out);
endmodule

module logicb(
  output [7:0]o,
  input [7:0]i
);

  logica u1(w1,i[7],i[6]);
  logica u2(w2,i[6],i[5]);
  logica u3(w3,i[5],i[4]);
  logica u4(w4,i[4],i[3]);
  logica u5(w5,i[3],i[2]);
  logica u6(w6,i[2],i[1]);
  logica u7(w7,i[1],i[0]);

  assign o=w1+w2+w3+w4+w5+w6+w7;
endmodule