module tb;
  reg a;
  reg clk;
  reg rst;
  wire q1,q2,q3;

  dff uut (.a(a),.clk(clk),.rst(rst),.q1(q1),.q2(q2),.q3(q3));

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
    $monitor("time=%0t : clk=%d,a=%d,rst=%d,q1=%d,q2=%d,q3=%d",$time,clk,a,rst,q1,q2,q3);
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