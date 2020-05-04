`include "ctrl_encode_def.v"

module ctrl_unit(  // p176
    output reg [1:0] RegDst,
    output reg [1:0] ToReg,  // What write into Reg
    output reg ALUSrc,
    output reg RFWr,
    output reg [3:0] NPCOp,
    input      [5:0] op,    //31:26
    input      [5:0] funct,  // 5:0
    input      [4:0] bgez_bltz,  // 20:16
    output reg [4:0] ALUOp,
    output reg [1:0] DMWr,
    output reg [2:0] DMRe);

    always @(*) begin
        case (op)
            `R_TYPE:  begin
                // R-type
                NPCOp = `NPC_PLUS4;
                RegDst = `RD_RD;  // write into rd
                ALUSrc = 1'b0;
                ToReg = `ALU2REG;
                RFWr = 1'b1;
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_R;  // R-type, determined by funct code
            end
            `ADDI:  begin
                // ADDI
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // imm
                ToReg = `ALU2REG;  
                RFWr = 1'b1;
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_ADD;
            end
            `ADDIU:  begin
                // ADDIU
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // imm
                ToReg = `ALU2REG; 
                RFWr = 1'b1;
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_ADDU;
            end
            `ANDI:  begin
                // ANDI
                NPCOp = `NPC_PLUS4;
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // imm
                ToReg = `ALU2REG; 
                RFWr = 1'b1;
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_AND;
            end
            `LUI:  begin
                // LUI
                NPCOp = `NPC_PLUS4;  
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // imm
                ToReg = `ALU2REG;  
                RFWr = 1'b1;
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_LUI;
            end
            `ORI:  begin
                // ORI
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // imm
                ToReg = `ALU2REG;  
                RFWr = 1'b1;
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_OR;
            end
            `SLTI:  begin
                // SLTI
                NPCOp = `NPC_PLUS4;  
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // imm
                ToReg = `ALU2REG;  
                RFWr = 1'b1;
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_SLT;
            end
            `SLTIU:  begin
                // SLTIU
                NPCOp = `NPC_PLUS4;  
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // imm
                ToReg = `ALU2REG;  
                RFWr = 1'b1;
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_SLTU;
            end
            `XORI:  begin
                // XORI
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // imm
                ToReg = `ALU2REG; 
                RFWr = 1'b1;
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_XOR;
            end
            `BEQ:  begin
                // BEQ
                NPCOp = `NPC_BRANCH_BEQ; 
                RegDst = `RD_RT; // x
                ALUSrc = 1'b0;  // ALU do sub operation
                ToReg = `ALU2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_SUB;
            end
            `BGTZ:  begin
                // BGTZ
                NPCOp = `NPC_BRANCH_BGTZ; 
                RegDst = `RD_RT;  // x
                ALUSrc = 1'b0;  // x
                ToReg = `ALU2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_SUBZ;
            end
            `BLEZ:  begin
                // BLEZ
                NPCOp = `NPC_BRANCH_BLEZ;  
                RegDst = `RD_RT;  // x
                ALUSrc = 1'b0;  // x
                ToReg = `ALU2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_SUBZ;
            end
            `BNE:  begin
                // BNE
                NPCOp = `NPC_BRANCH_BNE; 
                RegDst = `RD_RT;  // x
                ALUSrc = 1'b0;  // x
                ToReg = `ALU2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_SUB;
            end
            `BLTZ_BGEZ:  begin
                // BLTZ and BGEZ
                RegDst = `RD_RT;  // x
                ALUSrc = 1'b0;  // x
                ToReg = `ALU2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                if (bgez_bltz == 5'b00000) begin
                    NPCOp = `NPC_BRANCH_BLTZ; 
                    ALUOp = `ALU_SUBZ;
                end else begin
                    NPCOp = `NPC_BRANCH_BGEZ; 
                    ALUOp = `ALU_SUBZ;
                end
            end
            `J:  begin
                // J
                NPCOp = `NPC_JUMP; 
                RegDst = `RD_RT;  // x
                ALUSrc = 1'b0;  // x
                ToReg = `ALU2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_NOP;
            end
            `JAL:  begin
                // JAL
                NPCOp = `NPC_JUMP; 
                RegDst = `RD_RA;  // write into %ra
                ALUSrc = 1'b0;  // x
                ToReg = `NPC2REG;  // Next PC write into %ra
                RFWr = 1'b1;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_NOP;
            end
            `JALR_JR:  begin
                // JALR and JR
                NPCOp = `NPC_JUMPR; 
                RegDst = `RD_RD;  // if JALR then write into rd
                ALUSrc = 1'b0;  // x
                ToReg = `NPC2REG;  // Next PC write into rd
                if (funct == 6'b001001)
                    RFWr = 1'b1;
                else 
                    RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_NOP;
            end
            `LB:  begin
                // LB
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // offset
                ToReg = `DM2REG;  // load data from DM into reg
                RFWr = 1'b1;  
                DMRe = `DMRE_LB; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_ADD;  // caculate address
            end
            `LBU:  begin
                // LBU
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // offset
                ToReg = `DM2REG;  // load data from DM into reg
                RFWr = 1'b1;  
                DMRe = `DMRE_LBU; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_ADD;  // caculate address
            end
            `LH:  begin
                // LH
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // offset
                ToReg = `DM2REG;  // load data from DM into reg
                RFWr = 1'b1;  
                DMRe = `DMRE_LH; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_ADD;  // caculate address
            end
            `LHU:  begin
                // LHU
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // offset
                ToReg = `DM2REG;  // load data from DM into reg
                RFWr = 1'b1;  
                DMRe = `DMRE_LHU; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_ADD;  // caculate address
            end
            `LW:  begin
                // LW
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // write into rt
                ALUSrc = 1'b1;  // offset
                ToReg = `DM2REG;  // load data from DM into reg
                RFWr = 1'b1;  
                DMRe = `DMRE_LW; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_ADD;  // caculate address
            end
            `SB:  begin
                // SB
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // x
                ALUSrc = 1'b1;  // offset
                ToReg = `DM2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_SB; 
                ALUOp = `ALU_ADD;  // caculate address
            end
            `SH:  begin
                // SH
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // x
                ALUSrc = 1'b1;  // offset
                ToReg = `DM2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_SH; 
                ALUOp = `ALU_ADD;  // caculate address
            end
            `SW:  begin
                // SW
                NPCOp = `NPC_PLUS4; 
                RegDst = `RD_RT;  // x
                ALUSrc = 1'b1;  // offset
                ToReg = `DM2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_SW; 
                ALUOp = `ALU_ADD;  // caculate address
            end
            default:    begin
                // NOP
                NPCOp = `NPC_PLUS4;  
                RegDst = `RD_RT;  // x
                ALUSrc = 1'b0;  // x
                ToReg = `DM2REG;  // x
                RFWr = 1'b0;  
                DMRe = `DMRE_NOP; 
                DMWr = `DMWR_NOP; 
                ALUOp = `ALU_NOP; 
            end
        endcase
    end

endmodule