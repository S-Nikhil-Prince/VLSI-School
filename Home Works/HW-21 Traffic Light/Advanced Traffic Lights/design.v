module fsm(
  input rst,clk,
  input [10:0] ng_pulse,ny_pulse,eg_pulse,ey_pulse,sg_pulse,sy_pulse,wg_pulse,wy_pulse,  
  output reg [3:0] state,
  output reg [2:0] t1,t2,t3,t4
);

  reg [3:0] next_state;
  reg [10:0] count;

  parameter ny = 4'b0000,
            ng = 4'b0001,
            ey = 4'b0010,
            eg = 4'b0011,
            sy = 4'b0100,
            sg = 4'b0101,
            wy = 4'b0110,
            wg = 4'b0111,
            ar = 4'b1000;

  always@(posedge clk or negedge rst)
  begin

    if (!rst) begin
      state <= ar;
      t1 <= 3'b100;
      t2 <= 3'b100;
      t3 <= 3'b100;
      t4 <= 3'b100;
      count <= 11'd0;
    end

    else if (state == ar) begin
      state <= next_state;
      count <= 11'd0;
    end

    else begin

      if (state == ny) begin

        if (count == ny_pulse) begin
          state <= next_state;
          count <= 11'd0;
        end
        else begin
          count <= count + 1'b1;
        end

      end

      else if (state == ey) begin

        if (count == ey_pulse) begin
          state <= next_state;
          count <= 11'd0;
        end
        else begin
          count <= count + 1'b1;
        end

      end

      else if (state == sy) begin

        if (count == sy_pulse) begin
          state <= next_state;
          count <= 11'd0;
        end
        else begin
          count <= count + 1'b1;
        end

      end

      else if (state == wy) begin

        if (count == wy_pulse) begin
          state <= next_state;
          count <= 11'd0;
        end
        else begin
          count <= count + 1'b1;
        end

      end

      else begin

        if (state == ng) begin

          if (count == ng_pulse) begin
            state <= next_state;
            count <= 11'd0;
          end
          else begin
            count <= count + 1'b1;
          end

        end

        else if (state == eg) begin

          if (count == eg_pulse) begin
            state <= next_state;
            count <= 11'd0;
          end
          else begin
            count <= count + 1'b1;
          end

        end

        else if (state == sg) begin

          if (count == sg_pulse) begin
            state <= next_state;
            count <= 11'd0;
          end
          else begin
            count <= count + 1'b1;
          end

        end

        else if (state == wg) begin

          if (count == wg_pulse) begin
            state <= next_state;
            count <= 11'd0;
          end
          else begin
            count <= count + 1'b1;
          end

        end

      end
    end
  end


  always@(*) begin

    case(state)

      ar : begin 
        next_state = ny;
        t1 = 3'b100;
        t2 = 3'b100;
        t3 = 3'b100;
        t4 = 3'b100;
      end

      ny : begin
        next_state = ng;
        t1 = 3'b010;
        t2 = 3'b100;
        t3 = 3'b100;
        t4 = 3'b100;
      end

      ng : begin
        next_state = ey;
        t1 = 3'b001;
        t2 = 3'b100;
        t3 = 3'b100;
        t4 = 3'b100;
      end

      ey : begin 
        next_state = eg;
        t1 = 3'b100;
        t2 = 3'b010;
        t3 = 3'b100;
        t4 = 3'b100;
      end

      eg : begin
        next_state = sy;
        t1 = 3'b100;
        t2 = 3'b001;
        t3 = 3'b100;
        t4 = 3'b100;
      end

      sy : begin
        next_state = sg;
        t1 = 3'b100;
        t2 = 3'b100;
        t3 = 3'b010;
        t4 = 3'b100;
      end

      sg : begin
        next_state = wy;
        t1 = 3'b100;
        t2 = 3'b100;
        t3 = 3'b001;
        t4 = 3'b100;
      end

      wy : begin
        next_state = wg;
        t1 = 3'b100;
        t2 = 3'b100;
        t3 = 3'b100;
        t4 = 3'b010;
      end

      wg : begin 
        next_state = ny;
        t1 = 3'b100;
        t2 = 3'b100;
        t3 = 3'b100;
        t4 = 3'b001;
      end

      default: begin 
        next_state = ar;
        t1 = 3'b100;
        t2 = 3'b100;
        t3 = 3'b100;
        t4 = 3'b100;
      end

    endcase

  end

endmodule