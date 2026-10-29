module tb_top();
  
  // 1. Declare Signals to connect to DUT
  logic[3:0] divide_rate;
  logic in_clk;
  logic out_clk;
  logic rst_n;
  
  // 2. Instantiate the DUT
  clock_divider dut (
    .divide_rate(divide_rate),
    .in_clk(in_clk),
    .out_clk(out_clk),
    .rst_n(rst_n)
  );
  
  // 3. Stimulus Process
  initial begin
    // Setup waveform dumping
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_top);
    #100
    rst_n = 0;
    #100;
    rst_n = 1;
    
    for (int j = 2; j < 7; j++) begin
      divide_rate = j;
      // Loop through all N digit possible configs
      for (int i = 0; i < (100); i++) begin
        in_clk = 4'd0;
        #10; // wait 10 ns for comb logic to settle  
        in_clk = 4'd1;
        #10; // wait 10 ns for comb logic to settle  
      end
    end

    $finish; // End simulation
    
  end
    
endmodule
