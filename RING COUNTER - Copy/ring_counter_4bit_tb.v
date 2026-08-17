// Testbench for 4-bit Ring Counter

`timescale 1ns/1ps

module ring_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] q;

    // Instantiate the Ring Counter
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;

        // Hold reset for 10 ns
        #10;
        reset = 0;

        // Run for 80 ns
        #80;

        $finish;
    end

    // Display output whenever it changes
    initial begin
        $monitor("Time = %0t | Reset = %b | Q = %b",
                 $time, reset, q);
    end

endmodule

