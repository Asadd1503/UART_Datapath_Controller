module clk_red_by_counter(input logic clk,
                          output logic y = 1'b0
);
logic [15:0] c = 16'h28b0;   // c=8'h10 for simulation


always_ff @(posedge clk) begin
    if(y)
        c = 16'h0;
    else
        c = c + 16'h1;
end
always_comb begin
    if(c == 16'h28b0)
        y = 1'b1;
    else
        y = 1'b0;
end
endmodule