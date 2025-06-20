`timescale 1ns / 1ps

module ALU (
    input logic [31:0] SrcA,
    input logic [31:0] SrcB,
    input logic [3:0] ALUControl,
    output logic Zero,
    output logic [31:0] ALUResult
);
    logic [31:0] sum, difference;
    logic overflow_sum, overflow_diff

    assign sum = SrcA + SrcB;
    assign difference = SrcA - SrcB;

    assign overflow_sum = (SrcA[31] == SrcB[31]) & (sum[31] != SrcA[31]);
    assign overflow_diff = (SrcA[31] != SrcB[31]) & (difference[31] != SrcA[31]);


    always_comb begin
        case (ALUControl) 
            4'b0000: ALUResult = SrcA & SrcB;
            4'b0001: ALUResult = SrcA | SrcB;
            4'b0010: ALUResult = sum;
            4'b0100: ALUResult = SrcA ^ SrcB;
            4'b0110: ALUResult = difference;
            4'b0111: ALUResult = (SrcA < SrcB) ? 32'd1 : 32'd0;
            4'b1000: ALUResult = ($unsigned(SrcA) < $unsigned(SrcB)) ? 32'd1 : 32'd0; 
            4'b1010: ALUResult = SrcA << SrcB[4:0];
            4'b1011: ALUResult = SrcA >> SrcB[4:0];
            4'b1100: ALUResult = $signed(SrcA) >>> SrcB[4:0];
            default: ALUResult = 32'd0;
        endcase
    end

    assign Zero = (ALUResult == 32'd0);


endmodule