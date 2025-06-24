`timescale 1ns / 1ps

module PC_mux_tb;

logic [31:0] PCplus4, PC_target;
logic PCSrc;
logic [31:0] PC_next;

PC_mux dut (
    .PCplus4(PCplus4),
    .PC_target(PC_target),
    .PCSrc(PCSrc),
    .PC_next(PC_next)
);

initial begin
    $dumpfile("PC_mux.vcd");
    $dumpvars(0, PC_mux_tb);
    
    PCSrc = 0;
    PCplus4 = 32'hDEADBEEF;
    PC_target = 32'hBAAFDAAF;
    #10
    $display("PCSrc=%b, PC_next=%h (Expected: %h)", PCSrc, PC_next, PCplus4);
    

    PCSrc = 1;
    #10
    $display("PCSrc = %b, PC_next = %h (Expected: %h)", PCSrc, PC_next, PC_target);
    

    $finish;
end

endmodule

