`timescale 1ns / 1ps

module Writeback_Mux (
    input logic [31:0] ALUResult, ReadData, PCplus4
    input logic [1:0] ResultSrc,
    output logic [31:0] Result
);

    assign Result = (ResultSrc == 2'b10) ? PCplus4 : (ResultSrc == 2'b01) ? ReadData : ALUResult;

endmodule
