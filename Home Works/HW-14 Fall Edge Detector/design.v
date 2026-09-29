module fall_detection(
  input a,clk,rst,
  output reg q
);
  reg past_a;
  always@(posedge clk or negedge rst)begin
    if(!rst)begin
      q<=1'b0;
      past_a<=1'b0;
    end
    else begin
      past_a<=a;
      q<=(~a)&past_a;
    end
  end
endmodule