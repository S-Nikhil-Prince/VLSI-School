module tb;
reg a,b;
wire y;
integer i;
andgate u1(a,b,y);

initial begin
for(i=0;i<=3;i=i+1)
begin
{a,b}=i;
#1;
$display("a=%b:b=%b:y1=%b:y2=%b:y3=%b:y4=%b:y5=%b:y6=%b:y7=%b",a,b,y1,y2,y3,y4,y5,y6,y7);
end
end
endmodule