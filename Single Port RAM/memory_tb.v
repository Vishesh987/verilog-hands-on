`timescale 1ns/1ps

module memory_tb;

  parameter Addr_width = 10;  
  parameter Data_width = 8;
  parameter Depth = 1024;

  reg clk;
  reg rd;
  reg wr;
  reg rst;
  reg [Addr_width-1:0] addr;
  reg [Data_width-1:0] din;
  wire [Data_width-1:0] dout;

  memory #(Addr_width, Data_width, Depth) uut (
    .clk(clk),
    .rd(rd),
    .wr(wr),
    .addr(addr),
    .rst(rst),
    .din(din),
    .dout(dout)
  );

  always #5 clk = ~clk;

  integer i;

  initial begin
    clk = 0;rd = 0;wr = 0;addr = 0;din = 0;rst = 0;

//loop for writing 
for (i = 0; i < Depth; i = i + 1) begin
      #5;
      addr = i;wr = 1;
  
      din = i * 3;  
      
      #10;
   $display("Time=%0t: WRITE addr=%0d <= din=0x%0h", $time, addr,din);
      wr = 0;
end

//loop for reading    
for (i = 0; i < Depth; i = i + 1) begin
      #5;
      addr = i;
     rd = 1;
     
    #10;   $display("Time=%0t: READ  addr=%0d => dout=0x%0h", $time, addr, dout);
      rd = 0;
end
    
    
// Apply reset 
    #20;
    rst = 1;
    #20;
    rst = 0;
    $display("Time=%0t: RESET reapplied", $time);

 // Read all values after reset
    for (i = 0; i < Depth; i = i + 1) begin
      #5;
      addr = i;
      rd = 1;
      #10;
      $display("Time=%0t: READ after RESET addr=%0d => dout=0x%0h", $time, addr, dout);
      rd = 0;
    end
    #20;
    $finish;
  end
  
  

endmodule
