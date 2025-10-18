module top_module(
    input clk,
    input d,
    output q
);
    wire temp[0:1];
    my_dff instance1(clk, d, temp[0]);
    my_dff instance2(clk, temp[0], temp[1]);
    my_dff instance3(clk, temp[1], q);
endmodule
