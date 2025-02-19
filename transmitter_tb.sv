module transmitter_tb;
logic clk1;
logic reset1,load1,tx_start1;
logic [7:0] data1;
logic y1,clk_96000_hz1;


transmitter dut(
    .clk(clk1),
    .reset(reset1),
    .data(data1),
    .tx_start(tx_start1),
    .load(load1),
    .y(y1),
    .clk_96000_hz(clk_96000_hz1)
    
);






initial begin
    clk1 <= 1'b0;
    forever #5 clk1 = ~clk1;
end
initial begin

    @ (posedge clk_96000_hz1);
        reset1 = 1'b1;
        data1 = 8'h77;
        load1 = 1'b0;
        tx_start1 = 1'b0;

    
    @ (posedge clk_96000_hz1);
        reset1 = 1'b0;
        load1 = 1'b1;

    @ (posedge clk_96000_hz1);
        load1 = 1'b1;
        tx_start1 = 1'b0;
        
        
       
    @ (posedge clk_96000_hz1);
        
        
    @ (posedge clk_96000_hz1);
    
        load1 = 1'b0;
        tx_start1 = 1'b1;
    @ (posedge clk_96000_hz1);
        load1 = 1'b0;
        tx_start1 = 1'b0;


    @ (posedge clk_96000_hz1);
        
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);   
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
        data1  = 8'h7f;
    @ (posedge clk_96000_hz1);
        load1 = 1'b1;
    @ (posedge clk_96000_hz1);
        load1 = 1'b0;
        tx_start1 = 1'b1;
    @ (posedge clk_96000_hz1);
        tx_start1 = 1'b0;
    @ (posedge clk_96000_hz1);
        
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);   
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
            
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);   
    @ (posedge clk_96000_hz1);
    @ (posedge clk_96000_hz1);    
    

    



    

    repeat (3) @ (posedge clk_96000_hz1);
    $stop;
end
endmodule
        



