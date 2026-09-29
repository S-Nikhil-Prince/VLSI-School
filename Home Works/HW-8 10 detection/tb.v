module tb;
  reg [7:0] i;
  wire [7:0] o;
  integer j;

  logicb u1(o,i);

  initial begin
    repeat(10) begin
      i = $random;
      #1;
      $display("i=%b, number of 10s=%0d", i, o);
    end
  end
endmodule