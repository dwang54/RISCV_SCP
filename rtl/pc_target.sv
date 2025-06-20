`timescale 1ns / 1ps

module PC_target (
    input logic [31:0] PC,
    input logic [31:0] ImmExt,
    output logic [31:0] PC_target
);

    assign PC_target = ImmExt + PC;


endmodule