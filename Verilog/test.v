module fsm_sale(
input                   clk                 ,
input                   rst_n               ,
input      [1:0]        in                  ,
output reg [1:0]        out                 ,
output reg              out_vld
);
//---------------�����ź�----------------------//
reg  [3:0]              state             ;

//---------------�����ź�״̬����--------------------//
parameter S0           = 4'b0001           ;
parameter S1           = 4'b0010           ;
parameter S2           = 4'b0100           ;
parameter S3           = 4'b1000           ;

//---------------һ��ʽ״̬��--------------------//

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)begin
    state <= S0;
  out <= 0;
  out_vld <= 0;
   end
 else begin
    case(state)
     S0:begin
      if(in==1)begin
      state <= S1;out <= 0;out_vld <= 0;
    end
      else if(in==2)begin
        state <= S2;out <= 0;out_vld <= 0;
        end 
    else begin
      state <= state;out <= 0;out_vld <= 0;
    end
   end
     S1:begin
        if(in==1)begin
       state <= S2;out <= 0;out_vld <= 0;
    end
    else if(in==2)begin
       state <= S3;out <= 0;out_vld <= 0;
    end
    else begin
      state <= state;out <= 0;out_vld <= 0;
    end 
       end
       S2:begin
          if(in==1)begin
       state <= S3;out <= 0;out_vld <= 0;
      end
    else if(in==2)begin
       state <= S0;out <= 0;out_vld <=1;
    end
    else begin
       state <= state;out <= 0;out_vld <= 0;
    end
         end
     S3:begin
        if(in==1)begin
       state <= S0;out <= 0;out_vld <=1;
    end
    else if(in==2)begin
       state <= S0;out <= 1;out_vld <=1;
    end
    else begin
       state <= state;out <= 0;out_vld <= 0;
    end
       end
         default:state <= S0; 
  endcase
 end
end

endmodule