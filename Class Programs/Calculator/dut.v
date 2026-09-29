

module calculator #(parameter INPUT_WIDTH = 2,

                    parameter OUTPUT_WIDTH =2)

                   (

                     input   [INPUT_WIDTH-1:0] a,

                     input   [INPUT_WIDTH-1:0] b,

                     input   [2:0] sel, 

                     output  [OUTPUT_WIDTH-1:0] y);
 
 
            wire [OUTPUT_WIDTH-1:0] and_out;

            wire [OUTPUT_WIDTH-1:0] or_out;

            wire [OUTPUT_WIDTH-1:0] xor_out;

            wire [OUTPUT_WIDTH-1:0] xnor_out;

            wire [OUTPUT_WIDTH-1:0] not_out;
 
            assign and_out  = a & b;

            assign or_out   = a | b;

            assign xor_out  = a ^ b;

            assign xnor_out = a ~^b;

            assign not_out  = ~ b;
 
            assign y = ( sel == 3'd0 ) ? and_out :

                       ( sel == 3'd1 ) ? or_out  :

                       ( sel == 3'd2 ) ? xor_out :

                       ( sel == 3'd3 ) ? xnor_out:

                       ( sel == 3'd4 ) ? not_out : {OUTPUT_WIDTH{1'b0}};
 
 
endmodule 
 
 