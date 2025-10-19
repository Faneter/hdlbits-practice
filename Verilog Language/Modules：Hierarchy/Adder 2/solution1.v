module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry1, carry2;
    add16 low_16(a[15:0], b[15:0], 1'b0, sum[15:0], carry1);
    add16 high_16(a[31:16], b[31:16], carry1, sum[31:16], carry2);
endmodule

module add1(input a, input b, input cin, output sum, output cout);
    wire sum_temp, carry1, carry2;
    half_add1 first(a, b, sum_temp, carry1);
    half_add1 last(sum_temp, cin, sum, carry2);
    assign cout = carry1 | carry2;
endmodule

module half_add1(input a, input b, output sum, output cout);
    assign sum = a ^ b;
    assign cout = a & b;
endmodule