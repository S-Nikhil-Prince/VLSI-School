module mod_counter #(parameter COUNT = 4)
  (
    input clk,sel,
    input rst_n, // active low async reset
    output reg [$clog2(COUNT)-1:0] count
  );

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count <= 0;
    end
    else if (sel) begin
      // UP counter
      if (count == COUNT-1)
        count <= 0;
      else
        count <= count + 1'b1;
    end
    else begin
      // DOWN counter
      if (count == 0)
        count <= COUNT-1;
      else
        count <= count - 1'b1;
    end
  end
endmodule