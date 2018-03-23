`default_nettype none
module seg10 (
    input wire [3:0] count,
    output reg [9:0] segs
);
	always @* begin

        case(count)
            0: segs = 10'b1111111100;
            1: segs = 10'b0011000000;
            2: segs = 10'b1110111011;
            3: segs = 10'b1111110011;
            4: segs = 10'b0011000111;
            5: segs = 10'b1101110111;
            6: segs = 10'b0001111111;
            7: segs = 10'b1111000000;
            8: segs = 10'b1111111111;
            9: segs = 10'b1111000111;
            default:    
               segs = 10'b0000000000;
        endcase

    end

endmodule
