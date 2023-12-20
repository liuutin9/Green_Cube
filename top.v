module Top(clk, rst, vgaRed, vgaBlue, vgaGreen, hsync, vsync, PS2_DATA, PS2_CLK);
	input clk, rst;
    output [3:0] vgaRed, vgaGreen, vgaBlue;
    output hsync, vsync;
	inout wire PS2_DATA;
    inout wire PS2_CLK;
	
	wire clk_d2;//25MHz
	wire clk_d18;
    wire [16:0] pixel_addr;
    wire [11:0] pixel;
	wire [11:0] data;
    wire valid;
	//640*480
    wire [9:0] h_cnt, v_cnt;

	wire [9:0] slime_pos_x, slime_pos_y;

    wire [10:0] floor_pos_x0, floor_pos_y0, floor_pos_x1, floor_pos_y1, floor_pos_x2, floor_pos_y2, floor_pos_x3, floor_pos_y3;
    wire [3:0] enable;

    wire rst_db, rst_op;

	// keyboard
	parameter [8:0] KEY_A = 9'h01c;
    parameter [8:0] KEY_D = 9'h023;
 	wire [511:0] key_down;
    wire [8:0] last_change;
    wire been_ready;
	reg [1:0] key_state;

    wire hit_ceiling;
    wire [8:0] time_gap;
	
	//clock
	clk_div #(2) CD0(.clk(clk), .clk_d(clk_d2));
	clk_div #(19) CD1(.clk(clk), .clk_d(clk_18));

    debounce DB_RST(.s(rst), .s_db(rst_db), .clk(clk));
    //onepulse OP_RST(.s(rst_db), .s_op(rst_op), .clk(clk));

	pixel_gen PG(
		.h_cnt(h_cnt),
		.v_cnt(v_cnt),
		.valid(valid),
		.slime_pos_x(slime_pos_x),
		.slime_pos_y(slime_pos_y),
        .floor_pos_x0(floor_pos_x0),
        .floor_pos_y0(floor_pos_y0),
        .floor_pos_x1(floor_pos_x1),
        .floor_pos_y1(floor_pos_y1),
        .floor_pos_x2(floor_pos_x2),
        .floor_pos_y2(floor_pos_y2),
        .floor_pos_x3(floor_pos_x3),
        .floor_pos_y3(floor_pos_y3),
        .enable(enable),
		.vgaRed(vgaRed),
		.vgaGreen(vgaGreen),
		.vgaBlue(vgaBlue)
	);

    floor_gen FG(
        .rst(rst_db),
		.clk(clk_18),
        .floor_pos_x0(floor_pos_x0),
        .floor_pos_y0(floor_pos_y0),
        .floor_pos_x1(floor_pos_x1),
        .floor_pos_y1(floor_pos_y1),
        .floor_pos_x2(floor_pos_x2),
        .floor_pos_y2(floor_pos_y2),
        .floor_pos_x3(floor_pos_x3),
        .floor_pos_y3(floor_pos_y3),
        .enable(enable),
        .time_gap(time_gap),
        .hit_ceiling(hit_ceiling)
    );

	slime_move SM(
		.rst(rst_db),
		.clk(clk),
        .clk_vga(clk_18),
		.x(slime_pos_x),
		.y(slime_pos_y),
		.key(key_state),
        .floor_pos_x0(floor_pos_x0),
        .floor_pos_y0(floor_pos_y0),
        .floor_pos_x1(floor_pos_x1),
        .floor_pos_y1(floor_pos_y1),
        .floor_pos_x2(floor_pos_x2),
        .floor_pos_y2(floor_pos_y2),
        .floor_pos_x3(floor_pos_x3),
        .floor_pos_y3(floor_pos_y3),
        .enable(enable),
        .time_gap(time_gap),
        .hit_ceiling(hit_ceiling)
	);

	KeyboardDecoder key_de (
        .key_down(key_down),
        .last_change(last_change),
        .key_valid(been_ready),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst_db),
        .clk(clk)
    );

    vga_controller VC0(
        .pclk(clk_d2),
        .reset(rst_db),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );

	always @ (posedge clk) begin
        if (been_ready && key_down[last_change]) begin
            case (last_change)
                KEY_A: key_state <= 2'b10;
                KEY_D: key_state <= 2'b01;
                default: key_state <= 2'b00;
            endcase
        end
        else begin
            key_state <= 2'b00;
        end
    end
	
endmodule