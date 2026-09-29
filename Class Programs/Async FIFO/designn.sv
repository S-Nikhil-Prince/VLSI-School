module write_domain#(
  parameter WIDTH = 4,
  parameter DEPTH = 16
)(
  input wr_en,wr_clk,wr_rst,
  input [$clog2(DEPTH):0] rd_ptr_grey,
  output reg [$clog2(DEPTH):0] wr_ptr_bin,wr_ptr_grey,
  output wire full
);

  //assign full = (wr_ptr_grey == {~rd_ptr_grey[$clog2(DEPTH):$clog2(DEPTH)-1], rd_ptr_grey[$clog2(DEPTH)-2:0]});
  assign full = ((wr_ptr_grey[$clog2(DEPTH):$clog2(DEPTH)-1] != (rd_ptr_grey[$clog2(DEPTH):$clog2(DEPTH)-1]) && (wr_ptr_grey[$clog2(DEPTH)-2:0] == rd_ptr_grey[$clog2(DEPTH)-2:0])));

  always@(posedge wr_clk or negedge wr_rst) begin
    if(!wr_rst) begin
      wr_ptr_bin<=0;
      wr_ptr_grey<=0;
    end
    else begin
      if(!full && wr_en) begin
        wr_ptr_bin <= wr_ptr_bin+1'b1;
        wr_ptr_grey <= ((wr_ptr_bin+1'b1) ^ ((wr_ptr_bin+1'b1)>>1)); //write with function
      end
      else begin
        wr_ptr_bin <= wr_ptr_bin;
        wr_ptr_grey <= wr_ptr_grey;
      end
    end
  end
endmodule

//read domain
module read_domain#(
  parameter WIDTH = 4,
  parameter DEPTH = 16
)(
  input rd_clk,rd_rst,rd_en,
  input [$clog2(DEPTH):0] wr_ptr_grey,
  output reg [$clog2(DEPTH):0] rd_ptr_bin,rd_ptr_grey,
  output wire empty
);

  assign empty = (rd_ptr_grey == wr_ptr_grey);

  always@(posedge rd_clk or negedge rd_rst) begin
    if(!rd_rst) begin
      rd_ptr_bin<=0;
      rd_ptr_grey<=0;
    end
    else begin
      if(!empty && rd_en) begin
        rd_ptr_bin <= rd_ptr_bin+1'b1;
        rd_ptr_grey <= ((rd_ptr_bin+1'b1) ^ ((rd_ptr_bin+1'b1)>>1)); //use the function
      end
      else begin
        rd_ptr_bin <= rd_ptr_bin;
        rd_ptr_grey <= rd_ptr_grey;
      end
    end
  end
endmodule

//CDC Sync Cell

module cdc#(
  parameter DEPTH = 16,
  parameter STAGE = 2,
  parameter WIDTH = $clog2(DEPTH)
)(
  input [WIDTH:0] inp,
  input clk,rst,
  output [WIDTH:0] data
);
  reg [WIDTH:0] mid [STAGE-1:0];

  integer i;

  always@(posedge clk or negedge rst) begin
    if(!rst)begin
      for(i=0;i<STAGE;i=i+1) begin
        mid[i]<=0;
      end
    end
    else begin
      mid[0]<=inp;
      for(i=1;i<STAGE;i=i+1) begin
        mid[i]<=mid[i-1];
      end
    end
  end
  assign data=mid[STAGE-1];
endmodule


//fifo module
module fifo#(
  parameter WIDTH = 4,
  parameter DEPTH = 16
)(
  input [$clog2(DEPTH):0] wr_ptr,rd_ptr,
  input [WIDTH-1:0] inp_data,
  input wr_en,rd_en,wr_clk,rd_clk,rst,full,empty,
  output reg [WIDTH-1:0] out_data
);

  reg [WIDTH-1:0] fifo [DEPTH-1:0];

  always@(posedge wr_clk) begin
    if(!rst) begin
      for(int i=0;i<=DEPTH-1;i=i+1)				//for loop to reset all locations
        fifo [i]<={WIDTH{1'b0}};
    end
    else begin
      if(wr_en && !full)
        fifo [wr_ptr[$clog2(DEPTH)-1:0]] <= inp_data;
    end
  end
  always@(posedge rd_clk) begin
    if(!rst)
      out_data<=0;
    else begin
      if(rd_en && !empty) begin
        out_data <= fifo [rd_ptr[$clog2(DEPTH)-1:0]];
      end
    end
  end
endmodule

module top#(
  parameter WIDTH = 4,
  parameter DEPTH = 16
)(
  input wr_clk, wr_rst,
  input rd_clk, rd_rst,
  input wr_en, rd_en,rst,
  input [WIDTH-1:0] data_in,
  output [WIDTH-1:0] data_out,
  output full, empty
);
  wire [$clog2(DEPTH):0] w1,w2,w3,w4,w5,w6;
  wire p1,p2;

  assign full=p1;
  assign empty=p2;

  write_domain #(.WIDTH(WIDTH),.DEPTH(DEPTH)) 
  u1 (.wr_en(wr_en),
      .wr_clk(wr_clk),
      .wr_rst(wr_rst),
      .rd_ptr_grey(w5),
      .wr_ptr_bin(w1),
      .wr_ptr_grey(w2),
      .full(p1)
     );

  read_domain #(.WIDTH(WIDTH),.DEPTH(DEPTH))
  u2 (.rd_en(rd_en),
      .rd_clk(rd_clk),
      .rd_rst(rd_rst),
      .wr_ptr_grey(w6),
      .rd_ptr_bin(w3),
      .rd_ptr_grey(w4),
      .empty(p2)
     );

  cdc #(.WIDTH(WIDTH),.DEPTH(DEPTH))
  u3(.inp(w2),
     .clk(rd_clk),
     .rst(rd_rst),
     .data(w6)
    );

  cdc #(.WIDTH(WIDTH),.DEPTH(DEPTH))
  u4 (.inp(w4),
      .clk(wr_clk),
      .rst(wr_rst),
      .data(w5)
     );

  fifo #(.WIDTH(WIDTH),.DEPTH(DEPTH))
  u5(.wr_ptr(w1),
     .rd_ptr(w3),
     .inp_data(data_in),
     .wr_en(wr_en),
     .rd_en(rd_en),
     .wr_clk(wr_clk),
     .rd_clk(rd_clk),
     .rst(rst),
     .full(p1),
     .empty(p2),
     .out_data(data_out)
    );
endmodule