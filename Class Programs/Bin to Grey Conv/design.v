module bin_grey_conv#(parameter SIZE = 4)(
  input [SIZE-1:0] bin_data,
  output reg [SIZE-1:0] grey_data
);
  integer i;
  always@(*)begin
    grey_data[SIZE-1]=bin_data[SIZE-1];
    for(i=SIZE-2;i>=0;i=i-1) begin
      grey_data[i]=bin_data[i+1] ^ bin_data[i];
    end
  end
endmodule