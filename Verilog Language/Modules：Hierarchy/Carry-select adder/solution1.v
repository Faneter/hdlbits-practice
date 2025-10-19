module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c;
    add16 low_16(a[15:0], b[15:0], 0, sum[15:0], c);
    wire [15:0] high_16_without_carry;
    wire [15:0] high_16_with_carry;
    wire t1, t2;
    add16 high_16_0(a[31:16], b[31:16], 0, high_16_without_carry, t1);
    add16 high_16_1(a[31:16], b[31:16], 1, high_16_with_carry, t2);
    assign sum[31:16] = (high_16_without_carry & {16{~c}}) | (high_16_with_carry & {16{c}});
endmodule
