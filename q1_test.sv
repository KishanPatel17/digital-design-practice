module main();
  wire [3:0] in1 = 4'b1011;
  wire [3:0] in2 = 4'b1000;
  wire [3:0] in3 = 4'b0010;

  wire [3:0] out1;
  wire [3:0] out2;
  wire [3:0] out3;

  lsb_arbitrer u1 (
    .req(in1),
    .encoded_out(out1)
  );

  lsb_arbitrer u3 (
    .req(in3),
    .encoded_out(out3)
  );
         

  lsb_arbitrer u2(
    .req(in2),
    .encoded_out(out2)
  );

  
endmodule