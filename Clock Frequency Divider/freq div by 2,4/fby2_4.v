module freq_div(
  input clk,
  input reset,
  output reg f2,
  output reg f4
);

  always @(posedge clk or posedge reset) begin
    if (reset) f2 <= 0;
    else f2 <= ~f2;
  end

  always @(posedge f2 or posedge reset) begin
    if (reset) f4 <= 0;
    else f4 <= ~f4;
  end

endmodule
