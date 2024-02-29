module tb_uart;

reg clk, reset, start;
reg [7:0] data;
wire tx_busy, tx_done, tx;

uart uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .data(data),
    .tx_busy(tx_busy),
    .tx_done(tx_done),
    .tx(tx)
);

initial begin
    clk = 0;
    reset = 1;
    start = 0;
    data = 8'h00;
    
    #10 reset = 0;
    
    #10 start = 1;
    data = 8'hFF;
    #100 start = 0;
    
    #100 $finish;
end

always #5 clk = ~clk;
initial begin
  $dumpfile("dumpfile.vcd");
  $dumpvars;
end
endmodule