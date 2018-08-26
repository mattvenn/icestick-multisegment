module debounce (
    input clk,
    input button,
    output reg debounced
);
    initial debounced = 0;
    parameter hist_len = 8;
    localparam on_value = 2 ** hist_len - 1;
    reg [hist_len-1:0] button_hist = 0;

    always@(posedge clk) begin
        button_hist = {button_hist[hist_len-2:0], button };
        if(button_hist == on_value) 
           debounced <= 1;
        else if(button_hist == 0)
           debounced <= 0;
    end

    `ifdef FORMAL
        always @(*)
            assert(debounced == 0);
        always @(posedge clk)
            assume($past(button == 0,hist_len));
    `endif

endmodule
