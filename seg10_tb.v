module test;

  reg clk = 0;
  reg [3:0] counter = 0;
  wire sync = counter == 0;

  initial begin
     $dumpfile("test.vcd");
     $dumpvars(0,test);
     # 100;
     $finish;
  end

  always @(posedge clk)
      counter <= counter + 1;

  seg10 seg10_inst(.count(counter));
  /* Make a regular pulsing clock. */
  always #1 clk = !clk;

endmodule // test
