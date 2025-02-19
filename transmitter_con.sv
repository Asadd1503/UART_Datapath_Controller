module transmitter_con(
    input logic clk, load, tx_start, comp_sig, reset,
    output logic enable_f, s_shift, on_sig, mux_sig
);

    logic [1:0] c_state, n_state;
    parameter S0=2'b00, S1=2'b01, S2=2'b10;

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            c_state <= S0;
        else
            c_state <= n_state;
    end

    always_comb begin
        case (c_state)
            S0: begin
                if (!load && !tx_start)
                    n_state = S0;
                else if (load && !tx_start)
                    n_state = S1;
                else if (tx_start)
                    n_state = S2;
            end
            S1: begin
                if (!load && !tx_start)
                    n_state = S0;
                else if (tx_start)
                    n_state = S2;
                else if (load && !tx_start)
                    n_state = S1;
            end
            S2: begin
                if (!comp_sig)
                    n_state = S2;
                else if (comp_sig)
                    n_state = S0;
            end
        endcase
    end

    always_comb begin
        case (c_state)
            S0: begin
                if (!load && !tx_start) begin
                    enable_f = 1'b0;
                    s_shift = 1'b0;
                    on_sig = 1'b0;
                    mux_sig = 1'b1;
                end
                else if (load && !tx_start) begin
                    enable_f = 1'b1;
                    s_shift = 1'b0;
                    on_sig = 1'b0;
                    mux_sig = 1'b1;
                end
                else if (tx_start) begin
                    enable_f = 1'b0;
                    s_shift = 1'b1;
                    on_sig = 1'b1;
                    mux_sig = 1'b0;
                end
            end
            S1: begin
                if (!load && !tx_start) begin
                    enable_f = 1'b0;
                    s_shift = 1'b0;
                    on_sig = 1'b0;
                    mux_sig = 1'b1;
                end
                else if (tx_start) begin
                    enable_f = 1'b0;
                    s_shift = 1'b1;
                    on_sig = 1'b1;
                    mux_sig = 1'b0;
                end
                else if (load && !tx_start) begin
                    enable_f = 1'b1;
                    s_shift = 1'b0;
                    on_sig = 1'b0;
                    mux_sig = 1'b1;
                end
            end
            S2: begin
                if (!comp_sig) begin
                    enable_f = 1'b0;
                    s_shift = 1'b1;
                    on_sig = 1'b1;
                    mux_sig = 1'b0;
                end
                else if (comp_sig) begin
                    enable_f = 1'b0;
                    s_shift = 1'b0;
                    on_sig = 1'b0;
                    mux_sig = 1'b1;
                end
            end
        endcase
    end
endmodule
