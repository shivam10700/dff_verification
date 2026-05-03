`include "interface.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


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

  driver drv;
  monitor mon;
  scoreboard sb;
  
  //Clock generation
  initial begin
    vif.clk = 0;
    forever #5 vif.clk = ~vif.clk;  //10ns clock period
  end

  initial begin
    drv = new(vif);
    mon = new(vif);
    sb  = new(vif);

    fork
        drv.run();
        mon.run();
        sb.run();
    join
end
  
  initial begin
    #200 $finish;
end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_top);
end

endmodule
