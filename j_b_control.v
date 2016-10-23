module j_b_control(branch,bmv,baln,jalpc,blez,bneal,balrn,dataa,datab,statusregister,baln_out,bneal_out,selectmux,st2_neg);
input [2:0] statusregister,st2_neg;
input [31:0] dataa,datab;
input branch,baln,jalpc,blez,bneal,balrn,bmv;
output baln_out,bneal_out;
wire ne,baln_out,bneal_out;
//input zout;
//output pcsrc;
//reg pcsrc;
assign ne=(|(dataa+1+(~datab)));	

output [2:0] selectmux;
wire [2:0] selectmux;
reg [2:0] x;
//assign pcsrc=branch && zout; 

//always @(zout or branch)
//begin
//if(branch&zout) x=3'b001;
//end
assign bneal_out = bneal & ne;
assign baln_out = baln & statusregister[1];
assign selectmux = (branch == 1 ) ? 3'b001:
		   (bmv == 1 & statusregister[2]) ? 3'b010:
		   (baln == 1 & statusregister[1]) ? 3'b011:
		   (jalpc == 1 ) ? 3'b001:
		   (blez == 1 & (dataa[31] == 1 | (|dataa) == 0 )) ? 3'b001:
		   (bneal == 1 & ne == 1) ? 3'b001:
		   (balrn == 1 & statusregister[1]== 1 ) ? 3'b100:
		
							   3'b000;
endmodule