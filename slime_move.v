module slime_move(rst, clk, clk_vga, x, y, key, floor_pos_x0, floor_pos_y0, floor_pos_x1, floor_pos_y1, 
floor_pos_x2, floor_pos_y2, floor_pos_x3, floor_pos_y3, enable, time_gap, hit_ceiling);
    input rst, clk, clk_vga;
    input [1:0] key;
    input [9:0] floor_pos_x0, floor_pos_y0, floor_pos_x1, floor_pos_y1, floor_pos_x2, floor_pos_y2, floor_pos_x3, floor_pos_y3;
    input [3:0] enable;
    output reg [9:0] x, y;
    output [8:0] time_gap;
    output hit_ceiling;

    reg [8:0] time_gap, next_time_gap;
    reg [9:0] next_y;
    reg state, next_state;
    reg [1:0] h_state, next_h_state;
    reg hit_ceiling, next_hit_ceiling;

    parameter INIT = 2'd0;
    parameter LEFT = 2'd1;
    parameter RIGHT = 2'd2;

    parameter JUMP_UP = 1'b0;
    parameter FALL_DOWN = 1'b1;

    always @ (posedge clk) begin
        if (rst) h_state <= 2'd0;
        else begin
            case (key)
                2'b10: h_state <= LEFT;
                2'b01: h_state <= RIGHT;
                default: h_state <= h_state;
            endcase
        end
    end

    always @ (posedge clk) begin
        if (rst) x <= 10'd310;
        else if (clk_vga) begin
            case (h_state)
                LEFT: x <= (x >= 1) ? x - 1 : 10'd619;
                RIGHT: x <= (x + 1 > 10'd619) ? 10'd0 : x + 1;
                default: x <= x;
            endcase
        end
        else begin
            x <= x;
        end
    end

    always @ (posedge clk)begin
        if (rst) begin
            y <= 10'd379;
            state <= FALL_DOWN;
            time_gap <= 9'd1;
            hit_ceiling <= 1'b0;
        end
        else if (clk_vga) begin
            y <= next_y;
            state <= next_state;
            time_gap <= next_time_gap;
            hit_ceiling <= next_hit_ceiling;
        end
        else begin
            y <= y;
            state <= state;
            time_gap <= time_gap;
            hit_ceiling <= hit_ceiling;
        end
    end
    
    always @ (*)begin
        case(state)
            JUMP_UP: begin
                next_hit_ceiling = (time_gap > 9'd320) ? 1'd0 : hit_ceiling;
                next_state = (time_gap > 9'd320) ? FALL_DOWN : JUMP_UP;
                if (hit_ceiling) begin
                    next_y = y;
                    if (time_gap > 9'd320) begin
                        next_time_gap = 9'd1;
                    end
                    else if(time_gap >= 9'd1 && time_gap < 9'd80)begin
                        next_time_gap = time_gap + 9'd1;
                    end
                    else if(time_gap >= 9'd80 && time_gap < 9'd160)begin
                        next_time_gap = time_gap + 9'd1;
                    end
                    else if(time_gap >= 9'd160 && time_gap < 9'd240)begin
                        next_time_gap = time_gap + 9'd1;
                    end
                    else if(time_gap >= 9'd240 && time_gap < 9'd320)begin
                        next_time_gap = time_gap + 9'd1;
                    end
                    else begin
                        next_time_gap = time_gap + 9'd1;
                    end
                end
                else begin
                    if (time_gap > 9'd320) begin
                        next_y = y;
                        next_time_gap = 9'd1;
                    end
                    else if(time_gap >= 9'd1 && time_gap < 9'd80)begin
                        next_y = y - 10'd1;
                        next_time_gap = time_gap + 9'd1;
                    end
                    else if(time_gap >= 9'd80 && time_gap < 9'd160)begin
                        next_y = (time_gap[0] == 1'b0) ? y - 10'd1 : y;
                        next_time_gap = time_gap + 9'd1;
                    end
                    else if(time_gap >= 9'd160 && time_gap < 9'd240)begin
                        next_y = (time_gap[1:0] == 2'b00) ? y - 10'd1 : y;
                        next_time_gap = time_gap + 9'd1;
                    end
                    else if(time_gap >= 9'd240 && time_gap < 9'd320)begin
                        next_y = (time_gap[2:0] == 3'b000) ? y - 10'd1 : y;
                        next_time_gap = time_gap + 9'd1;
                    end
                    else begin
                        next_y = y;
                        next_time_gap = time_gap + 9'd1;
                    end
                end
                
            end
            default: begin
                if (y == 10'd479) begin
                    next_y = y;
                    next_time_gap = 9'd1;
                    next_state = FALL_DOWN;
                    next_hit_ceiling = 1'd0;
                end
                else begin
                    if (enable[0] && (y == floor_pos_y0 - 1) && ((x >= floor_pos_x0 && x <= floor_pos_x0 + 10'd40) || (x + 10'd20 >= floor_pos_x0 && x + 10'd20 <= floor_pos_x0 + 10'd40))) begin
                        next_y = y;
                        next_time_gap = 9'd1;
                        next_state = JUMP_UP;
                        next_hit_ceiling = y < 10'd240;
                    end
                    else if (enable[1] && (y == floor_pos_y1 - 1) && ((x >= floor_pos_x1 && x <= floor_pos_x1 + 10'd40) || (x + 10'd20 >= floor_pos_x1 && x + 10'd20 <= floor_pos_x1 + 10'd40))) begin
                        next_y = y;
                        next_time_gap = 9'd1;
                        next_state = JUMP_UP;
                        next_hit_ceiling = y < 10'd240;
                    end
                    else if (enable[2] && (y == floor_pos_y2 - 1) && ((x >= floor_pos_x2 && x <= floor_pos_x2 + 10'd40) || (x + 10'd20 >= floor_pos_x2 && x + 10'd20 <= floor_pos_x2 + 10'd40))) begin
                        next_y = y;
                        next_time_gap = 9'd1;
                        next_state = JUMP_UP;
                        next_hit_ceiling = y < 10'd240;
                    end
                    else if (enable[3] && (y == floor_pos_y3 - 1) && ((x >= floor_pos_x3 && x <= floor_pos_x3 + 10'd40) || (x + 10'd20 >= floor_pos_x3 && x + 10'd20 <= floor_pos_x3 + 10'd40))) begin
                        next_y = y;
                        next_time_gap = 9'd1;
                        next_state = JUMP_UP;
                        next_hit_ceiling = y < 10'd240;
                    end
                    else if (time_gap > 9'd320) begin
                        next_y = y + 10'd1;
                        next_time_gap = time_gap;
                        next_state = FALL_DOWN;
                        next_hit_ceiling = hit_ceiling;
                    end
                    else if(time_gap >= 9'd1 && time_gap < 9'd80)begin
                        next_y = (time_gap[2:0] == 3'b000) ? y + 10'd1 : y;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                        next_hit_ceiling = hit_ceiling;
                    end
                    else if(time_gap >= 9'd80 && time_gap < 9'd160)begin
                        next_y = (time_gap[1:0] == 2'b00) ? y + 10'd1 : y;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                        next_hit_ceiling = hit_ceiling;
                    end
                    else if(time_gap >= 9'd160 && time_gap < 9'd240)begin
                        next_y = (time_gap[0] == 1'b0) ? y + 10'd1 : y;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                        next_hit_ceiling = hit_ceiling;
                    end
                    else if(time_gap >= 9'd240 && time_gap < 9'd320)begin
                        next_y = y + 10'd1;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                        next_hit_ceiling = hit_ceiling;
                    end
                    else begin
                        next_y = y;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                        next_hit_ceiling = hit_ceiling;
                    end
                end
                
                //next_state = (time_gap > 9'd320) ? JUMP_UP: FALL_DOWN;
            end
        endcase
    end


endmodule