module tb;
  reg clk;
  reg rst;
  reg [10:0] y_pulse,g_pulse;
  wire[3:0]state;
  wire [2:0] t1,t2,t3,t4;

  fsm f1(.y_pulse(y_pulse),.g_pulse(g_pulse),.clk(clk),.rst(rst),.state(state),.t1(t1),.t2(t2),.t3(t3),.t4(t4));

  always#5clk=~clk;
  initial begin
    clk=0;
    rst=0;
    y_pulse=0;
    g_pulse=0;
    #10;
    rst=1;
    g_pulse='d59;
    y_pulse='d4;
  end
  initial begin
    $write("when reset :: ");
    $display("g_pulse=%0d::y_pulse=%0d",g_pulse,y_pulse);
    #10;
    $write("after reset :: ");
    $display("g_pulse=%0d::y_pulse=%0d",g_pulse,y_pulse); $monitor("count=%d|state=%d::T1=%b::T2=%b::T3=%b::T4=%b",f1.count,state,t1,t2,t3,t4);
    #2000
    $finish;
  end
endmodule
