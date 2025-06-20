module Immediate_Extender (
    input logic [31:7] Instr,
    input logic [1:0] ImmSrc,
    output logic [31:0] ImmExt 
);

    // covering simplified set of RISCV - instructions, U type instructions not covered (ImmSrc is usually 3 bits wide)
    always_comb begin
        case(ImmSrc):
            // I-type
            2'b00: ImmExt = {{20{Instr[31]}}, Instr[31:20]};
            // S-type
            2'b01: ImmExt = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
            // B-type
            2'b10: ImmExt = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0};
            // J-type
            2'b11: ImmExt = {{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0};
            default: ImmExt = 32'hDEADBEEF;
        endcase
    end

endmodule