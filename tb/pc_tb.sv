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


initial begin
    clk = 0;
    forever begin
        #(clk_period / 2) clk = ~clk;
    end
end

initial begin
    $dumpfile("PC_tb.vcd");
    $dumpvars(0, PC_tb);

    rst = 0;
    #5;
    rst = 1;
    #clk_period;   
    rst = 0;

    PC_next = 32'hAAAA_BBBB;
    #clk_period;
    $display("Time=%0t | PC_out = %h (Expected: AAAA_BBBB)", $time, PC_out);

    PC_next = 32'h1234_5678;
    #clk_period;
    $display("Time=%0t | PC_out = %h (Expected: 1234_5678)", $time, PC_out);

    PC_next = 32'hCAFEBABE;
    #clk_period;
    $display("Time=%0t | PC_out = %h (Expected: CAFEBABE)", $time, PC_out);


    $finish;
end




endmodule