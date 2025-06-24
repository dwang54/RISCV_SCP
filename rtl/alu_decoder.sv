`timescale 1ns / 1ps

module Alu_Decoder (
    input logic [1:0] ALUOp,
    input logic [2:0] funct3,
    input logic funct7b5,
    input logic opb5,
    output logic [3:0] ALUControl
);


    always_comb begin
        case (ALUOp)
            2'b00:
                ALUControl = 4'b0010;                   // addition
            2'b01:
                ALUControl = 4'b0110;                   // subtraction
            2'b10:
                case (funct3)
                    3'b000:
                        if (funct7b5 & opb5)            // R-type 
                            ALUControl = 4'b0110;
                        else 
                            ALUControl = 4'b0010;
                    3'b001:
                        ALUControl = 4'b1010;           // sll, slli
                    3'b010:
                        ALUControl = 4'b0111;           // slt
                    3'b011:
                        ALUControl = 4'b1000;           // sltu
                    3'b100:
                        ALUControl = 4'b0100;           // xor
                    3'b101:
                        if (funct7b5)
                            ALUControl = 4'b1100;       // sra
                        else 
                            ALUControl = 4'b1011;       // srl
                    3'b110:
                        ALUControl = 4'b0001;           // or
                    3'b111:
                        ALUControl = 4'b0000;           // and
                    default:
                        ALUControl = 4'b1111;
                endcase
            default:
                ALUControl = 4'b1111;
        endcase
    end


endmodule