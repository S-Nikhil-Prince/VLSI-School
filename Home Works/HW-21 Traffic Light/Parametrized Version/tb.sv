module tb;
  parameter max_count='d590;
  parameter y_pulse='d40;
  parameter g_pulse='d580;

  reg clk;
  reg rst;
  wire pulse;
  wire[3:0]state;

  timer#(max_count,y_pulse,g_pulse) t1 (.clk(clk),.rst(rst),.pulse(pulse));
  fsm f1(.pulse(pulse),.rst(rst),.state(state));

  always#5clk=~clk;
  initial begin
    clk=0;
    rst=0;
    #10;
    rst=1;
    #60000;
    $finish;
  end
  initial begin
    $monitor("count=%d|pulse=%b|state=%d",t1.count,pulse,state);
  end
endmodule
