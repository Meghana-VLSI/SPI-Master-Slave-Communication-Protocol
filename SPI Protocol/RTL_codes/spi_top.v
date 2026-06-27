module spi_top(
    input clk,
    input rst,
    input start,
    input [7:0] tx_data,

    output [7:0] rx_data,
    output done
);

wire mosi;
wire sclk;
wire ss;

spi_master MASTER(
    .clk(clk),
    .rst(rst),
    .start(start),
    .tx_data(tx_data),
    .mosi(mosi),
    .sclk(sclk),
    .ss(ss),
    .done(done)
);

spi_slave SLAVE(
    .sclk(sclk),
    .ss(ss),
    .rst(rst),
    .mosi(mosi),
    .rx_data(rx_data)
);

endmodule