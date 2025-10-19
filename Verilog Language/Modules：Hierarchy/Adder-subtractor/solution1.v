module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] xor_b;
    wire carry1, carry2;
    assign xor_b = b ^ {32{sub}};
    add16 low_16(a[15:0], xor_b[15:0], sub, sum[15:0], carry1);
    add16 high_16(a[31:16], xor_b[31:16], carry1, sum[31:16], carry2);
endmodule
