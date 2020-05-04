`include "ctrl_encode_def.v"

module alu_ctrl_unit(
    input [5:0] funct,
    input [4:0] ALUOpIn,
    output reg [4:0] ALUOpOut
);

    always @(*) begin
        if (ALUOpIn == `R_TYPE) begin
            case (funct)
                `ADD:   ALUOpOut <= `ALU_ADD;
                `ADDU:  ALUOpOut <= `ALU_ADDU;
                `AND:   ALUOpOut <= `ALU_AND;
                `NOR:   ALUOpOut <= `ALU_NOR;
                `OR:    ALUOpOut <= `ALU_OR;
                `SLL:   ALUOpOut <= `ALU_SLL;
                `SLLV:  ALUOpOut <= `ALU_SLL;
                `SLT:   ALUOpOut <= `ALU_SLT;
                `SLTU:  ALUOpOut <= `ALU_SLTU;
                `SRA:   ALUOpOut <= `ALU_SRA;
                `SRAV:  ALUOpOut <= `ALU_SRA;
                `SRL:   ALUOpOut <= `ALU_SRL;
                `SRLV:  ALUOpOut <= `ALU_SRL;
                `SUB:   ALUOpOut <= `ALU_SUB;
                `SUBU:  ALUOpOut <= `ALU_SUBU;
                `XOR:   ALUOpOut <= `ALU_XOR;
            endcase
        end else begin
            ALUOpOut <= ALUOpIn;
        end
    end

endmodule