module PC (
    input logic clk, rst,
    input logic [31:0] PC_next,
    output logic [31:0] PC_out
);

    logic [31:0] PC_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            PC_reg <= 0;
        else 
            PC_reg <= PC_next;
    end

    assign PC_out = PC_reg;


endmodule
