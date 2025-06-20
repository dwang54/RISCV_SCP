`timescale 1ns / 1ps

module Main_Decoder (
    input logic [6:0] op,
    output logic MemWrite, ALUSrc, RegWrite, jump, branch,
    output logic [1:0] ResultSrc, ImmSrc, ALUOp
);

    always_comb begin
        case (op)
            // R-type instructions (add, sub, and, or, slt, etc.)
            7'b0110011: begin
                RegWrite = 1'b1;
                ImmSrc = 2'bxx;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b00;
                branch = 1'b0;
                jump = 1'b0;
                ALUOp = 2'b10;        // R-type ALU operations
            end
            
            // I-type ALU instructions (addi, andi, ori, slti, etc.)
            7'b0010011: begin
                RegWrite = 1'b1;
                ImmSrc = 2'b00;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ResultSrc = 2'b00;
                branch = 1'b0;
                jump = 1'b0;
                ALUOp = 2'b10;
            end
            
            // Load instructions (lw)
            7'b0000011: begin
                RegWrite = 1'b1;
                ImmSrc = 2'b00;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ResultSrc = 2'b01;
                branch = 1'b0;
                jump = 1'b0;
                ALUOp = 2'b00;
            end
            
            // Store instructions (sw)
            7'b0100011: begin
                RegWrite = 1'b0;
                ImmSrc = 2'b01;
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                ResultSrc = 2'bxx;
                branch = 1'b0;
                jump = 1'b0;
                ALUOp = 2'b00;
            end
            
            // Branch instructions (beq, bne)
            7'b1100011: begin
                RegWrite = 1'b0;
                ImmSrc = 2'b10;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'bxx;
                branch = 1'b1;
                jump = 1'b0;
                ALUOp = 2'b01;
            end
            
            // Jump and link (jal)
            7'b1101111: begin
                RegWrite = 1'b1;
                ImmSrc = 2'b11;
                ALUSrc = 1'bx;
                MemWrite = 1'b0;
                ResultSrc = 2'b10;
                branch = 1'b0;
                jump = 1'b1;
                ALUOp = 2'bxx;
            end
            
            default: begin
                RegWrite = 1'b0;
                ImmSrc = 2'b00;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b00;
                branch = 1'b0;
                jump = 1'b0;
                ALUOp = 2'b00;
            end
        endcase
    end

endmodule