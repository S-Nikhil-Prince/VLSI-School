module vending_fsm (
    input  wire clk,
    input  wire rst_n,
    input  wire coin_5,
    input  wire coin_10,
    output reg dispense,
    output reg change_5
);
  typedef enum logic [1:0] {
  IDLE = 2'b00,
  S5   = 2'b01,
  S10  = 2'b10
} state_t;

state_t state,next_state;

//type def vadithe output lo niku state name vasthade
//reg [1:0] state;
//reg [1:0] next_state;

/*parameter IDLE = 2'b00;
parameter S5   = 2'b01;
parameter S10  = 2'b10;*/

always @(posedge clk) begin
    if (!rst_n)
        state <= IDLE;
    else
        state <= next_state;
end

always @(*) begin

    next_state = state;
    dispense = 0;
    change_5 = 0;

    case (state)

        IDLE: begin
            if (coin_5)
                next_state = S5;
            else if (coin_10)
                next_state = S10;
        end

        S5: begin
            if (coin_5)
                next_state = S10;
            else if (coin_10) begin
                next_state = IDLE;
                dispense = 1;
                change_5 = 0;
            end
        end

        S10: begin
            if (coin_5) begin
                next_state = IDLE;
                dispense = 1;
                change_5 = 0;
            end
            else if (coin_10) begin
                next_state = IDLE;
                dispense = 1;
                change_5 = 1;
            end
        end

        default:
            next_state = IDLE;

    endcase

end

endmodule