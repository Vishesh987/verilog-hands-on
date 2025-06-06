`timescale 1ns/1ps

module tb;
    reg clk;
    reg din;
    wire outp,outn,outb;
    wire q;

    edge_detection dut (
        .clk (clk),
        .din (din),
      .outp (outp),
      .outn (outn),
      .outb (outb),
      .q   (q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
  
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, dut);
  end

    initial begin
        din = 1'b0;
      	
        #10 din = 1'b1;
        #10 din = 1'b0;
        #10 din = 1'b1;
        #10 din = 1'b0;
        #10 din = 1'b1;
        #10 din = 1'b1;
        #10 din = 1'b1;
        #10 din = 1'b0;
        #20 $finish;
    end

    
endmodule
