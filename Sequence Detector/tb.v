// Code your testbench here
`timescale 1ns / 1ps

module tb_fsm;
    // Testbench signals
    reg clk;
    reg rst;
    reg x;
    wire y;

    fsm uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
  initial begin
    $dumpfile("tb.vcd");  
    $dumpvars(0, tb_fsm);  
end
  

    // Apply reset and stimulus to ‘x’ without using tasks
    initial begin
      clk=0;
      rst=0;
      x=0;
      
      #10 rst=1;
      #10 rst=0;
      
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=1;
      #20 $finish;
    end
  initial $monitor("time=%0t,x-%0b,output=%0b",$time,x,y);
 endmodule