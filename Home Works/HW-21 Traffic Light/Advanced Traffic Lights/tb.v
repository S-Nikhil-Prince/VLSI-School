module tb;
  reg clk;
  reg rst;
  reg [10:0] ng_pulse,ny_pulse,eg_pulse,ey_pulse,sg_pulse,sy_pulse,wg_pulse,wy_pulse;
  wire[3:0]state;
  wire [2:0] t1,t2,t3,t4;

  fsm f1(.ny_pulse(ny_pulse),.ng_pulse(ng_pulse),.eg_pulse(eg_pulse),.ey_pulse(ey_pulse),.sg_pulse(sg_pulse),.sy_pulse(sy_pulse),.wg_pulse(wg_pulse),.wy_pulse(wy_pulse),.clk(clk),.rst(rst),.state(state),.t1(t1),.t2(t2),.t3(t3),.t4(t4));

  always#5clk=~clk;
  initial begin
    clk=0;
    rst=0;
    ng_pulse=11'd0;
    ny_pulse=11'd0;
    eg_pulse=11'd0;
    ey_pulse=11'd0;
    sg_pulse=11'd0;
    sy_pulse=11'd0;
    wg_pulse=11'd0;
    wy_pulse=11'd0;
    #10;
    rst=1;
    ng_pulse=11'd59;
    ny_pulse=11'd4;
    eg_pulse=11'd40;
    ey_pulse=11'd4;
    sg_pulse=11'd40;
    sy_pulse=11'd4;
    wg_pulse=11'd40;
    wy_pulse=11'd4;
  end
  initial begin
    $write("when reset :: ");
    $display("ng_pulse=%d,ny_pulse=%d,eg_pulse=%d,ey_pulse=%d,sg_pulse=%d,sy_pulse=%d,wg_pulse=%d,wy_pulse=%d",ng_pulse,ny_pulse,eg_pulse,ey_pulse,sg_pulse,sy_pulse,wg_pulse,wy_pulse);
    #10;
    $write("after reset :: ");
    $display("ng_pulse=%d,ny_pulse=%d,eg_pulse=%d,ey_pulse=%d,sg_pulse=%d,sy_pulse=%d,wg_pulse=%d,wy_pulse=%d",ng_pulse,ny_pulse,eg_pulse,ey_pulse,sg_pulse,sy_pulse,wg_pulse,wy_pulse);
    $monitor("count=%d|state=%d::T1=%b::T2=%b::T3=%b::T4=%b",f1.count,state,t1,t2,t3,t4);

    #2000
    $finish;
  end
endmodule
