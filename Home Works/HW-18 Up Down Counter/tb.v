module tb;
  parameter COUNT = 4;
  reg clk,sel;
  reg rst_n;
  wire [$clog2(COUNT)-1:0] count;

  mod_counter#(COUNT) u1 (.clk(clk),.sel(sel),.rst_n(rst_n),.count(count));

  always #5 clk=~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end

  initial begin
    rst_n=1'b0;
    clk=1'b0;
    sel=1'b1;
    #19;
    $monitor("clk=%0d,sel=%0d,rst_n=%0d,count=%0d",clk,sel,rst_n,count);
    rst_n=1'b1;
    #200;
    sel=1'b0;
    #300;
    $finish;
  end
endmodule