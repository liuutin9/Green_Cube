module floor_gen(clk, clk_vga, rst, floor_pos_x0, floor_pos_y0, floor_pos_x1, floor_pos_y1, 
floor_pos_x2, floor_pos_y2, floor_pos_x3, floor_pos_y3, enable, time_gap, hit_ceiling);
    input clk, rst, hit_ceiling, clk_vga;
    input [8:0] time_gap;
    output reg [9:0] floor_pos_x0, floor_pos_y0, floor_pos_x1, floor_pos_y1, floor_pos_x2, floor_pos_y2, floor_pos_x3, floor_pos_y3;
    output reg [3:0] enable;
    reg [9:0] next_floor_pos_x0, next_floor_pos_y0, next_floor_pos_x1, next_floor_pos_y1;
    reg [9:0] next_floor_pos_x2, next_floor_pos_y2, next_floor_pos_x3, next_floor_pos_y3;

    always @ (posedge clk) begin
        if (rst) begin
            enable <= 4'b1111;
            floor_pos_x0 <= 10'd150;
            floor_pos_x1 <= 10'd300;
            floor_pos_x2 <= 10'd450;
            floor_pos_x3 <= 10'd600;
            floor_pos_y0 <= 10'd330;
            floor_pos_y1 <= 10'd460;
            floor_pos_y2 <= 10'd220;
            floor_pos_y3 <= 10'd160;
        end
        else if (clk_vga) begin
            enable <= 4'b1111;
            floor_pos_x0 <= 10'd150;
            floor_pos_x1 <= 10'd300;
            floor_pos_x2 <= 10'd450;
            floor_pos_x3 <= 10'd600;
            floor_pos_y0 <= next_floor_pos_y0;
            floor_pos_y1 <= next_floor_pos_y1;
            floor_pos_y2 <= next_floor_pos_y2;
            floor_pos_y3 <= next_floor_pos_y3;
        end
        else begin
            enable <= 4'b1111;
            floor_pos_x0 <= floor_pos_x0;
            floor_pos_x1 <= floor_pos_x1;
            floor_pos_x2 <= floor_pos_x2;
            floor_pos_x3 <= floor_pos_x3;
            floor_pos_y0 <= floor_pos_y0;
            floor_pos_y1 <= floor_pos_y1;
            floor_pos_y2 <= floor_pos_y2;
            floor_pos_y3 <= floor_pos_y3;
        end
    end

    always @ (*) begin
        if (hit_ceiling) begin
            if (time_gap > 9'd320) begin
                next_floor_pos_y0 = floor_pos_y0;
                next_floor_pos_y1 = floor_pos_y1;
                next_floor_pos_y2 = floor_pos_y2;
                next_floor_pos_y3 = floor_pos_y3;
            end
            else if(time_gap >= 9'd1 && time_gap < 9'd80)begin
                next_floor_pos_y0 = floor_pos_y0 + 10'd1;
                next_floor_pos_y1 = floor_pos_y1 + 10'd1;
                next_floor_pos_y2 = floor_pos_y2 + 10'd1;
                next_floor_pos_y3 = floor_pos_y3 + 10'd1;
            end
            else if(time_gap >= 9'd80 && time_gap < 9'd160)begin
                //next_y = (time_gap[0] == 1'b0) ? y - 10'd1 : y;
                next_floor_pos_y0 = (time_gap[0] == 1'b0) ? floor_pos_y0 + 10'd1 : floor_pos_y0;
                next_floor_pos_y1 = (time_gap[0] == 1'b0) ? floor_pos_y1 + 10'd1 : floor_pos_y1;
                next_floor_pos_y2 = (time_gap[0] == 1'b0) ? floor_pos_y2 + 10'd1 : floor_pos_y2;
                next_floor_pos_y3 = (time_gap[0] == 1'b0) ? floor_pos_y3 + 10'd1 : floor_pos_y3;
            end
            else if(time_gap >= 9'd160 && time_gap < 9'd240)begin
                //next_y = (time_gap[1:0] == 2'b00) ? y - 10'd1 : y;
                next_floor_pos_y0 = (time_gap[1:0] == 2'b00) ? floor_pos_y0 + 10'd1 : floor_pos_y0;
                next_floor_pos_y1 = (time_gap[1:0] == 2'b00) ? floor_pos_y1 + 10'd1 : floor_pos_y1;
                next_floor_pos_y2 = (time_gap[1:0] == 2'b00) ? floor_pos_y2 + 10'd1 : floor_pos_y2;
                next_floor_pos_y3 = (time_gap[1:0] == 2'b00) ? floor_pos_y3 + 10'd1 : floor_pos_y3;
            end
            else if(time_gap >= 9'd240 && time_gap < 9'd320)begin
                //next_y = (time_gap[2:0] == 3'b000) ? y - 10'd1 : y;
                next_floor_pos_y0 = (time_gap[2:0] == 3'b000) ? floor_pos_y0 + 10'd1 : floor_pos_y0;
                next_floor_pos_y1 = (time_gap[2:0] == 3'b000) ? floor_pos_y1 + 10'd1 : floor_pos_y1;
                next_floor_pos_y2 = (time_gap[2:0] == 3'b000) ? floor_pos_y2 + 10'd1 : floor_pos_y2;
                next_floor_pos_y3 = (time_gap[2:0] == 3'b000) ? floor_pos_y3 + 10'd1 : floor_pos_y3;
            end
            else begin
                next_floor_pos_y0 = floor_pos_y0;
                next_floor_pos_y1 = floor_pos_y1;
                next_floor_pos_y2 = floor_pos_y2;
                next_floor_pos_y3 = floor_pos_y3;
            end
        end
        else begin
            next_floor_pos_y0 = floor_pos_y0;
            next_floor_pos_y1 = floor_pos_y1;
            next_floor_pos_y2 = floor_pos_y2;
            next_floor_pos_y3 = floor_pos_y3;
        end
    end

endmodule