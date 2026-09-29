module tb;
reg clk;
reg rst_n;
reg coin_5;
reg coin_10;
wire dispense;
wire change_5;

vending_fsm u1 (
    .clk(clk),
    .rst_n(rst_n),
    .coin_5(coin_5),
    .coin_10(coin_10),
    .dispense(dispense),
    .change_5(change_5)
);
always #10 clk = ~clk;
initial begin
    clk = 0;
    rst_n = 0;
    coin_5 = 0;
    coin_10 = 0;
    $monitor("time=%0t clk=%b rst_n=%b coin_5=%b coin_10=%b state=%s dispense=%b change_5=%b",
             $time, clk, rst_n, coin_5, coin_10, u1.state.name(), dispense, change_5);
    // Reset
    #20
    rst_n = 1;
    //5 + 5 + 5 = 15
    coin_5 = 1;  
	#20;
    coin_5 = 0;  
	#20;
    coin_5 = 1;  
	#20;
    coin_5 = 0;  
	#20;
    coin_5 = 1;  
	#20;
    coin_5 = 0;  
	#20;
    //5 + 10 = 15
    coin_5 = 1;  
	#20;
    coin_5 = 0;
    coin_10 = 1; 
	#20;
    coin_10 = 0; 
	#20;
    //10 + 5 = 15
    coin_10 = 1; 
	#20;
    coin_10 = 0;
    coin_5 = 1;  
	#20;
    coin_5 = 0;
	#20;
    //10 + 10 = 20
    coin_10 = 1; 
	#20;
    coin_10 = 0; 
	#20;
    coin_10 = 1; 
	#20;
    coin_10 = 0;
	#20;
    $finish;
end
endmodule