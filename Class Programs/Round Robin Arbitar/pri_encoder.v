module pri_encoder # (
parameter WIDTH=2
)(
input [WIDTH-1:0] i_data,
output reg [WIDTH-1:0] o_data,
output reg [$clog2(WIDTH)-1:0] pos,
output reg o_valid
);
integer i;

always@(*) begin
	o_data={WIDTH{1'b0}};
	pos={$clog2(WIDTH){1'b0}};
	o_valid=1'b0;
	
	for(i=0;i<WIDTH;i=i+1)  begin
		if(i_data[i] && !o_valid) begin
			pos=i;
			o_data[i]=1'b1;
			o_valid=1'b1;
		end
	end
end
endmodule