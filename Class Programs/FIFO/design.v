module fifo#(
  parameter DATA_WIDTH=6,DEPTH=4      )(
  input [DATA_WIDTH-1:0] wr_data,
  input clk,rst,wr_en,rd_en,
  output fifo_full,fifo_empty,
  output reg [DATA_WIDTH-1:0] rd_data
);

  reg [$clog2(DEPTH):0] rd_ptr;
  reg [$clog2(DEPTH):0] wr_ptr;
  reg [DATA_WIDTH-1:0] fifo [DEPTH-1:0];

  assign fifo_empty=(wr_ptr == rd_ptr);
  assign fifo_full =((wr_ptr[$clog2(DEPTH)] != rd_ptr[$clog2(DEPTH)])&& (wr_ptr[$clog2(DEPTH)-1:0] == rd_ptr[$clog2(DEPTH)-1:0]));

  always@(posedge clk or negedge rst)begin
  
    if(!rst)begin
      rd_data<='b0;
      wr_ptr<='b0;
      rd_ptr<=4'b0;
    end
    else begin
      if(wr_en && !fifo_full)begin
        fifo[wr_ptr[$clog2(DEPTH)-1:0]]<=wr_data;
        if(wr_ptr[$clog2(DEPTH)-1:0] == DEPTH-1)
			wr_ptr <= {~wr_ptr[$clog2(DEPTH)],{$clog2(DEPTH){1'b0}}};
		else 
			wr_ptr<=wr_ptr+1;
      end
      if(rd_en && !fifo_empty)begin
        rd_data<=fifo[rd_ptr[$clog2(DEPTH)-1:0]];
		if(rd_ptr[$clog2(DEPTH)-1:0] == DEPTH-1)
			rd_ptr <= {~rd_ptr[$clog2(DEPTH)],{$clog2(DEPTH){1'b0}}};
		else 
			rd_ptr<=rd_ptr+1;
      end
      else begin
        rd_data<=rd_data;
		end
    end
  end
endmodule
