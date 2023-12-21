module clk_vga(rst, clk, dclk);
    input rst, clk;
    output wire dclk;
    reg [18:0] counter;

    assign dclk = counter == 19'd0;

    always @ (posedge clk) begin
        if (rst) counter <= 19'd0;
        else counter <= counter + 19'd1;
    end

endmodule