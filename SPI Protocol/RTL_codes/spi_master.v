`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 16:36:44
// Design Name: 
// Module Name: spi_master
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

 `timescale 1ns / 1ps

module spi_master(
    input clk,
    input rst,
    input start,
    input [7:0] tx_data,

    output reg mosi,
    output reg sclk,
    output reg ss,
    output reg done
);

reg [7:0] shift_reg;
reg [3:0] bit_count;

parameter IDLE     = 2'b00;
parameter LOAD     = 2'b01;
parameter TRANSFER = 2'b10;
parameter DONE     = 2'b11;

reg [1:0] state;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state     <= IDLE;
        ss        <= 1'b1;
        sclk      <= 1'b0;
        mosi      <= 1'b0;
        done      <= 1'b0;
        bit_count <= 4'd0;
        shift_reg <= 8'd0;
    end
    else
    begin
        case(state)

        // ---------------- IDLE ----------------
        IDLE:
        begin
            ss        <= 1'b1;
            sclk      <= 1'b0;
            done      <= 1'b0;
            bit_count <= 4'd0;

            if(start)
                state <= LOAD;
        end

        // ---------------- LOAD ----------------
        LOAD:
        begin
            shift_reg <= tx_data;
            bit_count <= 4'd0;
            ss        <= 1'b0;
            sclk      <= 1'b0;
            state     <= TRANSFER;
        end

        // -------------- TRANSFER --------------
        TRANSFER:
        begin
            sclk <= ~sclk;

            if(sclk == 1'b0)
            begin
                mosi <= shift_reg[7];
                shift_reg <= shift_reg << 1;

                if(bit_count == 4'd7)
                begin
                    state <= DONE;
                end
                else
                begin
                    bit_count <= bit_count + 1'b1;
                end
            end
        end

        // ---------------- DONE ----------------
        DONE:
        begin
            ss   <= 1'b1;
            sclk <= 1'b0;
            done <= 1'b1;
            state <= IDLE;
        end

        default:
            state <= IDLE;

        endcase
    end
end

endmodule
   