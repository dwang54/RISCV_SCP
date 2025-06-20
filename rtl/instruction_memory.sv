`timescale 1ns / 1ps

module Instruction_Memory (
    input logic [31:0] A,
    output logic [31:0] RD
);

    logic [31:0] memory [0:255];

    initial begin
        $readmemh("instructions.mem", memory); 
    end


    assign RD = memory[A[31:2]];

endmodule