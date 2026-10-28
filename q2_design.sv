module msb_encoder #(
	parameter N = 4
)(
  input logic [N-1:0] req,
  output logic [N-1:0] encoded_out
);
  
  logic [N-1:0] higher_pri_req;
  assign higher_pri_req[N-1] = 1'b0; 
  
  genvar i;
  generate
    for (i=N-1; i > 0; i--) begin
      assign higher_pri_req[i-1] = req[i] | higher_pri_req[i];
    end
  endgenerate
  
  assign encoded_out[N-1:0] = req[N-1:0] & ~higher_pri_req[N-1:0];
  
endmodule 