module pixel_gen(
     input [9:0] h_cnt,
     input [9:0] v_cnt,
     input valid,
     input [9:0] slime_pos_x,
     input [9:0] slime_pos_y,
     input [9:0] floor_pos_x0,
     input [9:0] floor_pos_y0,
     input [9:0] floor_pos_x1,
     input [9:0] floor_pos_y1,
     input [9:0] floor_pos_x2,
     input [9:0] floor_pos_y2,
     input [9:0] floor_pos_x3,
     input [9:0] floor_pos_y3,
     input [9:0] floor_pos_x4,
     input [9:0] floor_pos_y4,
     input [9:0] floor_pos_x5,
     input [9:0] floor_pos_y5,
     input [9:0] floor_pos_x6,
     input [9:0] floor_pos_y6,
     input [9:0] floor_pos_x7,
     input [9:0] floor_pos_y7,
     input [7:0] enable,
     output reg [3:0] vgaRed,
     output reg [3:0] vgaGreen,
     output reg [3:0] vgaBlue
     );

     wire [19:0] slime_face [19:0];

     assign slime_face[19] = 20'b00000000000000000000;
     assign slime_face[18] = 20'b00000000000000000000;
     assign slime_face[17] = 20'b00001100000000110000;
     assign slime_face[16] = 20'b00011110000001111000;
     assign slime_face[15] = 20'b00111111000011111100;
     assign slime_face[14] = 20'b00110011000011001100;
     assign slime_face[13] = 20'b00100001000010000100;
     assign slime_face[12] = 20'b00000000011000000000;
     assign slime_face[11] = 20'b00000000111100000000;
     assign slime_face[10] = 20'b00000001100110000000;
     assign slime_face[9] =  20'b00110001000010001100;
     assign slime_face[8] =  20'b00111100000000111100;
     assign slime_face[7] =  20'b00011111111111111000;
     assign slime_face[6] =  20'b00011111111111111000;
     assign slime_face[5] =  20'b00001111111111110000;
     assign slime_face[4] =  20'b00000111111111100000;
     assign slime_face[3] =  20'b00000001111110000000;
     assign slime_face[2] =  20'b00000000000000000000;
     assign slime_face[1] =  20'b00000000000000000000;
     assign slime_face[0] =  20'b00000000000000000000;
   
     always @(*) begin
          if (!valid) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
          else begin
               if ((h_cnt >= slime_pos_x && h_cnt < slime_pos_x + 10'd20) && (v_cnt < slime_pos_y && v_cnt >= slime_pos_y - 10'd20)) begin
                    if (slime_face[slime_pos_y - v_cnt][h_cnt - slime_pos_x]) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                    else {vgaRed, vgaGreen, vgaBlue} = 12'h0f0;
               end
               else begin
                    if ((h_cnt >= floor_pos_x0 && h_cnt < floor_pos_x0 + 10'd40) && (v_cnt >= floor_pos_y0 && v_cnt < floor_pos_y0 + 10'd5) && enable[0])
                         {vgaRed, vgaGreen, vgaBlue} = 12'hf00;

                    else if ((h_cnt >= floor_pos_x1 && h_cnt < floor_pos_x1 + 10'd40) && (v_cnt >= floor_pos_y1 && v_cnt < floor_pos_y1 + 10'd5) && enable[1])
                         {vgaRed, vgaGreen, vgaBlue} = 12'hf00;

                    else if ((h_cnt >= floor_pos_x2 && h_cnt < floor_pos_x2 + 10'd40) && (v_cnt >= floor_pos_y2 && v_cnt < floor_pos_y2 + 10'd5) && enable[2])
                         {vgaRed, vgaGreen, vgaBlue} = 12'hf00;

                    else if ((h_cnt >= floor_pos_x3 && h_cnt < floor_pos_x3 + 10'd40) && (v_cnt >= floor_pos_y3 && v_cnt < floor_pos_y3 + 10'd5) && enable[3])
                         {vgaRed, vgaGreen, vgaBlue} = 12'hf00;

                    else if ((h_cnt >= floor_pos_x4 && h_cnt < floor_pos_x4 + 10'd40) && (v_cnt >= floor_pos_y4 && v_cnt < floor_pos_y4 + 10'd5) && enable[4])
                         {vgaRed, vgaGreen, vgaBlue} = 12'hf00;

                    else if ((h_cnt >= floor_pos_x5 && h_cnt < floor_pos_x5 + 10'd40) && (v_cnt >= floor_pos_y5 && v_cnt < floor_pos_y5 + 10'd5) && enable[5])
                         {vgaRed, vgaGreen, vgaBlue} = 12'hf00;

                    else if ((h_cnt >= floor_pos_x6 && h_cnt < floor_pos_x6 + 10'd40) && (v_cnt >= floor_pos_y6 && v_cnt < floor_pos_y6 + 10'd5) && enable[6])
                         {vgaRed, vgaGreen, vgaBlue} = 12'hf00;

                    else if ((h_cnt >= floor_pos_x7 && h_cnt < floor_pos_x7 + 10'd40) && (v_cnt >= floor_pos_y7 && v_cnt < floor_pos_y7 + 10'd5) && enable[7])
                         {vgaRed, vgaGreen, vgaBlue} = 12'hf00;

                    else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
               end
          end
     end

endmodule