   
   module   ripple_carry_adder
   #(parameter DATA_BIT = 64)
   (
      input    logic                         clk      ,
      input    logic                         reset    ,
      input    logic                         enable   ,
      input    logic [DATA_BIT - 'd1 : 'd0]  summand  ,
      input    logic [DATA_BIT - 'd1 : 'd0]  addend   ,
      output   logic [DATA_BIT - 'd1 : 'd0]  result   ,
      output   logic                         valid    ,
      output   logic                         over_flow
   );
   
   logic [DATA_BIT - 'd1 : 'd0]  carry_net   ;
   logic [DATA_BIT - 'd1 : 'd0]  o_sum       ;
   logic [DATA_BIT - 'd1 : 'd0]  o_carry_out ;
   
   assign   carry_net[0]   =  'd0;
   
   genvar   i;
   generate 
      for(i = 0; i < DATA_BIT; i++) begin :  full_adder_unit
         full_adder  full_adder
         (
            .clk         (clk             ),
            .reset_n     (reset_n         ),
            .i_a         (summand[i]      ),
            .i_b         (addend[i]       ),
            .i_carry_in  (carry_net[i]    ),
            .o_sum       (o_sum[i]        ),
            .o_carry_out (o_carry_out[i]  )
         );
      end
      
      if(i == 0)  begin
         assign   carry_net[i]   =  'd0;
      end
      else  begin
         assign   carry_net[i]   =  o_carry_out[i - 1]; 
      end
      
   endgenerate
   
   always_comb begin
      if(o_carry_out[63] == 'd1) begin
         over_flow   =  'd1;
      end
      else  begin
         over_flow   =  'd0;
      end
   end
   
   assign   result   =  o_sum;
   
   endmodule