`default_nettype none

module top (
	input  clk,
    output LED,
    input a,
    input b,
	output [9:0] segs
);

  localparam count_width = 20;

  assign LED = count[count_width];
  reg [count_width:0] count = 0;
  wire [3:0] counter;

  wire a_db, b_db;

/*
  always @(posedge clk) begin
    count <= count + 1;

    // slowly increment led counter
    if(count == 0)
        counter <= counter + 1;

    // count to 15 instead - will roll over as counter register is 4 bits wide
    // reset if over 9
    //if(counter > 9)
    //    counter <= 0;

  end
  */
// pullup config from https://github.com/nesl/ice40_examples/blob/master/buttons_bounce/top.v
    SB_IO #(
        .PIN_TYPE(6'b0000_01),
        .PULLUP(1'b1)
    ) a1_config (
        .PACKAGE_PIN(keypad_c1),
        .D_IN_0(keypad_c1_din)
    );

  debounce #(.hist_len(8)) debounce_a(.clk(clk), .button(a), .debounced(a_db));
  debounce #(.hist_len(8)) debounce_b(.clk(clk), .button(b), .debounced(b_db));

  encoder encoder_inst(.clk(clk), .a(a_db), .b(b_db), .value(counter));

  seg10 seg10_inst(.count(counter), .segs(segs));

endmodule
