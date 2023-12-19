module slime_move(rst, clk, clk_vga, x, y, key, floor_pos_x0, floor_pos_y0, floor_pos_x1, floor_pos_y1, floor_pos_x2, floor_pos_y2, floor_pos_x3, floor_pos_y3, enable);
    input rst, clk, clk_vga;
    input [1:0] key;
    input [10:0] floor_pos_x0, floor_pos_y0, floor_pos_x1, floor_pos_y1, floor_pos_x2, floor_pos_y2, floor_pos_x3, floor_pos_y3;
    input [3:0] enable;
    output reg [9:0] x, y;

    reg [8:0] time_gap, next_time_gap;
    reg [9:0] next_y;
    reg state, next_state;
    reg [1:0] h_state, next_h_state;

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

    always @ (posedge clk_vga) begin
        if (rst) x <= 10'd310;
        else begin
            case (h_state)
                LEFT: x <= (x >= 1) ? x - 1 : 10'd619;
                RIGHT: x <= (x + 1 > 10'd619) ? 10'd0 : x + 1;
                default: x <= x;
            endcase
        end
    end

    always @ (posedge clk_vga)begin
        if (rst) begin
            y <= 10'd379;
            state <= JUMP_UP;
            time_gap <= 9'd1;
        end
        else begin
            y <= next_y;
            state <= next_state;
            time_gap <= next_time_gap;
        end
    end
    
    always @ (*)begin
        case(state)
            JUMP_UP: begin
                //next_y = y - 2;
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
                next_state = (time_gap > 9'd320) ? FALL_DOWN : JUMP_UP;
            end
            default: begin
                if (y == 10'd479) begin
                    next_y = y;
                    next_time_gap = 9'd1;
                    next_state = FALL_DOWN;
                end
                else begin
                    if (enable[0] && (y == floor_pos_y0) && ((x >= floor_pos_x0 && x <= floor_pos_x0 + 10'd40) || (x + 10'd20 >= floor_pos_x0 && x + 10'd20 <= floor_pos_x0 + 10'd40))) begin
                        next_y = y;
                        next_time_gap = 9'd1;
                        next_state = JUMP_UP;
                    end
                    else if (enable[1] && (y == floor_pos_y1) && ((x >= floor_pos_x1 && x <= floor_pos_x1 + 10'd40) || (x + 10'd20 >= floor_pos_x1 && x + 10'd20 <= floor_pos_x1 + 10'd40))) begin
                        next_y = y;
                        next_time_gap = 9'd1;
                        next_state = JUMP_UP;
                    end
                    else if (enable[2] && (y == floor_pos_y2) && ((x >= floor_pos_x2 && x <= floor_pos_x2 + 10'd40) || (x + 10'd20 >= floor_pos_x2 && x + 10'd20 <= floor_pos_x2 + 10'd40))) begin
                        next_y = y;
                        next_time_gap = 9'd1;
                        next_state = JUMP_UP;
                    end
                    else if (enable[3] && (y == floor_pos_y3) && ((x >= floor_pos_x3 && x <= floor_pos_x3 + 10'd40) || (x + 10'd20 >= floor_pos_x3 && x + 10'd20 <= floor_pos_x3 + 10'd40))) begin
                        next_y = y;
                        next_time_gap = 9'd1;
                        next_state = JUMP_UP;
                    end
                    else if (time_gap > 9'd320) begin
                        next_y = y + 10'd1;
                        next_time_gap = time_gap;
                        next_state = FALL_DOWN;
                    end
                    else if(time_gap >= 9'd1 && time_gap < 9'd80)begin
                        next_y = (time_gap[2:0] == 3'b000) ? y + 10'd1 : y;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                    end
                    else if(time_gap >= 9'd80 && time_gap < 9'd160)begin
                        next_y = (time_gap[1:0] == 2'b00) ? y + 10'd1 : y;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                    end
                    else if(time_gap >= 9'd160 && time_gap < 9'd240)begin
                        next_y = (time_gap[0] == 1'b0) ? y + 10'd1 : y;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                    end
                    else if(time_gap >= 9'd240 && time_gap < 9'd320)begin
                        next_y = y + 10'd1;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                    end
                    else begin
                        next_y = y;
                        next_time_gap = time_gap + 9'd1;
                        next_state = FALL_DOWN;
                    end
                end
                
                //next_state = (time_gap > 9'd320) ? JUMP_UP: FALL_DOWN;
            end
        endcase
    end


endmodule