module rrb_arb(
parameter NUM_CLIENTS=2
)(
input [NUM_CLIENTS-1:0] ireq,
input clk,rst,
output [NUM_CLIENTS-1:0] oreq
);

wire [NUM_CLIENTS-1:0] mask;
reg [$clog2(NUM_CLIENTS)-1:0] en1_index,en2_index;
reg [NUM_CLIENTS-1:0] en1_out,en2_out;
wire [NUM_CLIENTS-1:0] masked_req;
reg [$clog2(NUM_CLIENTS)-1:0] prev_req;
reg en1_valid,en2_valid;
wire final_req;

assign mask = {{NUM_CLIENTS-1:0{1'b1}},1'b0} << prev_req;
assign masked_req = ireq & mask;
assign final_req = (en2_valid) ? en2_index : en1_index;
assign oreq = (en2_valid) ? en2_out : en1_out;

always@(posedge clk or negedge rst) begin
if(!rst) begin
prev_req<='b0;
end
else begin
prev_req<= final_req;
end
end

pri_encoder # (.WIDTH(NUM_CLIENTS))
pri_encoder_unmasked (.i_data(ireq),.o_data(en1_out),.pos(en1_index),.o_valid(en1_valid));
pri_encoder # (.WIDTH(NUM_CLIENTS))
pri_encoder_masked(.i_data(masked_req),.o_data(en2_out),.pos(en2_index),.o_valid(en2_valid));
endmodule