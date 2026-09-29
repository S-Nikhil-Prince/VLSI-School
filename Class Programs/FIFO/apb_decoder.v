module apb_decoder#(parameter BEAT_SIZE = 512)(
input fifo_status,clk,rst,
input [BEAT_SIZE-1:0]pwdata,
input fifo1_full,fifo1_empty,fifo2_full,fifo2_empty,
input ch0_overflow,ch1_overflow,
input ch0_ready,ch1_ready,
input pw_enable,
input reg [31:0] CH0_PKT_CNT;
input reg [31:0] CH1_PKT_CNT;
output reg prdata,
output reg [31:0] CTRL_REG,
output reg [31:0] ARBITER_CFG,
output pslverr
);

	reg [31:0] ERR_STATUS;
	wire [31:0] FIFO_STATUS;
	
	//error status
	ERR_STATUS [0] = ch0_overflow;
	ERR_STATUS [1] = 
	ERR_STATUS [2] = 
	
	//fifo status
	assign FIFO_STATUS [0] = fifo1_full;
	assign FIFO_STATUS [1] = fifo1_empty;
	assign FIFO_STATUS [2] = fifo2_full;
	assign FIFO_STATUS [3] = fifo2_empty;
	

always@(posedge clk or negedge rst) begin
	if(!rst)begin
		pr_data     <={BEAT_SIZE{1'b0}};
		CTRL_REG    <= {32{1'b0}};
		ARBITER_CFG <={32{1'b0}};
	end
	else begin
	if(pw_enable &&  (ch1_ready || ch0_ready) ) begin
		pr_data <= pw_data;
		end
	end
end
endmodule