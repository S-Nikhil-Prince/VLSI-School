module tb;
  reg [7:0] i;
  wire [2:0] f_pri,n_pri;
  wire f_val,n_val;

  top u4 (.i(i),.f_pri(f_pri),.n_pri(n_pri),.f_val(f_val),.n_val(n_val));

  initial begin
    i=8'b10000100;
    #1;
    $monitor("%b::f_pri=%0d,n_pri=%0d,f_val=%0b,n_val=%0b",i,f_pri,n_pri,f_val,n_val);
  end
endmodule