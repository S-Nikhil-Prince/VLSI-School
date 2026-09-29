module tb;
  reg [7:0] i;
  wire [2:0] y;
  integer j;
  
  enc_8_3 u_enc_8_3(.i(i),.y(y));
  
  initial begin
    $monitor("i=%b,y=%b",i,y);
    i=8'b00000001;
    #1;
    for(j=0;j<7;j++)begin
      i=i<<1;
      #1;
    end
  end
endmodule