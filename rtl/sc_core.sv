`timescale 1ns / 1ps

module SC_Core (
    input logic clk, rst,
    input logic [31:0] Instr,
    input logic [31:0] ReadData,
    output logic [31:0] PC,
    output logic MemWrite,
    output logic [31:0] ALUResult, WriteData
);

    logic ALUSrc, RegWrite, jump, Zero, PCSrc;
    logic [1:0] ResultSrc, ImmSrc;
    logic [3:0] ALUControl;

    Control_Unit control_unit (
        .op(Instr[6:0]),
        .funct3(Instr[14:12]),
        .funct7b5(Instr[30]),
        .Zero(Zero),
        .PCSrc(PCSrc),
        .MemWrite(MemWrite),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .jump(jump),
        .ImmSrc(ImmSrc),
        .ResultSrc(ResultSrc),
        .ALUControl(ALUControl)
    );

    Data_Path data_path (
        .clk(clk),
        .rst(rst),
        .ResultSrc(ResultSrc),
        .PCSrc(PCSrc),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUControl(ALUControl),
        .Instr(Instr),
        .ReadData(ReadData),
        .Zero(Zero),
        .PC(PC),
        .ALUResult(ALUResult),
        .WriteData(WriteData)
    );



endmodule