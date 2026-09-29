module tb();
 parameter NUM_CLIENTS=4;

 reg clk;
 reg rst_n;

 reg [NUM_CLIENTS-1:0] i_req;

 wire [NUM_CLIENTS-1:0] o_grant;
 
 rr_arb #( 
 .NUM_CLIENTS(NUM_CLIENTS)
 )
 u_rr_arb (

 .clk(clk),
 .rst_n(rst_n),

 .i_req(i_req),

 .o_grant(o_grant)
 );

 always begin
 clk =1'b0;
 #5;
 clk =1'b1;
 #5;
 end

 initial begin
 rst_n=1'b0;
 #19;
 rst_n=1'b1;
 #19;
 @(posedge clk)
 #0;
 i_req=4'b1111;
 #200;

 end

endmodule