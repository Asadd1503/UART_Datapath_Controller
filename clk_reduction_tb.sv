module clk_reduction_tb;
logic clk1;
logic reset1;
logic clk_12200Hz1;

clk_reduction dut(
    .clk(clk1),
    .reset(reset1),
    .clk_12200Hz(clk_12200Hz1)
);

initial begin
    clk1 <= 1'b0;
    forever #5 clk1 = ~clk1;
end
initial begin

    @ (posedge clk1);
        reset1 = 1'b0;


    @ (posedge clk1);
        

    @ (posedge clk1);

    @ (posedge clk1);

    @ (posedge clk1);

    @ (posedge clk1);
        
    @ (posedge clk1);

    @ (posedge clk1);
    @ (posedge clk1);
    @ (posedge clk1);
    @ (posedge clk1);
    @ (posedge clk1);
    @ (posedge clk1);
    @ (posedge clk1);
    @ (posedge clk1);
    @ (posedge clk1);
    @ (posedge clk1);
    @ (posedge clk1);

    

    repeat (3) @ (posedge clk1);
    $stop;
end
endmodule
        



