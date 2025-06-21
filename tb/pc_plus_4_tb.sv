`timescale 1ns / 1ps

module PC_plus_4_tb;

logic [31:0] PC;
logic [31:0] PCplus4;

PC_plus_4 dut (
    .PC(PC), 
    .PCplus4(PCplus4)
);

 initial begin
      $dumpfile("PC_plus_4.vcd");
      $dumpvars(0, PC_plus_4_tb);

      PC = 32'h00000000;
      #10;
      $display("PC = %h, PCplus4 = %h", PC, PCplus4);

      PC = 32'h00000004;
      #10;
      $display("PC = %h, PCplus4 = %h", PC, PCplus4);

      PC = 32'hFFFFFFFC;
      #10;
      $display("PC = %h, PCplus4 = %h", PC, PCplus4);

      $finish;
end

endmodule