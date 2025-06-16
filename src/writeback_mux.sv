module writeback_mux (
    input logic [31:0] ALUResult, ReadData
    input logic ResultSrc,
    output logic [31:0] Result
);

    // currently do not have support for J-type instructions
    assign Result = (ResultSrc) ? ReadData : ALUResult;


endmodule
