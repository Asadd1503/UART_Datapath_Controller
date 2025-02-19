 module transmitter(input logic clk,reset,load,tx_start,
                    input logic [7:0] data,
                    output logic y,clk_96000_hz
 );

logic [3:0] c_out = 4'h0;
logic e,d,mux_sig,on_sig,enable_f,s_shift,com_sig;
logic comp_sig = 1'b0;
//wires for column 1 muxes output
logic a1;
logic a2;
logic a3;
logic a4;
logic a5;
logic a6;
logic a7;
logic a8;
logic a9;
//wires for outputs of flip flops
logic f1_o;
logic f2_o;
logic f3_o;
logic f4_o;
logic f5_o;
logic f6_o;
logic f7_o;
logic f8_o;
logic f9_o;

// wires for output of column 2 output
logic b1;
logic b2;
logic b3;
logic b4;
logic b5;
logic b6;
logic b7;
logic b8;
logic b9;



//clock reduction instance
clk_red_by_counter lut(
    .clk(clk),
    .y(clk_96000_hz)
);

// controller instance
transmitter_con dut(
    .reset(reset),
    .load(load),
    .tx_start(tx_start),
    .comp_sig(comp_sig),
    .enable_f(enable_f),
    .s_shift(s_shift),
    .on_sig(on_sig),
    .mux_sig(mux_sig),
    .clk(clk_96000_hz)
);

//1st
always_ff @(posedge clk_96000_hz or posedge reset) begin
    if(reset)
        f1_o = 1'b0;
    else
        f1_o = b1;
end

always_comb begin
    if(enable_f)
        a1 = 1'b0;
    else
        a1 = f1_o;
end

always_comb begin
    if(s_shift)
        b1 = f2_o;
    else
        b1 = a1;
end
//2nd
always_ff @(posedge clk_96000_hz or posedge reset) begin
    if(reset)
        f2_o = 1'b0;
    else
        f2_o = b2;
end

always_comb begin
    if(enable_f)
        a2 = data[0];
    else
        a2 = f2_o;
end

always_comb begin
    if(s_shift)
        b2 = f3_o;
    else
        b2 = a2;
end
//3rd
always_ff @(posedge clk_96000_hz or posedge reset) begin
    if(reset)
        f3_o = 1'b0;
    else
        f3_o = b3;
end

always_comb begin
    if(enable_f)
        a3 = data[1];
    else
        a3 = f3_o;
end

always_comb begin
    if(s_shift)
        b3 = f4_o;
    else
        b3 = a3;
end
//4th
always_ff @(posedge clk_96000_hz or posedge reset) begin
    if(reset)
        f4_o = 1'b0;
    else
        f4_o = b4;
end

always_comb begin
    if(enable_f)
        a4 = data[2];
    else
        a4 = f4_o;
end

always_comb begin
    if(s_shift)
        b4 = f5_o;
    else
        b4 = a4;
end
//5th
always_ff @(posedge clk_96000_hz or posedge reset) begin
    if(reset)
        f5_o = 1'b0;
    else
        f5_o = b5;
end

always_comb begin
    if(enable_f)
        a5 = data[3];
    else
        a5 = f5_o;
end

always_comb begin
    if(s_shift)
        b5 = f6_o;
    else
        b5 = a5;
end
//6th
always_ff @(posedge clk_96000_hz or posedge reset) begin
    if(reset)
        f6_o = 1'b0;
    else
        f6_o = b6;
end

always_comb begin
    if(enable_f)
        a6 = data[4];
    else
        a6 = f6_o;
end

always_comb begin
    if(s_shift)
        b6 = f7_o;
    else
        b6 = a6;
end
//7th
always_ff @(posedge clk_96000_hz or posedge reset) begin
    if(reset)
        f7_o = 1'b0;
    else
        f7_o = b7;
end

always_comb begin
    if(enable_f)
        a7 = data[5];
    else
        a7 = f7_o;
end

always_comb begin
    if(s_shift)
        b7 = f8_o;
    else
        b7 = a7;
end
//8th
always_ff @(posedge clk_96000_hz or posedge reset) begin
    if(reset)
        f8_o = 1'b0;
    else
        f8_o = b8;
end

always_comb begin
    if(enable_f)
        a8 = data[6];
    else
        a8 = f8_o;
end

always_comb begin
    if(s_shift)
        b8 = f9_o;
    else
        b8 = a8;
end
//9th
always_ff @(posedge clk_96000_hz or posedge reset) begin
    if(reset)
        f9_o = 1'b0;
    else
        f9_o = b9;
end

always_comb begin
    if(enable_f)
        a9 = data[7];
    else
        a9 = f9_o;
end

always_comb begin
    if(s_shift)
        b9 = f1_o;
    else
        b9 = a9;
end

always_ff @(posedge clk_96000_hz ) begin
    if(on_sig)
        if(comp_sig)
            c_out = 4'h1;
        else
            c_out = c_out + 4'h1;
end

always_comb begin
    if(on_sig)
        case(c_out)
        4'h0: d = 1'b1;
        4'h1: d = 1'b1;
        4'h2: d = 1'b1;
        4'h3: d = 1'b1;
        4'h4: d = 1'b1;
        4'h5: d = 1'b1;
        4'h6: d = 1'b1;
        4'h7: d = 1'b1;
        4'h8: d = 1'b1;
        4'h9: d = 1'b1;
        4'ha: d = 1'b1;
        4'hb: d = 1'b1;
        default: d = 1'b1;
    endcase
end
always_comb begin
   if(c_out == 4'h9)
        comp_sig = 1'b1;
    else
        comp_sig = 1'b0;
end
always_comb begin
    if(mux_sig) 
        e = 1'b0;
    else
        e = d;
end
always_comb begin
    if(e)
        y = f1_o;
    else
        y = 1'b1;
end

        


 endmodule

