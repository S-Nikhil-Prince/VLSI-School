module tb;
    parameter WIDTH = 4;
    parameter DEPTH = 16;
    reg wr_clk, rd_clk, wr_rst, rd_rst, wr_en, rd_en,rst;
    reg [WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out;
    wire full, empty;

    top #(.WIDTH(WIDTH),.DEPTH(DEPTH)) u6
	(
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .wr_rst(wr_rst),
        .rd_rst(rd_rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    always #5 wr_clk = ~wr_clk; 
    always #10 rd_clk = ~rd_clk; 
	
	initial begin 
	#30;
	rd_en=1'b1;
	#100;
	$finish;
	end

    initial begin
	$monitor("wr_clk=%0b,rd_clk=%0b,wr_en=%0b,rd_en=%0b,rst=%0b,wr_rst=%0b,rd_rst=%0b,data_in==%d,data_out=%d",wr_clk,rd_clk,wr_en,rd_en,rst,wr_rst,rd_rst,data_in,data_out);
		rst=0;
        wr_clk = 0;
        rd_clk = 0;
        wr_rst = 1;
        rd_rst = 1;
        wr_en = 0;
        rd_en = 0;
        rst = 1;
        data_in = 0;

        #5 wr_rst = 0; rd_rst = 0; rst = 0; 
        #10 wr_rst = 1; rd_rst = 1; rst = 1;

        
        for (int i = 0; i < 2*DEPTH; i++) begin
			wr_en <= 1;
            @(posedge wr_clk);
            data_in <= i;			
        end
        #100 $finish; 
    end
endmodule