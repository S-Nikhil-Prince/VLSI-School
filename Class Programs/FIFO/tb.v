module tb;
  parameter DATA_WIDTH=6,DEPTH=4;
  reg [DATA_WIDTH-1:0] wr_data;
  reg clk,rst,wr_en,rd_en;
  wire fifo_full,fifo_empty;
  wire [DATA_WIDTH-1:0] rd_data;
  
  fifo#(6,4) u1 (.wr_data(wr_data),.clk(clk),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),.fifo_full(fifo_full),.fifo_empty(fifo_empty),.rd_data(rd_data));
  
  always #5 clk=~clk;
  
  initial begin
    rst=1'b0;
    wr_data='b0;
	//rd_data='b0;
    clk=1'b0;
    wr_en=1'b0;
    rd_en=1'b0;
    #11;
    rst=1'b1;
    wr_en=1'b1;
    wr_data=6'd16;
    #10;
    wr_data=6'd31;
    #10;
    wr_data=6'd59;
	#10;
    wr_data=6'd60;
	#10;
    wr_data=6'd17;
	#10;
    wr_data=6'd29;
    #10;
    wr_data=2'd10;
    #10;
	rd_en=1'b0;
	#60;
	wr_en=1'b1;
    wr_data=6'd16;
	#10;
	wr_data=6'd17;
    #10;
	wr_en=1'b0;
    #10;
    rd_en=1'b1;
	#90;
	rd_en=1'b0;
    $monitor("rst=%0b,wr_en=%0b,wr_data=%b,rd_en=%0b,fifo_full=%0b,fifo_empty=%0b::rd_data=%b",rst,wr_en,wr_data,rd_en,fifo_full,fifo_empty,rd_data);
    #100;
    $finish;
  end
endmodule    