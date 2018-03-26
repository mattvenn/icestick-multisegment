`default_nettype none

module top (
	input  clk,
    output LED,
    input a,
    input b,
	output [9:0] segs
);

    localparam slow_clk_width = 8;
    localparam counter_width = 5;

    wire slow_clk;
    reg [slow_clk_width-1:0] count = 0;
    wire [counter_width-1:0] counter;
    wire a_db, b_db;
    wire a_pullup, b_pullup;

    assign slow_clk = count[slow_clk_width-1];
    assign LED = slow_clk;

    always @(posedge clk) begin
        count <= count + 1;
    end

    // pullup config from https://github.com/nesl/ice40_examples/blob/master/buttons_bounce/top.v
    SB_IO #(
        .PIN_TYPE(6'b0000_01),
        .PULLUP(1'b1)
    ) a_config (
        .PACKAGE_PIN(a),
        .D_IN_0(a_pullup)
    );
    SB_IO #(
        .PIN_TYPE(6'b0000_01),
        .PULLUP(1'b1)
    ) b_config (
        .PACKAGE_PIN(b),
        .D_IN_0(b_pullup)
    );

  debounce #(.hist_len(4)) debounce_a(.clk(slow_clk), .button(a_pullup), .debounced(a_db));
  debounce #(.hist_len(4)) debounce_b(.clk(slow_clk), .button(b_pullup), .debounced(b_db));

  encoder #(.width(counter_width)) encoder_inst(.clk(clk), .a(a_db), .b(b_db), .value(counter));

  seg10 seg10_inst(.count(counter/2), .segs(segs));

endmodule
