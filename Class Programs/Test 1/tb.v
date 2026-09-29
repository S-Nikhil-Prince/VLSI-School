module tb;
reg i0,i1,i2,i3,i4,i5,i6,i7;
  wire [2:0] f_pri,n_pri;
  wire f_val,n_val;
  
  stage2 u1 (i0,i1,i2,i3,i4,i5,i6,i7,f_pri,n_pri,f_val,n_val);
  
  initial begin
  {i0,i1,i2,i3,i4,i5,i6,i7}=8'b10000001;
  #1;
    $monitor("%0b%0b%0b%0b%0b%0b%0b%0b::f_pri=%0d,n_pri=%0d,f_val=%0b,n_val=%0b",i0,i1,i2,i3,i4,i5,i6,i7,f_pri,n_pri,f_val,n_val);
  end
  
endmodule