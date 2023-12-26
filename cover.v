module cover(
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input valid,
    input clk_bling,
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue
    );

    wire [12:0] P [14:0];
    assign P[0] =  13'b0111111111000;
    assign P[1] =  13'b0111111111100;
    assign P[2] =  13'b0111111111110;
    assign P[3] =  13'b0111000011110;
    assign P[4] =  13'b0111000001110;
    assign P[5] =  13'b0111000011110;
    assign P[6] =  13'b0111111111110;
    assign P[7] =  13'b0111111111100;
    assign P[8] =  13'b0111111111000;
    assign P[9] =  13'b0111000000000;
    assign P[10] = 13'b0111000000000;
    assign P[11] = 13'b0111000000000;
    assign P[12] = 13'b0111000000000;
    assign P[13] = 13'b0111000000000;
    assign P[14] = 13'b0111000000000;
    
    wire [12:0] R [14:0];
    assign R[0] =  13'b0111111111000;
    assign R[1] =  13'b0111111111100;
    assign R[2] =  13'b0111111111110;
    assign R[3] =  13'b0111000011110;
    assign R[4] =  13'b0111000001110;
    assign R[5] =  13'b0111000011110;
    assign R[6] =  13'b0111111111110;
    assign R[7] =  13'b0111111111100;
    assign R[8] =  13'b0111111111000;
    assign R[9] =  13'b0111001110000;
    assign R[10] = 13'b0111000111000;
    assign R[11] = 13'b0111000011100;
    assign R[12] = 13'b0111000011100;
    assign R[13] = 13'b0111000001110;
    assign R[14] = 13'b0111000001110;

    wire [12:0] E [14:0];
    assign E[0] =  13'b0111111111110;
    assign E[1] =  13'b0111111111110;
    assign E[2] =  13'b0111111111110;
    assign E[3] =  13'b0111000000000;
    assign E[4] =  13'b0111000000000;
    assign E[5] =  13'b0111000000000;
    assign E[6] =  13'b0111111111110;
    assign E[7] =  13'b0111111111110;
    assign E[8] =  13'b0111111111110;
    assign E[9] =  13'b0111000000000;
    assign E[10] = 13'b0111000000000;
    assign E[11] = 13'b0111000000000;
    assign E[12] = 13'b0111111111110;
    assign E[13] = 13'b0111111111110;
    assign E[14] = 13'b0111111111110;

    wire [12:0] S [14:0];
    assign S[0] =  13'b0001111111110;
    assign S[1] =  13'b0011111111110;
    assign S[2] =  13'b0111111111110;
    assign S[3] =  13'b0111000000000;
    assign S[4] =  13'b0111000000000;
    assign S[5] =  13'b0111000000000;
    assign S[6] =  13'b0111111111000;
    assign S[7] =  13'b0011111111100;
    assign S[8] =  13'b0001111111110;
    assign S[9] =  13'b0000000001110;
    assign S[10] = 13'b0000000001110;
    assign S[11] = 13'b0000000001110;
    assign S[12] = 13'b0111111111110;
    assign S[13] = 13'b0111111111100;
    assign S[14] = 13'b0111111111000;

    wire [12:0] N [14:0];
    assign N[0] =  13'b0111000001110;
    assign N[1] =  13'b0111100001110;
    assign N[2] =  13'b0111100001110;
    assign N[3] =  13'b0111110001110;
    assign N[4] =  13'b0111110001110;
    assign N[5] =  13'b0111111001110;
    assign N[6] =  13'b0111111001110;
    assign N[7] =  13'b0111011101110;
    assign N[8] =  13'b0111001111110;
    assign N[9] =  13'b0111001111110;
    assign N[10] = 13'b0111000111110;
    assign N[11] = 13'b0111000111110;
    assign N[12] = 13'b0111000011110;
    assign N[13] = 13'b0111000011110;
    assign N[14] = 13'b0111000001110;

    wire [12:0] T [14:0];
    assign T[0] =  13'b0111111111110;
    assign T[1] =  13'b0111111111110;
    assign T[2] =  13'b0111111111110;
    assign T[3] =  13'b0000011100000;
    assign T[4] =  13'b0000011100000;
    assign T[5] =  13'b0000011100000;
    assign T[6] =  13'b0000011100000;
    assign T[7] =  13'b0000011100000;
    assign T[8] =  13'b0000011100000;
    assign T[9] =  13'b0000011100000;
    assign T[10] = 13'b0000011100000;
    assign T[11] = 13'b0000011100000;
    assign T[12] = 13'b0000011100000;
    assign T[13] = 13'b0000011100000;
    assign T[14] = 13'b0000011100000;

    wire [12:0] L [14:0];
    assign L[0] =  13'b0111000000000;
    assign L[1] =  13'b0111000000000;
    assign L[2] =  13'b0111000000000;
    assign L[3] =  13'b0111000000000;
    assign L[4] =  13'b0111000000000;
    assign L[5] =  13'b0111000000000;
    assign L[6] =  13'b0111000000000;
    assign L[7] =  13'b0111000000000;
    assign L[8] =  13'b0111000000000;
    assign L[9] =  13'b0111000000000;
    assign L[10] = 13'b0111000000000;
    assign L[11] = 13'b0111000000000;
    assign L[12] = 13'b0111111111110;
    assign L[13] = 13'b0111111111110;
    assign L[14] = 13'b0111111111110;

    wire [12:0] I [14:0];
    assign I[0] =  13'b0111111111110;
    assign I[1] =  13'b0111111111110;
    assign I[2] =  13'b0111111111110;
    assign I[3] =  13'b0000011100000;
    assign I[4] =  13'b0000011100000;
    assign I[5] =  13'b0000011100000;
    assign I[6] =  13'b0000011100000;
    assign I[7] =  13'b0000011100000;
    assign I[8] =  13'b0000011100000;
    assign I[9] =  13'b0000011100000;
    assign I[10] = 13'b0000011100000;
    assign I[11] = 13'b0000011100000;
    assign I[12] = 13'b0111111111110;
    assign I[13] = 13'b0111111111110;
    assign I[14] = 13'b0111111111110;

    wire [12:0] M [14:0];
    assign M[0] =  13'b0111000001110;
    assign M[1] =  13'b0111100011110;
    assign M[2] =  13'b0111100011110;
    assign M[3] =  13'b0111110111110;
    assign M[4] =  13'b0111111111110;
    assign M[5] =  13'b0111111111110;
    assign M[6] =  13'b0111111111110;
    assign M[7] =  13'b0111111111110;
    assign M[8] =  13'b0111011101110;
    assign M[9] =  13'b0111011101110;
    assign M[10] = 13'b0111011101110;
    assign M[11] = 13'b0111011101110;
    assign M[12] = 13'b0111011101110;
    assign M[13] = 13'b0111011101110;
    assign M[14] = 13'b0111011101110;

    wire [12:0] U [14:0];
    assign U[0] =  13'b0111000001110;
    assign U[1] =  13'b0111000001110;
    assign U[2] =  13'b0111000001110;
    assign U[3] =  13'b0111000001110;
    assign U[4] =  13'b0111000001110;
    assign U[5] =  13'b0111000001110;
    assign U[6] =  13'b0111000001110;
    assign U[7] =  13'b0111000001110;
    assign U[8] =  13'b0111000001110;
    assign U[9] =  13'b0111000001110;
    assign U[10] = 13'b0111000001110;
    assign U[11] = 13'b0111100011110;
    assign U[12] = 13'b0011111111100;
    assign U[13] = 13'b0001111111000;
    assign U[14] = 13'b0000111110000;

    wire [12:0] J [14:0];
    assign J[0] =  13'b0111111111110;
    assign J[1] =  13'b0111111111110;
    assign J[2] =  13'b0111111111110;
    assign J[3] =  13'b0000011100000;
    assign J[4] =  13'b0000011100000;
    assign J[5] =  13'b0000011100000;
    assign J[6] =  13'b0000011100000;
    assign J[7] =  13'b0000011100000;
    assign J[8] =  13'b0000011100000;
    assign J[9] =  13'b0000011100000;
    assign J[10] = 13'b0000011100000;
    assign J[11] = 13'b0000011100000;
    assign J[12] = 13'b0111111100000;
    assign J[13] = 13'b0111111100000;
    assign J[14] = 13'b0111110000000;
   
    always @(*) begin
        if (!valid) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else begin
            if(h_cnt >= 10'd265 && h_cnt < 10'd278 && v_cnt >= 10'd120 && v_cnt < 10'd135)begin
                if (S[v_cnt - 10'd120][10'd12 - (h_cnt - 10'd265)]) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd278 && h_cnt < 10'd291 && v_cnt >= 10'd120 && v_cnt < 10'd135)begin
                if (L[v_cnt - 10'd120][10'd12 - (h_cnt - 10'd278)]) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd291 && h_cnt < 10'd304 && v_cnt >= 10'd120 && v_cnt < 10'd135)begin
                if (I[v_cnt - 10'd120][10'd12 - (h_cnt - 10'd291)]) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd304 && h_cnt < 10'd317 && v_cnt >= 10'd120 && v_cnt < 10'd135)begin
                if (M[v_cnt - 10'd120][10'd12 - (h_cnt - 10'd304)]) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd317 && h_cnt < 10'd330 && v_cnt >= 10'd120 && v_cnt < 10'd135)begin
                if (E[v_cnt - 10'd120][10'd12 - (h_cnt - 10'd317)]) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd343 && h_cnt < 10'd356 && v_cnt >= 10'd120 && v_cnt < 10'd135)begin
                if (J[v_cnt - 10'd120][10'd12 - (h_cnt - 10'd343)]) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd356 && h_cnt < 10'd369 && v_cnt >= 10'd120 && v_cnt < 10'd135)begin
                if (U[v_cnt - 10'd120][10'd12 - (h_cnt - 10'd356)]) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd369 && h_cnt < 10'd382 && v_cnt >= 10'd120 && v_cnt < 10'd135)begin
                if (M[v_cnt - 10'd120][10'd12 - (h_cnt - 10'd369)]) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd382 && h_cnt < 10'd395 && v_cnt >= 10'd120 && v_cnt < 10'd135)begin
                if (P[v_cnt - 10'd120][10'd12 - (h_cnt - 10'd382)]) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end

            else if(h_cnt >= 10'd260 && h_cnt < 10'd273 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (P[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd260)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd273 && h_cnt < 10'd286 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (R[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd273)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd286 && h_cnt < 10'd299 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (E[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd286)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd299 && h_cnt < 10'd312 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (S[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd299)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd312 && h_cnt < 10'd325 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (S[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd312)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd338 && h_cnt < 10'd351 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (E[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd338)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd351 && h_cnt < 10'd364 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (N[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd351)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd364 && h_cnt < 10'd377 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (T[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd364)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd377 && h_cnt < 10'd390 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (E[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd377)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if(h_cnt >= 10'd390 && h_cnt < 10'd403 && v_cnt >= 10'd360 && v_cnt < 10'd375)begin
                if (R[v_cnt - 10'd360][10'd12 - (h_cnt - 10'd390)] && clk_bling) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end

            else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        end
    end

endmodule