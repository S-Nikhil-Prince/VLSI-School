module andgate(a,b,y);
input a,b;
output y1,y2,y3,y4,y5,y6,y7;

and g1(y1,a,b);
or g2(y2,a,b);
nand g3(y3,a,b);
nor g4(y4,a,b);
xor g5(y5,a,b);
xnor g6(y6,a,b);
not g7(y7,a);

endmodule