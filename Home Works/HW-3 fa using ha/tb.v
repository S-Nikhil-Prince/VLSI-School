module tb;
  reg a,b,c;
  wire sum,carry;
  integer i;
  
  fa_using_ha u1 (.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  
  initial begin
    $monitor("a=%0b:b=%0b:c=%0b:sum=%0b:carry=%0b",a,b,c,sum,carry);
    for(i=0;i<8;i++)begin
      {a,b,c}=i;
      #5;
    end
  end
endmodule