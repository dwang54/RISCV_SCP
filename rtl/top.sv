`timescale 1ns / 1ps

module top (
    input logic clk, rst,
    input logic [31:0] WriteData, DataAddr,
    output logic MemWrite
);

    logic [31:0] PC, Instr, ReadData;

    Instruction_Memory instruction_memory (
        .A(PC),
        .RD(Instr)
    );

    Data_Memory data_memory (
        .clk(clk),
        .WriteEnable(MemWrite),
        .ALUResult(DataAddr),
        .WriteData(WriteData),
        .ReadData(ReadData)
    );

    SS_Core ss_core (
        .clk(clk),
        .rst(rst),
        .Instr(Instr),
        .ReadData(ReadData),
        .PC(PC),
        .MemWrite(MemWrite),
        .ALUResult(DataAddr),
        .WriteData(WriteData)
    );



endmodule