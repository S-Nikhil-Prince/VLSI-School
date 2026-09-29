module tb;
  parameter SIZE=4;
  reg [SIZE-1:0] bin_data;
  wire [SIZE-1:0] grey_data;
  
  bin_grey_conv#(4) dut (.bin_data,.grey_data);
  
  initial begin
    bin_data='b0110;
    #20;
    $display("bin_data=%b,grey_data=%b",bin_data,grey_data);
  end
endmodule