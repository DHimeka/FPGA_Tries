module Clock_divider (
    input clock_in, // input clock on FPGA
    output logic clock_out // output clock after dividing the input clock by divisor
);

    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd500000; // Updated for 100Hz output

    always @(posedge clock_in) begin
        counter <= counter + 28'd1;
        if (counter >= (DIVISOR - 1))
            counter <= 28'd0;
        clock_out <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
    end

endmodule
