`timescale 1ns / 1ps

module Alu_Decoder_tb;

logic [1:0] ALUOp;
logic [2:0] funct3;
logic funct7b5;
logic opb5;
logic [3:0] ALUControl;

Alu_Decoder dut (
    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7b5(funct7b5),
    .opb5(opb5),
    .ALUControl(ALUControl)
);


initial begin
    $dumpfile("Alu_Decoder.vcd");
    $dumpvars(0, Alu_Decoder_tb);


    // addition
    ALUOp = 2'b00;
    funct3 = 3'b0;
    funct7b5 = 0;
    opb5 = 0;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b0010);

    //subtraction
    ALUOp = 2'b01;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b0110);

    //r type addition
    ALUOp = 2'b10;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b0010);

    //r type subtraction
    funct7b5 = 1;
    opb5 = 1;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b0110);

    // sll, slli
    funct3 = 3'b001;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b1010);

    // slt
    funct3 = 3'b010;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b0111);

    // sltu
    funct3 = 3'b011;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b1000);

    // xor
    funct3 = 3'b100;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b0100);

    // sra
    funct3 = 3'b101;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b1100);

    // srl
    funct7b5 = 0;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b1011);

    // or
    funct3 = 3'b110;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b0001);

    // and
    funct3 = 3'b111;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b0000);

    // default 
    ALUOp = 2'b11;
    #10
    $display("ALUOp=%b, ALUControl=%b (Expected: %b)", ALUOp, ALUControl, 4'b1111);
    $finish;
end

    
endmodule