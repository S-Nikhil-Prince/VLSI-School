module tb;
  parameter N=2;
  reg [N-1:0]a,b;
  wire [N-1:0] y1,y2,y3,y4,y5,y6,y7;
  integer i;
  
  gates #(N) u1(.a(a),.b(b),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7));
  initial begin
    $monitor("a=%b:b=%b:y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b,y7=%b",a,b,y1,y2,y3,y4,y5,y6,y7);
    for(i=0;i<2**(2*N);i++)begin
      {a,b}=i;
      #5;
    end
  end
endmodule
