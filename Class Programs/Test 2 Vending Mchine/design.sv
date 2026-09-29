module vending(
  input clk, rst,
  input wire c_5, c_10,
  output reg dispense, change
);

  
  typedef enum logic [1:0] {
  idle = 2'b00,
  s5   = 2'b01,
  s10  = 2'b10
} state_t;

state_t state, next_state;
  
  always @(posedge clk or negedge rst) begin
    if (!rst) 
      state <= idle;
    else
      state <= next_state;
    end

  always @(*) begin
    next_state = state;
    dispense = 0;
    change = 0;

    case(state)
      idle: begin
        if (c_5) next_state = s5;
        else if (c_10) next_state = s10;
		else next_state<=state;
      end

      s5: begin
        if (c_5) next_state = s10;
        else if (c_10) begin
          next_state = idle;
          dispense = 1;
        end
		else next_state<=state;
      end

      s10: begin
        if (c_5) begin
          next_state = idle;
          dispense = 1;
        end 
        else if (c_10) begin
          next_state = idle;
          dispense = 1;
          change = 1;
        end
		else next_state<=state;
      end
    endcase
  end
endmodule
