   
   module   full_adder
   (
      input    logic clk         ,
      input    logic reset_n     ,
      input    logic i_a         ,
      input    logic i_b         ,
      input    logic i_carry_in  ,
      output   logic o_sum       ,
      output   logic o_carry_out 
   );
   
   assign   o_sum       =  (i_a ^ i_b) ^ i_carry_in;
   assign   o_carry_out =  (i_a & i_b) | ((i_a ^ i_b) & i_carry_in);
   
   endmodule
