module tb;
	reg d;
    reg clk;
    reg rst_n;
    wire q;
	
	dff u1 ( .d(d),.clk(clk),.rst_n(rst_n),.q(q));
	
	initial begin
	clk=1'b0;
	forever begin
	#5;
	clk=~clk;
	end
	end
	
	initial begin
	$monitor("d=%0b:clk=%0b:rst_n=%0b:q=%0b",d,clk,rst_n,q);
	rst_n=1'b0;
	#10;
	rst_n=1'b1;
	#10;
	d=1'b0;
	#10;
	d=1'b1;
	#10;
	d=1'b0;
	#100;
	$finish;
	end
endmodule