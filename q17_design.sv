module clock_divider (
  input logic [3:0]divide_rate,
  input logic in_clk,
  output logic out_clk,
  input logic rst_n
);

  logic [5:0] cnt = 6'd0;
  
  always @(posedge in_clk or negedge in_clk or negedge rst_n) begin
    if (!rst_n) begin
      cnt <=6'd0;
      out_clk <= 1'd0;
    end else if (cnt == divide_rate) begin
      out_clk <= ~out_clk;
      cnt <= 6'd1;
    end else begin
      cnt <= cnt + 1'd1;
    end
  end
endmodule
