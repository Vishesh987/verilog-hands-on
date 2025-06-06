// Code your testbench here
module tb;

  reg clk;
  reg reset;
  wire f2;
  wire f4;

  freq_div uut (
    .clk(clk),
    .reset(reset),
    .f2(f2),
    .f4(f4)
  );
  
  always #5 clk = ~clk;
  
  
initial begin
    $dumpfile("freq_div.vcd");
    $dumpvars(0, tb);
end
  
  initial begin
    clk = 0;
    reset = 1;
    #20 reset = 0;
  end

  

  initial begin
    #200 $finish;
  end

endmodule
