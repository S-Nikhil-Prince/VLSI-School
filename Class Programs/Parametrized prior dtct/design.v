module priority_encoder #(parameter bit_size = 8)(
  input  [bit_size-1:0] D,
  output reg [$clog2(bit_size)-1:0] Y,
  output reg pri_val
);
  integer i;
  always @(*) begin
    pri_val = |D;
    Y = 0;
    //     for (i=bit_size-1;i>=0;i=i-1) begin  
    //not used this because after first pri, next pri is overwriting it 
    //so it is finding last pri
    for (i=0;i<=bit_size-1;i=i+1) begin
      if (D[i])
        Y = i;
    end
  end
endmodule


module demux #(parameter bit_size = 8)(
  input d,
  input [$clog2(bit_size)-1:0] sel,
  output reg [bit_size-1:0] y
);
  always @(*) begin
    y = 0;
    if (d)
      y[sel] = 1'b1;
  end
endmodule


module xorgate(
  input a,
  input b,
  output y
);
  xor g1(y, a, b);
endmodule


module top #(parameter bit_size = 4)(
  input  [bit_size-1:0] i,
  output [$clog2(bit_size)-1:0] f_pri,
  output [$clog2(bit_size)-1:0] n_pri,
  output f_val,
  output n_val
);
  wire [bit_size-1:0] w1;
  priority_encoder #(.bit_size(bit_size)) u1 (.D(i),.Y(f_pri),.pri_val(f_val));
  demux #(.bit_size(bit_size)) u2 (.d(1'b1),.sel(f_pri),.y(w1));
  priority_encoder #(.bit_size(bit_size)) u3 (.D(w1 ^ i),.Y(n_pri),.pri_val(n_val)
                                             );
endmodule