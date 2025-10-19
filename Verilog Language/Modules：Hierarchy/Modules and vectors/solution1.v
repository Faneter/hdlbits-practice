module top_module( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q
);
    wire [7:0] a, b, c;
    my_dff8 md1(clk, d, a);
    my_dff8 md2(clk, a, b);
    my_dff8 md3(clk, b, c);
    mux8_4to1 mux(d, a, b, c, sel, q);
endmodule

module mux8_4to1(
    input [7:0] a, b, c, d,
    input [1:0] sel,
    output [7:0] out
);
    assign out = (a & {8{~sel[1] & ~sel[0]}}) |
                 (b & {8{~sel[1] &  sel[0]}}) |
                 (c & {8{ sel[1] & ~sel[0]}}) |
                 (d & {8{ sel[1] &  sel[0]}});
endmodule