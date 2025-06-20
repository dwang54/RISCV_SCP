`timescale 1ns / 1ps

module PC_plus_4 (
    input logic [31:0] PC,
    output logic [31:0] PCplus4
);

    assign PC_plus_4 = PC + 32'd4;

endmodule