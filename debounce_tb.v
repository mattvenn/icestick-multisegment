module test;

  reg clk = 0;
  reg button = 0;

  initial begin
     $dumpfile("test.vcd");
     $dumpvars(0,test);
     #10
     button <= 1;
     # 2
     button <= 0;
     # 2
     button <= 1;
     # 2
     button <= 0;
     # 20
     button <= 1;
     # 20
     $finish;
  end

  debounce #(.hist_len(8)) debounce_inst(.clk(clk), .button(button));
  /* Make a regular pulsing clock. */
  always #1 clk = !clk;

endmodule // test
