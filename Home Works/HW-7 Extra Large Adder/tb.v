module tb;
  reg a,b,c,d,e;
  wire sum,carry;
  integer i;
  
  ela u1(.a(a),.b(b),.c(c),.d(d),.e(e),.s0(s0),.s1(s1),.cout(cout));
  
  initial begin
    $monitor("a=%b:b=%b:c=%b:d=%b:e=%b:cout=%b:s0=%b:s1=%b",a,b,c,d,e,cout,s0,s1);
    for(i=0;i<=31;i++)begin
      {a,b,c,d,e}=i;
      #1;
    end
  end
endmodule
