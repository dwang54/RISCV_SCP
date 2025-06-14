module PC_mux (
    input logic [31:0] PC_plus_4, PC_target, 
    input logic PC_src,
    output logic [32:0] PC_next
);

    assign PC_next = (PC_src) ? PC_target : PC_plus_4;

endmodule