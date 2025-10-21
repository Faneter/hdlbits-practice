// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos
);
    always @(*) begin
        if (in & 4'b0001) begin
            pos = 2'd0;
        end
        else if (in & 4'b0010) begin
            pos = 2'd1;
        end
        else if (in & 4'b0100) begin
            pos = 2'd2;
        end
        else if (in & 4'b1000) begin
            pos = 2'd3;
        end
        else begin
            pos = 2'd0;
        end
    end
endmodule
