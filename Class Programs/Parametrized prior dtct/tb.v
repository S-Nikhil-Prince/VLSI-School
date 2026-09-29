module tb;
  parameter bit_size = 8;
  reg  [bit_size-1:0] i;
  wire [$clog2(bit_size)-1:0] f_pri;
  wire [$clog2(bit_size)-1:0] n_pri;
  wire f_val, n_val;
  
  top #(.bit_size(bit_size)) u4 (.i(i),.f_pri(f_pri),.n_pri(n_pri),.f_val(f_val),.n_val(n_val));

  initial begin
    i = 'b10110110;
    #1;
    $display("%b :: f_pri=%0d, n_pri=%0d, f_val=%0b, n_val=%0b",i, f_pri, n_pri, f_val, n_val);
    #10 $finish;
  end
endmodule