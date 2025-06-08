// Code your design here 10101
module fsm(
  input clk,rst,x,
  output reg y);
  
  parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;
  
  reg[2:0] state,nstate;
  
  always@(posedge clk)
    begin
      if(rst)
        state<=s0;
      else
        state<=nstate;
    end
  
  always@(state,x)
    begin
      y=0;
      case(state)
        s0: begin 
          nstate= (x==1)?s1:s0;
          y=0;
        end
        s1: begin
          nstate=(x==0)?s2:s1;
          y=0;
        end
        s2:begin
          nstate=(x==1)?s3:s0;
          y=0;
        end
        s3:begin
          nstate=(x==0)?s4:s1;
          y=0;
        end
        s4:begin
          nstate=s0;
          y=(x==1)?1:0;
        end
        default: nstate=s0;
      endcase
    end
      endmodule
      
          
  
  
  