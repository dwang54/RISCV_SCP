module control_unit (
    input logic [6:0] op,
    input logic [14:12] funct3,
    input logic funct7b5, Zero,
    output logic PCSrc, MemWrite, RegWrite, ALUSrc, 
    output logic jump, 
    output logic [1:0] ImmSrc, ResultSrc,
    output logic [2:0] ALUControl
);

    logic [2:0] ALUop;
    logic branch;


    Main_Decoder main_decoder (
        .op(op),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .jump(jump),
        .branch(branch),
        .ResultSrc(ResultSrc),
        .ImmSrc(ImmSrc),
        .ALUOp(ALUop)
    );

    ALU_Decoder alu_decoder (
        .ALUOp(ALUop),
        .funct3(funct3),
        .funct7b5(funct7b5),
        .opb5(op[5]),
        .ALUControl(ALUControl)
    );

    assign PCSrc = branch & Zero | jump;


endmodule