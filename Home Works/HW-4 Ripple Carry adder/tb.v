module tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  integer i;
  
  ripple u5 (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  
  initial begin
    $monitor("a=%b:b=%b:cin=%b:sum=%b:cout=%b",a,b,cin,sum,cout);
    cin=1'b0;
    for(i=0;i<256;i++) begin
      {a,b}=i;
      #5;
    end
  end
endmodule