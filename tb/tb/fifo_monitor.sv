class fifo_monitor;

    virtual fifo_if vif;

    function new(virtual fifo_if vif);
        this.vif = vif;
    endfunction

    task monitor();

        forever begin
            @(posedge vif.clk);

            $display("Time=%0t | WR=%0b RD=%0b DIN=%0d DOUT=%0d FULL=%0b EMPTY=%0b",
                     $time, vif.wr_en, vif.rd_en, vif.din, vif.dout, vif.full, vif.empty);
        end

    endtask

endclass
