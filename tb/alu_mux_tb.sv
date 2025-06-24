`timescale 1ns / 1ps

module Alu_Mux_tb;

logic [31:0] RD2;
logic [31:0] ImmExt;
logic ALUSrc;
logic [31:0] SrcB;

Alu_Mux dut (
    .RD2(RD2),
    .ImmExt(ImmExt),
    .ALUSrc(ALUSrc),
    .SrcB(SrcB)
);

initial begin
    $dumpfile("Alu_Mux.vcd");
    $dumpvars(0, Alu_Mux_tb);

    // case 1
    RD2 = 32'hAAAAAAAA;
    ImmExt = 32'h12345678;
    ALUSrc = 0;
    #10
    $display("ALUSrc=%b, SrcB=%h (Expected: %h)", ALUSrc, SrcB, RD2);

    // case 2
    ALUSrc = 1;
    #10;
    $display("ALUSrc=%b, SrcB=%h (Expected: %h)", ALUSrc, SrcB, ImmExt);


    // case 3
    RD2 = 32'hDEADBEEF;
    ImmExt = 32'hBEEFDEAD;
    ALUSrc = 0;
    #10;
    $display("ALUSrc=%b, SrcB=%h (Expected: %h)", ALUSrc, SrcB, RD2);

    $finish;

end

endmodule