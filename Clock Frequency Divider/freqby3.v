module clocks(clk,reset,f3);
  input clk;
  input reset;
  output f3;
  
  reg [1:0] count = 0;
  
  always @(posedge clk  or posedge reset)
    begin
      if (reset) 
        count <=0;
      else if (count ==2)
        count<=0;
        else count<=count+1;
    end
  
  assign f3= (count==2);
//duty cycle 33%
endmodule
  
  
  
