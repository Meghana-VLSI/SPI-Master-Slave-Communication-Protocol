`timescale 1ns/1ps

module spi_tb;

reg clk;
reg rst;
reg start;
reg [7:0] tx_data;

wire [7:0] rx_data;
wire done;

spi_top DUT(
    .clk(clk),
    .rst(rst),
    .start(start),
    .tx_data(tx_data),
    .rx_data(rx_data),
    .done(done)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    start = 0;
    tx_data = 0;

    #20 rst = 0;

    // Test 1
    tx_data = 8'hAA;
    start = 1;
    #10 start = 0;
    #250;

    // Test 2
    tx_data = 8'h55;
    start = 1;
    #10 start = 0;
    #250;

    // Test 3
    tx_data = 8'hF0;
    start = 1;
    #10 start = 0;
    #250;

    // Test 4
    tx_data = 8'h0F;
    start = 1;
    #10 start = 0;
    #250;

    // Test 5
    tx_data = 8'hFF;
    start = 1;
    #10 start = 0;
    #250;

    // Test 6
    tx_data = 8'h33;
    start = 1;
    #10 start = 0;
    #250;
end

endmodule