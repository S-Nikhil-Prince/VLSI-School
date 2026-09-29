module tb;
  reg [15:0] i;
  wire [3:0] y;
  integer j;
  
  enc_16_4 u_enc_16_4(.i(i),.y(y));
  
  initial begin
    $monitor("i=%b,y=%b",i,y);
    i=16'b0000000000000001;
    #1;
    for(j=0;j<15;j++)begin
      i=i<<1;
      #1;
    end
  end
endmodule