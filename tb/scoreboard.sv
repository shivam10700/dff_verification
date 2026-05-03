class scoreboard;

    virtual dff_if vif;
    logic prev_d;   // store previous input

    function new(virtual dff_if vif);
        this.vif = vif;
        prev_d = 0;
    endfunction

    task run();
        forever begin
            @(posedge vif.clk);

            if (!vif.rst_n) begin
                prev_d = 0;
            end
            else begin
                if (vif.q !== prev_d) begin
                    $display("ERROR: Expected q=%0d, Got q=%0d at time=%0t",
                              prev_d, vif.q, $time);
                end
                else begin
                    $display("PASS: q=%0d at time=%0t", vif.q, $time);
                end

                // update previous d AFTER checking
                prev_d = vif.d;
            end
        end
    endtask

endclass
