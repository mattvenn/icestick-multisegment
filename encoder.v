module encoder (
    input a,
    input b,
    input clk,
    output reg [3:0] value
);
    initial begin
        value <= 0;
    end

    reg oa = 0;
    reg ob = 0;


    always@(a,b) begin
        case ({a,oa,b,ob})
            4'b1000: value <= value + 1;
            4'b0111: value <= value + 1;
            4'b0010: value <= value - 1;
            4'b1101: value <= value - 1;
        endcase 
    end

    always@(posedge clk) begin
        oa <= a;
        ob <= b;
    end
endmodule
