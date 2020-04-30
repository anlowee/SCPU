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
`define DMRE_LW      3'b001
`define DMRE_LB      3'b010
`define DMRE_LH      3'b011
`define DMRE_LBU     3'b100
`define DMRE_LHU     3'b101

`define DMWR_SW      2'b01
`define DMWR_SB      2'b10
`define DMWR_SH      2'b11

// Instruction op code and funct code
`define R_TYPE  6'b000000
// funct code
`define ADD     6'b100000
`define ADDU    6'b100001
`define AND     6'b100100
`define NOR     6'b100111
`define OR      6'b100101
`define SLL     6'b000000
`define SLLV    6'b000100
`define SLT     6'b101010
`define SLTU    6'b101011 
`define SRA     6'b000011
`define SRAV    6'b000111
`define SRL     6'b000010 
`define SRLV    6'b000110
`define SUB     6'b100010 
`define SUBU    6'b100011 
`define XOR     6'b100110 
// jump funct code
`define JALR    6'b001001
`define JR      6'b001000 

// R-I type op code
`define ANDI    6'b001000 
`define ADDIU   6'b001001 
`define ANDI    6'b001100
`define LUI     6'b001111
`define ORI     6'b001101
`define SLTI    6'b001010 
`define SLTIU   6'b001011 
`define XORI    6'b001110 

// branch op code
`define BEQ         6'b000100  
`define BGTZ        6'b000111
`define BLEZ        6'b000110 
`define BNE         6'b000101 
`define BLTZ_BGEZ   6'b000001 
`define BGEZ        5'b00001
`define BLTZ        5'b00000 

// jump op code
`define J       6'b000010 
`define JAL     6'b000011 

// l/s op code
`define LB      6'b100000 
`define LBU     6'b100100 
`define LH      6'b100001 
`define LHU     6'b100101 
`define LW      6'b100011 
`define SB      6'b101000 
`define SH      6'b101001 
`define SW      6'b101011 

