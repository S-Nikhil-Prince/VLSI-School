module tb;
  reg a,b;
  wire ynand,ynot,yand,yor,ynor,yxor,yxnor;
  integer i;
  
  nandgate u1_nandgate(.a(a),.b(b),.y(ynand));
  notgate u_notgate(.a(a),.y(ynot));
  andgate u_andgate(.a(a),.b(b),.y(yand));
  orgate u_orgate(.a(a),.b(a),.y(yor));
  norgate u_norgate(.a(a),.b(a),.y(ynor));
  xorgate u_xorgate(.a(a),.b(a),.y(yxor));
  xnorgate u_xnorgate(.a(a),.b(a),.y(yxnor));
  initial begin
    $monitor("a=%0b:b=%0b:ynand=%0b,ynot=%0b,yand=%0b,yor=%0b,ynor=%0b,yxor=%0b,yxnor=%0b",a,b,ynand,ynot,yand,yor,ynor,yxor,yxnor);
    for(i=0;i<=3;i++)begin
      {a,b}=i;
      #5;
    end
  end
endmodule
