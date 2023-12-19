module floor_gen(clk, rst, floor_pos_x0, floor_pos_y0, floor_pos_x1, floor_pos_y1, floor_pos_x2, floor_pos_y2, floor_pos_x3, floor_pos_y3, enable);
    input clk, rst;
    output reg [10:0] floor_pos_x0, floor_pos_y0, floor_pos_x1, floor_pos_y1, floor_pos_x2, floor_pos_y2, floor_pos_x3, floor_pos_y3;
    output reg [3:0] enable;

    always @ (posedge clk) begin
        if (rst) begin
            enable <= 4'b1111;
            floor_pos_x0 <= 10'd120;
            floor_pos_x1 <= 10'd280;
            floor_pos_x2 <= 10'd320;
            floor_pos_x3 <= 10'd400;
            floor_pos_y0 <= 10'd420;
            floor_pos_y1 <= 10'd380;
            floor_pos_y2 <= 10'd380;
            floor_pos_y3 <= 10'd420;
        end
        else begin
            enable <= 4'b1111;
            floor_pos_x0 <= 10'd120;
            floor_pos_x1 <= 10'd280;
            floor_pos_x2 <= 10'd320;
            floor_pos_x3 <= 10'd400;
            floor_pos_y0 <= 10'd420;
            floor_pos_y1 <= 10'd380;
            floor_pos_y2 <= 10'd380;
            floor_pos_y3 <= 10'd420;
        end
    end

endmodule