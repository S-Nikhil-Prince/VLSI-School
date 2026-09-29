module priority_encoder_8to3 (
  input  [7:0] D,       
  output reg [2:0] Y,   
  output reg pri_val
);

  always @(*) begin
    pri_val = |D;
    casez (D)
      8'b1???????: Y = 3'b111; // Highest priority: D7
      8'b01??????: Y = 3'b110; // D6
      8'b001?????: Y = 3'b101; // D5
      8'b0001????: Y = 3'b100; // D4
      8'b00001???: Y = 3'b011; // D3
      8'b000001??: Y = 3'b010; // D2
      8'b0000001?: Y = 3'b001; // D1
      8'b00000001: Y = 3'b000; // Lowest priority: D0
      default: begin
        Y = 3'b000;
      end
    endcase
  end
endmodule

module demux_8to1(
  input d,
  input [2:0] sel,
  output reg [7:0] y
);
  always@(*) begin
    y=8'b0;
    case(sel)
      3'b000: y[0] = d;
      3'b001: y[1] = d;
      3'b010: y[2] = d;
      3'b011: y[3] = d;
      3'b100: y[4] = d;
      3'b101: y[5] = d;
      3'b110: y[6] = d;
      3'b111: y[7] = d;
    endcase
  end
endmodule

module xorgate(
  input a,b,
  output y
);
  xor g1(y,a,b);
endmodule

module top(
  input [7:0] i,
  output [2:0] f_pri,n_pri,
  output f_val,n_val
);
  wire [7:0] w1;
  priority_encoder_8to3 u1 (.D(i),.Y(f_pri),.pri_val(f_val));
  demux_8to1 u2 (.d(1'b1),.sel(f_pri),.y(w1));  
  priority_encoder_8to3 u3 (.D(w1 ^ i),.Y(n_pri),.pri_val(n_val));
endmodule