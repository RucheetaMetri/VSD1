`timescale 1ns / 1ps

module uart_tx_tb;

// Parameters
parameter BAUD_RATE = 9600;
parameter CLK_FREQ = 50000000;

// Signals
reg clk = 1'b0;
reg rst = 1'b0;
reg start_tx = 1'b0;
reg [7:0] data_tx;
wire tx_done;
wire tx_out;

// Instantiate UART TX module
uart_tx uart_tx_inst(
    .clk(clk),
    .rst(rst),
    .start_tx(start_tx),
    .data_tx(data_tx),
    .tx_done(tx_done),
    .tx_out(tx_out)
);

// Clock generation
always #10 clk = ~clk;

// Test stimulus
initial begin
    // Reset
    rst = 1'b1;
    #20;
    rst = 1'b0;
    #20;
    
    // Test transmission
    data_tx = 8'h55; // Data to transmit
    start_tx = 1'b1; // Start transmission
    #100;
    start_tx = 1'b0;
    #100;

    // Additional test cases can be added here
    // ...

    // End simulation
    $stop;
end

// Dump VCD file
initial begin
    $dumpfile("uart_tx_tb.vcd");
    $dumpvars(0, uart_tx_tb);
end

endmodule