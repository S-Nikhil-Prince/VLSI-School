module dff(
  input a,
  input clk,rst,
  output reg q1,q2,q3
);
  reg a_pr;
  always@(posedge clk or negedge rst) begin
    if(!rst)begin
      a_pr<=1'b0;
      q1<=1'b0;
      q2<=1'b0;
      q3<=1'b0;
    end
    else begin
      a_pr<=a;
      q1<=(~a_pr)&a;
      q2<=(~a)&a_pr;
      q3<=((~a)&a_pr)|((~a_pr)&a);
    end
  end
endmodule

  