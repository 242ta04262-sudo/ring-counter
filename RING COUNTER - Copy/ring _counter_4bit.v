// Ring Counter
// 4-bit Ring Counter using Verilog

module ring_counter (
    input  wire       clk,
    input  wire       reset,
    output reg  [3:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0001;          // Initial state
        else
            q <= {q[2:0], q[3]};   // Rotate left
    end

endmodule

