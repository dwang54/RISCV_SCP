module PC_plus_4 (
    input logic [31:0] PC,
    output logic [31:0] PC_plus_4
);

    assign PC_plus_4 = PC + 32'd4;

endmodule