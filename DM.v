module DM(clk, Addr, DMWr, DataIn, DataOut);  // 8-bits PC, not 32 bits

    input clk;
    input DMWr;
    input   [7:0] Addr;
    input   [31:0] DataIn;
    output  [31:0] DataOut;

    reg [31:0] DataMem[253:0];
   
   always @(posedge clk) begin
      if (DMWr) DataMem[Addr] <= DataIn;
   end

   assign DataOut = DataMem[Addr];

endmodule

