module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);
    wire [99:0] couts;
    genvar i;
    generate
        bcd_fadd digit1(a[3:0], b[3:0], cin, couts[0], sum[3:0]);
        for (i = 1; i < 100; i++) begin: GENERATE_FOR_LOOP
            bcd_fadd digiti(a[(i * 4 + 3):(i * 4)],
                            b[(i * 4 + 3):(i * 4)],
                            couts[i - 1],
                            couts[i],
                            sum[(i * 4 + 3):(i * 4)]);
        end
        assign cout = couts[99];
    endgenerate
endmodule
