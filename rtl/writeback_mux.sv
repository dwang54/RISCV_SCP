module Writeback_Mux (
    input logic [31:0] ALUResult, ReadData, PC_plus_4
    input logic [1:0] ResultSrc,
    output logic [31:0] Result
);

    assign Result = (ResultSrc == 2'b10) ? PC_plus_4 : (ResultSrc == 2'b01) ? ReadData : ALUResult;


endmodule
