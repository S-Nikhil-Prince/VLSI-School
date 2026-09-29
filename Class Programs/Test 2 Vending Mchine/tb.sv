module tb;
  reg clk, rst;
  reg c_5, c_10;
  wire dispense, change;

  vending dut (
    .clk(clk),
    .rst(rst),
    .c_5(c_5),
    .c_10(c_10),
    .dispense(dispense),
    .change(change)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  initial begin
    rst = 0; c_5 = 0; c_10 = 0;
    #12 rst = 1; 

    #10 c_5 = 1; #10 c_5 = 0;
    #10 c_10 = 1; #10 c_10 = 0;

    #20 c_10 = 1; #10 c_10 = 0;
    #10 c_5 = 1; #10 c_5 = 0;

    #20 c_10 = 1; #10 c_10 = 0;
    #10 c_10 = 1; #10 c_10 = 0;

    #20 c_5 = 1; #10 c_5 = 0;
    #10 c_5 = 1; #10 c_5 = 0;
    #10 c_5 = 1; #10 c_5 = 0;
    #50 $finish;
  end

  initial begin
    $monitor("Time=%0t | state=%s | c_5=%b c_10=%b | dispense=%b change=%b",
             $time, dut.state.name(), c_5, c_10, dispense, change);
  end
endmodule
