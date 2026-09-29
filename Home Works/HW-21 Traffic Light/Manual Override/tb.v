module tb;
  reg clk;
  reg rst;
  reg [5:0] y_pulse,g_pulse,max_count;
  wire pulse;
  wire[3:0]state;

  timer t1 (.max_count(max_count),.y_pulse(y_pulse),.g_pulse(g_pulse),.clk(clk),.rst(rst),.pulse(pulse));
  fsm f1(.pulse(pulse),.rst(rst),.state(state));

  always#5clk=~clk;
  initial begin
    clk=0;
    rst=0;
    #10;
    rst=1;
    g_pulse='d58;
    y_pulse='d4;
    max_count='d59;
    #60000;
    $finish;
  end
  initial begin
    $display("g_pulse=%0d::y_pulse=%0d::max_count=%0d",g_pulse,y_pulse,max_count);
    $monitor("count=%d|pulse=%b|state=%d",t1.count,pulse,state);
  end
endmodule
