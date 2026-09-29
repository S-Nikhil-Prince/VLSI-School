module rr_arb #( 
 parameter NUM_CLIENTS=8
 )
 (
 
 input clk,
 input rst_n,

 input [NUM_CLIENTS-1:0] i_req,

 output [NUM_CLIENTS-1:0] o_grant
 );

 wire [NUM_CLIENTS-1:0] req_masked;
 wire [NUM_CLIENTS-1:0] mask,enc1_one_hot,enc2_one_hot;
 reg [2:0] prev_gnt;
 wire [$clog2(NUM_CLIENTS)-1:0] gnt_final_idx,enc1_idx,enc2_idx;
 wire enc1_valid,enc2_valid;

 assign mask = {{NUM_CLIENTS-1{1'b1}},1'b0} << prev_gnt;

 assign req_masked = i_req & mask; 

 assign gnt_final_idx = (|enc2_valid) ? enc2_idx : enc1_idx;

 assign o_grant = (|enc2_valid) ? enc2_one_hot : enc1_one_hot; 

 always@(posedge clk or negedge rst_n) begin
 if(!rst_n) begin
 prev_gnt<={$clog2(NUM_CLIENTS){1'b0}};
 end
 else if (|i_req) begin
 prev_gnt<= gnt_final_idx ;
 end
 end

 pri_encoder #( 
 .WIDTH(NUM_CLIENTS)
 )

 u_pri_encoder_unmask(
 .i_req(i_req),
 .o_enc_idx(enc1_idx),
 .o_enc_one_hot(enc1_one_hot),
 .o_valid(enc1_valid)

 );

 pri_encoder #( 
 .WIDTH(NUM_CLIENTS)
 )

 u_pri_encoder_mask(
 .i_req(req_masked),
 .o_enc_idx(enc2_idx),
 .o_enc_one_hot(enc2_one_hot),
 .o_valid(enc2_valid)

 );

 endmodule
 
module priority_encoder3_to_8(
input [7:0]i,
output reg high_pri_valid,
output reg [2:0]y);

	always@(*)begin
	high_pri_valid = |i;
	
		casez(i)
			8'b1???_????:y=3'b111;
			8'b01??_????:y=3'b110;
			8'b001?_????:y=3'b101;
			8'b0001_????:y=3'b100;
			8'b0000_1???:y=3'b011;
			8'b0000_01??:y=3'b010;
			8'b0000_001?:y=3'b001;
			8'b0000_0001:y=3'b000;
			default     :y=3'bxxx;
		endcase
	end
endmodule