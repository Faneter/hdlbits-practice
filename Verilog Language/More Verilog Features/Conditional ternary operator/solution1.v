module top_module(
    input [7:0] a, b, c, d,
    output [7:0] min
);
    wire [7:0] min1, min2;
    compare comp1(a, b, min1);
    compare comp2(c, d, min2);
    compare comp3(min1, min2, min);
endmodule

module compare (
    input [7:0] a, b,
    output [7:0] min
);
    assign min = (a < b) ? a : b;
endmodule
