module uart(
    input clk,
    input reset,
    input start,
    input [7:0] data,
    output reg tx_busy,
    output reg tx_done,
    output reg tx
);

reg [3:0] tx_state;
reg [3:0] bit_count;
reg [12:0] baud_count;
reg [7:0] tx_data_reg;

localparam IDLE = 4'b0000;
localparam START_BIT = 4'b0001;
localparam DATA_BITS = 4'b0010;
localparam STOP_BIT = 4'b0011;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        tx_busy <= 1'b0;
        tx_done <= 1'b0;
        tx_state <= IDLE;
        bit_count <= 4'd0;
        baud_count <= 13'd0;
    end
    else begin
        case(tx_state)
            IDLE: begin
                tx <= 1'b1;
                if (start) begin
                    tx_busy <= 1'b1;
                    tx_done <= 1'b0;
                    tx_state <= START_BIT;
                    tx_data_reg <= data;
                    bit_count <= 4'd0;
                    baud_count <= 13'd0;
                end
            end
            
            START_BIT: begin
                tx <= 1'b0;
                if (baud_count == 13'd0) begin
                    tx_state <= DATA_BITS;
                end
            end
            
            DATA_BITS: begin
                tx <= tx_data_reg[bit_count];
                if (baud_count == 13'd0) begin
                    bit_count <= bit_count + 1;
                    if (bit_count == 8'd7) begin
                        tx_state <= STOP_BIT;
                    end
                    baud_count <= 13'd0;
                end
            end
            
            STOP_BIT: begin
                tx <= 1'b1;
                if (baud_count == 13'd0) begin
                    tx_busy <= 1'b0;
                    tx_done <= 1'b1;
                    tx_state <= IDLE;
                    bit_count <= 4'd0;
                end
            end
        endcase
        if (baud_count < 13'd16) begin
            baud_count <= baud_count + 1;
        end
    end
end

endmodule