module dff(
  input a,
  input clk,rst,
  output reg q
);
  reg a_pr;
  always@(posedge clk or negedge rst) begin
    if(!rst)begin
      a_pr<=1'b0;
      q<=1'b0;
    end
    else begin
      a_pr<=a;
      q<=(~a_pr) & a ;
    end
  end
endmodule

  