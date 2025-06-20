module data_path (
    input logic clk, rst,
    input logic  [1:0] ResultSrc,
    input logic PCSrc, ALUSrc,
    input logic RegWrite,
    input logic [1:0] ImmSrc,
    input logic [3:0] ALUControl,
    input logic [31:0] Instr,
    input logic [31:0] ReadData,
    output logic Zero,
    output logic [31:0] PC,
    output logic [31:0] ALUResult, WriteData
);

    logic [31:0] PC_next, PCplus4, PC_target;
    logic [31:0] ImmExt;
    logic [31:0] SrcA, SrcB;
    logic [31:0] Result;

    PC pc (
        .clk(clk),
        .rst(rst),
        .PC_next(PC_next),
        .PC_out(PC)
    );

    PC_plus_4 pc_plus_4 (
        .PC(PC),
        .PCplus4(PCplus4)
    );

    PC_target pc_target (
        .PC(PC),
        .ImmExt(ImmExt),
        .PC_target(PC_target)
    );

    PC_mux pc_mux (
        .PCplus4(PCplus4),
        .PC_target(PC_target),
        .PCSrc(PCSrc),
        .PC_next(PC_next)
    );

    Register



endmodule