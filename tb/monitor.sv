class monitor;

    virtual dff_if vif;

    function new(virtual dff_if vif);
        this.vif = vif;
    endfunction

    task run();
        forever begin
            @(posedge vif.clk);
            $display("MONITOR: d=%0d q=%0d rst_n=%0d time=%0t",
                      vif.d, vif.q, vif.rst_n, $time);
        end
    endtask

endclass
