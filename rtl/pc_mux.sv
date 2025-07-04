`timescale 1ns / 1ps

module PC_mux (
    input logic [31:0] PCplus4, PC_target, 
    input logic PCSrc,
    output logic [31:0] PC_next
);

    assign PC_next = (PCSrc) ? PC_target : PCplus4;

endmodule