module stage2(
  input i0,i1,i2,i3,i4,i5,i6,i7,
  output [2:0] f_pri,n_pri,
  output f_val,n_val
);
  wire [2:0] w0,w1,w2,w3,w4,w5,w6,w7,w8;
  wire v0,v1,v2,v3,v4,v5,v6,v7,v8;
  wire [2:0] y;

  priority_encoder_8to3 p0 (.D({i0,i1,i2,i3,i4,i5,i6,i7}),.Y(w0),.pri_val(v0));  //stage 1 encoder

  priority_encoder_8to3 p1 (.D({i0,i1,i2,i3,i4,i5,i6,1'b0}),.Y(w1),.pri_val(v1));
  priority_encoder_8to3 p2 (.D({i0,i1,i2,i3,i4,i5,1'b0,i7}),.Y(w2),.pri_val(v2));
  priority_encoder_8to3 p3 (.D({i0,i1,i2,i3,i4,1'b0,i6,i7}),.Y(w3),.pri_val(v3));
  priority_encoder_8to3 p4 (.D({i0,i1,i2,i3,1'b0,i5,i6,i7}),.Y(w4),.pri_val(v4));
  priority_encoder_8to3 p5 (.D({i0,i1,i2,1'b0,i4,i5,i6,i7}),.Y(w5),.pri_val(v5));
  priority_encoder_8to3 p6 (.D({i0,i1,1'b0,i3,i4,i5,i6,i7}),.Y(w6),.pri_val(v6));
  priority_encoder_8to3 p7 (.D({i0,1'b0,i2,i3,i4,i5,i6,i7}),.Y(w7),.pri_val(v7));
  priority_encoder_8to3 p8 (.D({1'b0,i1,i2,i3,i4,i5,i6,i7}),.Y(w8),.pri_val(v8));

  mux8to1 m1 (.i0(w1),.i1(w2),.i2(w3),.i3(w4),.i4(w5),.i5(w6),.i6(w7),.i7(w8),.sel(w0),.y(y));  //stage 2 mux

  assign f_pri=w0;
  assign f_val=v0;
  assign n_val=v1|v2|v3|v4|v5|v6|v7|v8;
  assign n_pri=y;

endmodule