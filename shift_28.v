module shift_28(shout,shin);
output [27:0] shout;
input [25:0] shin;

assign shout[27:2]=shin;
assign shout[1]=0;
assign shout[0]=0;
endmodule