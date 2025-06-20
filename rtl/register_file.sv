`timescale 1ns / 1ps

module Register_File (
    input logic clk, WE3
    input logic [4:0] A1, A2, A3,
    input logic [31:0] WD3,
    output logic [31:0] RD1,
    output logic [31:0] RD2
);

    logic [31:0] registers [31:0];

    always_ff @(posedge clk) begin
        if (WE3 && A3 != 5'b0) begin
            registers[A3] <= WD3;
        end
    end

    always_comb begin
        if (A1 == 5'b00000)
            RD1 = 32'b0;  
        else
            RD1 = registers[A1];
            
        if (A2 == 5'b00000)
            RD2 = 32'b0;
        else
            RD2 = registers[A2];
    end


endmodule