module clk_reduction(input logic clk,reset,
                    output logic clk_12200Hz
);

logic f1 = 1'b0;
logic f2 = 1'b0;
logic f3 = 1'b0;
logic f4 = 1'b0;
logic f5 = 1'b0;
logic f6 = 1'b0;
logic f7 = 1'b0;
logic f8 = 1'b0;
logic f9 = 1'b0;
logic f10 = 1'b0;
logic f11 = 1'b0;
logic f12 = 1'b0;
logic f13 = 1'b0;

always_ff @(posedge clk or posedge reset) begin
    if(reset)
        f1 <= clk;
    else
        f1 <= ~f1;
end

always_ff @(posedge f1 or posedge reset) begin
    if(reset)
        f3 <= clk;
    else
        f2 <= ~f2;
end

always_ff @(posedge f2 or posedge reset) begin
    if(reset)
        f3 <= clk;
    else
        f3 <= ~f3;
end

always_ff @(posedge f3 or posedge reset) begin
    if(reset)
        f4 <= clk;
    else
        f4 <= ~f4;
end

always_ff @(posedge f4 or posedge reset) begin
    if(reset)
        f5 <= clk;
    else
        f5 <= ~f5;
end

always_ff @(posedge f5 or posedge reset) begin
    if(reset)
        f6 <= clk;
    else
        f6 <= ~f6;
end

always_ff @(posedge f6 or posedge reset) begin
    if(reset)
        f7 <= clk;
    else
        f7 <= ~f7;
end

always_ff @(posedge f7 or posedge reset) begin
    if(reset)
        f8 <= clk;
    else
        f8 <= ~f8;
end

always_ff @(posedge f8 or posedge reset) begin
    if(reset)
        f9 <= clk;
    else
        f9 <= ~f9;
end

always_ff @(posedge f9 or posedge reset) begin
    if(reset)
        f10 <= clk;
    else
        f10 <= ~f10;
end

always_ff @(posedge f10 or posedge reset) begin
    if(reset)
        f11 <= clk;
    else
        f11 <= ~f11;
end

always_ff @(posedge f11 or posedge reset) begin
    if(reset)
        f12 <= clk;
    else
        f12 <= ~f12;
end

always_ff @(posedge f12 or posedge reset) begin
    if(reset)
        f12 <= clk;
    else
        f13 <= ~f13;
end

assign clk_12200Hz = f13;
endmodule
