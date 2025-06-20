module PC_mux (
    input logic [31:0] PC_plus_4, PC_target, 
    input logic PCSrc,
    output logic [32:0] PC_next
);

    assign PC_next = (PCSrc) ? PC_target : PC_plus_4;

endmodule