`default_nettype none

module top (
	input  clk,
    output LED,
	output [9:0] segs
);

  localparam count_width = 20;

  assign LED = count[count_width];
  reg [count_width:0] count = 0;
  reg [3:0] counter = 0;

  always @(posedge clk) begin
    count <= count + 1;

    // slowly increment led counter
    if(count == 0)
        counter <= counter + 1;

    // reset if over 9
    if(counter > 9)
        counter <= 0;

  end

  seg10 seg10_inst(.count(counter), .segs(segs));

endmodule
