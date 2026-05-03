class driver;

    // Virtual interface handle
    virtual dff_if vif;

    // Constructor
    function new(virtual dff_if vif);
        this.vif = vif;
    endfunction

    // Main task
    task run();

        // Apply reset
        vif.rst_n <= 0;
        vif.d     <= 0;

        repeat (2) @(posedge vif.clk);

        vif.rst_n <= 1;

        // Apply random stimulus
        repeat (10) begin
            @(posedge vif.clk);
            vif.d <= $urandom_range(0,1);
        end

    endtask

endclass
