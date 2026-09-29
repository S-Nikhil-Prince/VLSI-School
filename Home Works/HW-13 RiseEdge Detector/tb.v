module tb;

  reg a;
  reg clk;
  reg rst;
  wire q;

  dff uut (.a(a),.clk(clk),.rst(rst),.q(q));

  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, tb);
    #300 $finish;
  end

  initial begin
    clk = 0;
    rst = 0;
    a = 1'b0;
    #19;
    $monitor("time=%0t : clk=%d,a=%d,rst=%d,q=%d",$time,clk,a,rst,q);
    rst=1'b1;
    a=1'b1;
    #10
    #10
    a=1'b0;
    #10;
    #10;
    a=1'b1;
    #20;
    a=1'b0;
    #20;
    a=1'b1;
    #20;
    a=1'b0;
    #10;
    #100 $finish;
  end

endmodule