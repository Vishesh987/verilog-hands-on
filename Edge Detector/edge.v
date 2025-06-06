// Code your design here
module edge_detection(
input din,clk,
output outp,outn,outb,
output reg q=0
);
  

  always @(posedge clk)
begin
  q<=din;
end
  
  assign outp = (din&~q); 
  assign outn = (~din&q);
  assign outb = (din^q);
  

endmodule
