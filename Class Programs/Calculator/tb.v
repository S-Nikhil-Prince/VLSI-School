module tb_calculator ();

parameter INPUT_WIDTH = 2;

parameter OUTPUT_WIDTH =2;
 
                     reg   [INPUT_WIDTH-1:0] a;

                     reg   [INPUT_WIDTH-1:0] b;

                     reg   [2:0] sel; 

                     wire  [OUTPUT_WIDTH-1:0] y;
 
       calculator #(.INPUT_WIDTH(INPUT_WIDTH),

                    .OUTPUT_WIDTH(OUTPUT_WIDTH))

                   u_calculator(

                     .a(a),

                     .b(b),

                     .sel(sel), 

                     .y(y));
 
 
         /*inital begin

          repeat (10)

             a=$urandom;

             b=$urandom;

             sel=$urandom;

         end

         end*/
 
         initial begin
		 //$monitor("");

	   a={INPUT_WIDTH{1'b1}};

           b={INPUT_WIDTH{1'b1}};

           sel = 3'd0;

           #10;

	   a={INPUT_WIDTH{1'b1}};

           b={INPUT_WIDTH{1'b1}};

           sel = 3'd1;

           #10;

	   a={INPUT_WIDTH{1'b1}};

           b={INPUT_WIDTH{1'b1}};

           sel = 3'd2;

           #10;

	   a={INPUT_WIDTH{1'b1}};

           b={INPUT_WIDTH{1'b1}};

           sel = 3'd3;

           #10;

	   a={INPUT_WIDTH{1'b1}};

           b={INPUT_WIDTH{1'b1}};

           sel = 3'd4;

           #10;

	   a={INPUT_WIDTH{1'b1}};

           b={INPUT_WIDTH{1'b1}};

           sel = 3'd5;

           #10;

	   a={INPUT_WIDTH{1'b1}};

           b={INPUT_WIDTH{1'b1}};

           sel = 3'd6;

           #10;

	   a={INPUT_WIDTH{1'b1}};

           b={INPUT_WIDTH{1'b1}};

           sel = 3'd7;

           #10;

           end

 
 
endmodule
