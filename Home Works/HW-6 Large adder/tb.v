module tb;
  reg a,b,c,d;
  wire sum,carry;
  integer i;
  
  large_adder u1(.a(a),.b(b),.c(c),.d(d),.s0(s0),.s1(s1),.cout(cout));
  
  initial begin
    $monitor("a=%b:b=%b:c=%b:d=%b:cout=%b:s1=%b:s0=%b",a,b,c,d,cout,s0,s1);
    for(i=0;i<=15;i++)begin
      {a,b,c,d}=i;
      #1;
    end
  end
endmodule
