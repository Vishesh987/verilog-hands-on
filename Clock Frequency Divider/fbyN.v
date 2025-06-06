module clocks
  #(parameter N=3)(
  input clk,
  input reset,
  output reg clko
);

  reg [1:0] count=0;

  always @(posedge clk or negedge clk) begin
    if (reset) begin
      count <= 0;
      clko <= 0;
    end else begin
      count <= count + 1;
      if (count == N-1) begin  
        clko <= ~clko;
        count <= 0;
      end
    end
  end

endmodule

