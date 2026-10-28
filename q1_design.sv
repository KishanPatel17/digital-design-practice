module lsb_arbitrer(
  input logic [3:0] req,
  output logic [3:0] encoded_out
);
  always_comb begin
    encoded_out = 4'b0000;
    
    if (req[0] == 1'b1) encoded_out = 4'b0001;
    else if (req[1] == 1'b1) encoded_out = 4'b0010;
    else if (req[2] == 1'b1) encoded_out = 4'b0100;
    else if (req[3] == 1'b1) encoded_out = 4'b1000;
  end
  
endmodule 