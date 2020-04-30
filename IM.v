module IM(PC, Instruction);  // 8-bits PC, not 32 bits

    input   [7:0] PC;
    output  [31:0] Instruction;

    reg [31:0] InstrctionMem[253:0];

    assign Instruction = InstrctionMem[PC];

endmodule
