`timescale 1ns/1ps

module tb_top;

  //Interface instance
  dff_if vif();

  //DUT instantiation
  dff dut (
    .clk (vif.clk),
    .rst_n (vif.rst_n),
    .d (vif.d),
    .q (vif.q)
  );

  //Clock generation
  initial begin
    vif.clk = 0;
    forever #5 vif.clk = ~vif.clk;  //10ns clock period
  end

  //Stimulus
  initial begin
    //Initialize
    vif.rst_n = 0;
    vif.d = 0;

    #10;
    vif.rst_n = 1;

    //Apply inputs
    #10 vif.d = 1;
    #10 vif.d = 0;
    #10 vif.d = 1;
    #10 vif.d = 1;
    #10 vif.d = 0;

    #20 $finish;

  end

endmodule
