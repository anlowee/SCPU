// NPC control signal
`define NPC_PLUS4       2'b00
`define NPC_BRANCH      2'b01
`define NPC_JUMP        2'b10
`define NPC_JUMPR       2'b11


// ALU control signal
`define ALU_NOP     4'b0000 
`define ALU_ADD     4'b0001
`define ALU_SUB     4'b0010 
`define ALU_AND     4'b0011
`define ALU_OR      4'b0100
`define ALU_SLT     4'b0101
`define ALU_SLTU    4'b0110
`define ALU_ADDU    4'b0111
`define ALU_SUBU    4'b1000
`define ALU_NOR     4'b1001 
`define ALU_SLL     4'b1010 
`define ALU_SLA     4'b1011 
`define ALU_SRA     4'b1100 
`define ALU_SRL     4'b1101 
`define ALU_XOR     4'b1110  

// load/store control signal
`define LW      3'b001
`define LB      3'b010
`define LH      3'b011
`define LBU     3'b100
`define LHU     3'b101

`define SW      2'b01
`define SB      2'b10
`define SH      2'b11


