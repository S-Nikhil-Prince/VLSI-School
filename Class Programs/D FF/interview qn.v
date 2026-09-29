if we use non blocking assignment then it will act as parallel dff.
ex:
always@(posedge clk) begin
q1<=1'b0;
q2<=q1;
q3<=q2;
end

if we synthesize this then three flipflops will be present in the design.


-=-=-=-= but -=-=-=-=-=
when used blocking assignment in one block then it acts as cascaded dff
ex :
always@(posedge clk) begin
q1=1'b0;
q2=q1;
q3=q2;
end

but in synthesis only one flipflop is present


if we change the order of the statements then 

in synthesis


if we use non blocking assignment then we can write pipelining operation in any number of always blocks
but if we use blocking assignment then if we use multiple always blocks then it will not work as expected because the order of execution of always blocks is not guaranteed.

-=-=-Interview Question-=-=-

write a code to swap 2 numbers without using temp variable
code:
      a=10 and b=20
a<=b; a=20 and b=20
b<=a; a=20 and b=10

because 

a=10 and b=20

a<=b     b<=a   -> both happen at same time
a=20     b=10


if we use blocking then
a=b;
b=a;

then a=20 and b=20
because the a is already updated before assigning past value to b.

if we need to use blocking then we need temp variable.
temp=a
a=b
b=temp