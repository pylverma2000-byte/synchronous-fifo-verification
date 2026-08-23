\`timescale 1ns/1ps

\`include "fifo_if.sv"
\`include "fifo_driver.sv"
\`include "fifo_monitor.sv"
\`include "fifo_scoreboard.sv"

module fifo_tb;

    logic clk;

    always #5 clk = ~clk;

    fifo_if vif(clk);

    sync_fifo dut(
        .clk(clk),
        .rst(vif.rst),
        .wr_en(vif.wr_en),
        .rd_en(vif.rd_en),
        .din(vif.din),
        .dout(vif.dout),
        .full(vif.full),
        .empty(vif.empty)
    );

    fifo_driver driver;
    fifo_monitor monitor;
    fifo_scoreboard scoreboard;

    initial begin

        clk = 0;

        driver = new(vif);
        monitor = new(vif);
        scoreboard = new();

        fork
            monitor.monitor();
        join_none

        driver.reset();

        repeat (10) begin
            logic [7:0] data;
            data = $urandom_range(0,255);
            scoreboard.store(data);
            driver.write(data);
        end

        repeat (10) begin
            driver.read();
            scoreboard.check(vif.dout);
        end

        #20;
      $display(" TEST COMPLETED ");
        $finish;

    end

endmodule
