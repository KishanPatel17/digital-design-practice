module tb_top();
  
  parameter N = 4;
  
  // 1. Declare Signals to connect to DUT
  logic[N-1:0] req;
  logic[N-1:0] encoded_out;
  
  // 2. Instantiate the DUT
  msb_encoder dut (
    .req(req),
    .encoded_out(encoded_out)
  );
  
  // 3. Stimulus Process
  initial begin
    // Setup waveform dumping
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_top);
    
    $display("---------------------------------------");
    $display(" Time |  req  | encoded_out | Expected ");
    $display("---------------------------------------");
    
    // Loop through all N digit possible configs
    for (int i = 0; i < (1 << N); i++) begin
      req = i[N-1:0];
      #10; // wait 10 ns for comb logic to settle
      $display("%5t |  %b  |    %b     | MSB Priority", $time, req, encoded_out);  
    end
    
    $display("---------------------------------------");
    $finish; // End simulation
    
  end
    
    
endmodule