module tb;
  parameter N=2;
  reg [N-1:0] a,b;
  reg sel;
  wire [N-1:0] y;
  integer i;

  mux2x1 #(N) u_mux2x1(.a(a),.b(b),.sel(sel),.y(y));

  initial begin
    $monitor("a=%b:b=%b:sel=%b:y=%b",a,b,sel,y);

    for(i=0;i<=2**(2*N+1);i++)begin
      {a,b,sel}=i;
      #5;
    end
  end
endmodule