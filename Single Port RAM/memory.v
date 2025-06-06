// Code your design here
module memory 
  #(parameter Addr_width = 10,
    parameter Data_width = 8,
    parameter Depth = 1024
  )
  (
    input wire clk,
    input wire rst,
    input wire rd,
    input wire wr,
    input wire [Addr_width-1:0] addr,
    input wire [Data_width-1:0] din,
    output reg [Data_width-1:0] dout
  );

  reg [Data_width-1:0] mem [0:Depth-1];
  integer i;

  always @(posedge clk) begin
    if (rst) begin
      for (i = 0; i < Depth; i = i + 1)
        mem[i] <= 0;
    end
    else begin
      if (wr && !rd)
        mem[addr] <= din;
      else if (rd && !wr)
        dout <= mem[addr];
    end
  end

endmodule

