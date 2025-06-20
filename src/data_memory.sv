module data_memory (
    input logic clk, WriteEnable,
    input logic [31:0] ALUResult,
    input logic [31:0] WriteData,
    output logic [31:0] ReadData
);

    logic [31:0] memory [0:1023];
    logic [31:0] word_addr;
    assign word_addr = ALUResult[31:2];


    always_ff @(posedge clk) begin
        if (WriteEnable) begin
            memory[word_address] <= WriteData;
        end
    end
    
    always_comb begin
        ReadData = memory[word_address];
    end


endmodule