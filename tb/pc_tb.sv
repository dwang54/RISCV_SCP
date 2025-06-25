`timescale 1ns / 1ps

module PC_tb;

logic clk, rst;
logic [31:0] PC_next, PC_out;

PC dut (
    .clk(clk),
    .rst(rst),
    .PC_next(PC_next),
    .PC_out(PC_out)
);

parameter clk_period = 10;


always #5 clk = ~clk;
initial begin
    clk = 0;
    forever begin
        #(clk_period / 2) clk = ~clk;
    end
end

initial begin
    $dumpfile("PC_tb.vcd");
    $dumpvars(0, PC_tb);
    









    $finish;
end




endmodule