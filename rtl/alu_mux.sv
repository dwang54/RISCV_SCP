module Alu_Mux (
    input logic [31:0] RD2,
    input logic [31:0] ImmExt,
    input logic ALUSrc,
    output logic [31:0] SrcB
);

    assign SrcB = (ALUSrc) ? ImmExt : RD2;


endmodule