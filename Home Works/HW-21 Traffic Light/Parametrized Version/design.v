module timer#(
  parameter max_count = 'd59,
  y_pulse = 'd4,
  g_pulse = 'd58)
  (
  input clk,
  input rst,
  output reg pulse
);

  reg [$clog2(max_count)-1:0] count;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      count <= 6'd0;
      pulse <= 1'b0;
    end
    else begin
      pulse <= 1'b0;
      if (count == g_pulse) begin
        pulse <= 1'b1;
        count <= 6'd0;
      end
      else begin
        count<=count + 1'b1;
        if (count == y_pulse)
          pulse <= 1'b1;
      end
    end
  end
endmodule


module fsm(
  input pulse,rst,
  output reg [3:0] state
);
  reg [3:0] next_state;

  parameter ny = 4'b0000,
  ng = 4'b0001,
  ey = 4'b0010,
  eg = 4'b0011,
  sy = 4'b0100,
  sg = 4'b0101,
  wy = 4'b0110,
  wg = 4'b0111,
  ar = 4'b1000;

  always@(posedge pulse or negedge rst)
    begin
      if(!rst)
        state<=ar;
      else
        state<=next_state;
    end

  always@(*) 
    begin
      case(state)
        ar : next_state = ny;
        ny : next_state = ng;
        ng : next_state = ey;
        ey : next_state = eg;
        eg : next_state = sy;
        sy : next_state = sg;
        sg : next_state = wy;
        wy : next_state = wg;
        wg : next_state = ny;
        default:next_state=ar;
      endcase
    end
endmodule