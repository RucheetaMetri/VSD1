module uart_tx(
    input clk,           // Clock input
    input rst,           // Reset input
    input start_tx,      // Start transmission signal
    input [7:0] data_tx, // Data to transmit
    output reg tx_done,  // Transmission done signal
    output reg tx_out    // Serial TX output
);

parameter BAUD_RATE = 9600; // Baud rate
parameter CLK_FREQ = 50000000; // Clock frequency

reg [3:0] bit_count; // Bit count for serial transmission
reg [15:0] baud_counter; // Baud counter for generating baud rate
reg [7:0] tx_reg; // Register for holding transmit data

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        tx_done <= 1'b0;
        baud_counter <= 16'd0;
        tx_out <= 1'b1; // Start with idle state (high)
        bit_count <= 4'd0;
    end else if (start_tx) begin
        tx_reg <= data_tx; // Load data to transmit
        baud_counter <= 16'd0;
        tx_out <= 1'b0; // Start bit
        bit_count <= 4'd0;
    end else if (baud_counter == (CLK_FREQ / BAUD_RATE)) begin
        baud_counter <= 16'd0;
        if (bit_count < 8) begin
            tx_out <= tx_reg[bit_count]; // Transmit each bit of data
            bit_count <= bit_count + 1;
        end else if (bit_count == 8) begin
            tx_out <= 1'b1; // Stop bit
            bit_count <= bit_count + 1;
        end else begin
            tx_done <= 1'b1; // Transmission complete
            tx_out <= 1'b1; // Set to idle state
        end
    end else begin
        baud_counter <= baud_counter + 1;
    end
end

endmodule