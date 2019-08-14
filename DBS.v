module  andyissohandsome(
  input   logic clk,
  input   logic reset,
  output  logic nothing
);
  
  always@(posedge clk,negedge reset) begin
    if(reset)  begin
      nothing <=  'd0;
    end
    else  begin
      nothing <=  'd1;
    end
  end
  
endmodule
