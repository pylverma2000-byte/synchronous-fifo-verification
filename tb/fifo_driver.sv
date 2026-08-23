class fifo_driver;

    virtual fifo_if vif;

    function new(virtual fifo_if vif);
        this.vif = vif;
    endfunction

    task reset();
        vif.rst   = 1;
        vif.wr_en = 0;
        vif.rd_en = 0;
        vif.din   = 0;

        repeat(2) @(posedge vif.clk);

        vif.rst = 0;
    endtask

    task write(input logic [7:0] data);
        @(posedge vif.clk);
        vif.wr_en = 1;
        vif.rd_en = 0;
        vif.din   = data;

        @(posedge vif.clk);
        vif.wr_en = 0;
    endtask

    task read();
        @(posedge vif.clk);
        vif.rd_en = 1;
        vif.wr_en = 0;

        @(posedge vif.clk);
        vif.rd_en = 0;
    endtask

endclass
