`include "ctrl_encode_def.v"

module RegDstMux(
    input [4:0] rt, rd,
    input RegDst,
    output reg [4:0] A3);

    always @(*) begin
        case (RegDst)
            `RD_RT: A3 <= rt;
            `RD_RD: A3 <= rd;
            `RD_RA: A3 <= 5'b11111;
            default:    A3 <= rt;
        endcase
    end

endmodule

module ALUSrcMux(
    input [31:0] RD2, Imm32, ShamtImm32,
    input ALUSrc,
    output reg [31:0] B);

    always @(*) begin
        case (ALUSrc) 
            `ALUSRC_REG:    B <= RD2;
            `ALUSRC_IMM:    B <= Imm32;
            `ALUSRC_SHA:    B <= ShamtImm32;
            `ALUSRC_ZERO:   B <= 32'b0;
            default:    B <= 32'b0;
        endcase
    end

endmodule

module ToRegMux(
    input [31:0] DataOut, PCPLUS4, ALUResult,
    input ToReg,
    output reg [31:0] WD);

    always @(*) begin
        case (ToReg) 
            `DM2REG:    WD <= DataOut;   
            `ALU2REG:   WD <= ALUResult;
            `NPC2REG:   WD <= PCPLUS4;
            default:    WD <= 32'b0;
        endcase
    end

endmodule