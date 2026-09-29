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
