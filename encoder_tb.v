module test;

  reg a = 0, b = 0;
  reg clk = 0;
  integer i = 0;

  initial begin
     $dumpfile("test.vcd");
     $dumpvars(0,test);

     #10
    
     for (i=0; i<16; i=i+1) begin
     a <= 1;
     # 4;
     b <= 1;
     # 4;
     a <= 0;
     # 4;
     b <= 0;
     # 4;
     end

     for (i=0; i<16; i=i+1) begin
     b <= 1;
     # 4;
     a <= 1;
     # 4;
     b <= 0;
     # 4;
     a <= 0;
     # 4;
     end
     
     # 20
     $finish;
  end

  encoder encoder_inst(.clk(clk), .a(a), .b(b));
  always #1 clk = !clk;

endmodule // test
