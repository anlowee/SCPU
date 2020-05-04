`include "ctrl_encode_def.v"

module ctrl_unit(  // p176
    output reg RegDst,
    output reg Branch,
    output reg DM2Reg,  // MemtoReg
    output reg ALUSrc,
    output reg RFWr,
    output reg [1:0] NPCOp,
    input      [5:0] op,
    output reg [3:0] ALUOp,
    output reg [1:0] DMWr,
    output reg [2:0] DMRe);

    always @(*) begin
        case (op)
            6'b000000:  begin
                // R-type
                
            end
            default:
        endcase
    end

endmodule