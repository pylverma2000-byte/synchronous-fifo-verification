class fifo_scoreboard;

    logic [7:0] expected[$];

    task store(input logic [7:0] data);
        expected.push_back(data);
    endtask

    task check(input logic [7:0] data);

        logic [7:0] exp;

        if(expected.size() > 0) begin

            exp = expected.pop_front();

            if(exp == data)
                $display("PASS : Expected=%0d Received=%0d", exp, data);
            else
                $display("FAIL : Expected=%0d Received=%0d", exp, data);

        end

    endtask

endclass
