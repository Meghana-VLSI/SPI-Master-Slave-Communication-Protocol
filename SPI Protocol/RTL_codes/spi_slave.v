module spi_slave(
    input sclk,
    input ss,
    input rst,
    input mosi,

    output reg [7:0] rx_data
);

reg [7:0] shift_reg;
reg [3:0] count;

always @(posedge sclk or posedge rst)
begin
    if(rst)
    begin
        shift_reg <= 8'b0;
        rx_data   <= 8'b0;
        count     <= 0;
    end
    else if(!ss)
    begin
        shift_reg <= {shift_reg[6:0], mosi};
        count <= count + 1;

        if(count == 7)
        begin
            rx_data <= {shift_reg[6:0], mosi};
            count <= 0;
        end
    end
end

endmodule