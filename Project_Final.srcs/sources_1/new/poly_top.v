`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2022 17:00:51
// Design Name: 
// Module Name: poly_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module poly_top(
    input enable,
    input BASYS3_CLK, pb_c,
    input [9:0] sw,             // 0 - 9
    input [2:0] sw_scale,       // 10 - 12
    input sw_neg,               // 15
    input [12:0] pixel_index,
    output reg [15:0] led,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] oled_data
    );

    wire pbc_out;
    debouncer db0 (.clk(BASYS3_CLK), .pb(pb_c), .pb_out(pbc_out)); 
    
    wire slow_clk, clk_6_25Mhz_out;
    flexible_clk clk0 (BASYS3_CLK, 400, slow_clk);
    flexible_clk clk6p25m (BASYS3_CLK, 6250000, clk_6_25Mhz_out);
    
    /* Main Logic Code */
    reg [2:0] mode = 0;
    reg mode_change = 0;
    
    // Mode 0 declalation
    reg [3:0] degrees; 
    reg deg_valid = 0;
    reg deg_confirm_b = 0;
    reg deg_set = 0;
    reg mode_0_disabled = 0;

    // Mode 1 declaration
    reg [3:0] curr_deg = 1;
    reg const_valid = 0;
    reg const_confirm_b = 0;
    reg const_set = 0;
    reg [3:0] coe;
    reg [3:0] neg;
    reg [15:0] coe_acc = 0; // 4 bits per coefficient. stores 4 coefficients
    integer coe_no = 0;
    reg mode_1_disabled = 0;

    // Modes Changer
    always @(posedge pbc_out) begin
        if (enable == 1) begin
            if (mode_change == 1) begin
                mode <= mode + 1;
                if (mode == 2) mode <= 0;
            end 
            
            if (deg_confirm_b == 1) begin
                deg_set <= 1;
            end else if (deg_confirm_b == 0) begin 
                deg_set <= 0;
            end
       end
    end

    // Constant selection confirmation (for mode 1)
    always @(posedge pbc_out or posedge slow_clk) begin
        if (pbc_out == 1 && const_confirm_b == 1) begin
            const_set <= 1;
        end else if (const_confirm_b == 0) begin
            const_set <= 0;
        end
    end
    
    // FSM
    always @(posedge slow_clk) begin
        if (mode == 0) begin 
            if (deg_set == 0) begin
                mode_0_disabled <= 0;
                neg <= 0;
                mode_change <= 0;                   // Disable mode_change
                // Display instruction to input Degree
                if (sw == 1 || sw == 2 || sw == 4 || sw == 8) begin
                    // Display number on OLED
                    led <= sw;
                    deg_valid <= 1;
                    deg_confirm_b <= 1;             // Enable degree confirm button
                end else begin
                    // Display Invalid on OLED
                    led <= 16'b11111_11111_11111_1;
                    deg_valid <= 0;
                    deg_confirm_b <= 0;             // Disable degree confirm button
                end
            end
            
            if (!mode_0_disabled && deg_valid && deg_set) begin     // If button is pressed and data is valid
                degrees = sw[3:0];                  // 1 -> 0, 2 -> 1, 4 -> 2, 8 -> 3.
                deg_confirm_b <= 0;             // Disable degree confirm button
                mode_change <= 1;               // Enable Mode change button
                led <= {12'b100000000000, degrees};
                // Display "push button to proceed to constants selection"
                mode_0_disabled <= 1;
                mode_1_disabled <= 0;
            end
        end
        
        else if (mode == 1) begin

            if (mode_1_disabled == 0 && (curr_deg <= degrees) ) begin
                mode_change <= 0;                   // Disable mode change button
                // Display instruction to set constant for degree X

                if (sw == 1 || sw == 2 || sw == 4 || sw == 8 || sw == 16 || 
                    sw == 32 || sw == 64 || sw == 128 || sw == 256 || sw == 512) begin
                    // Display number on OLED
                    led <= sw;
                    const_valid <= 1; 
                    const_confirm_b <= 1;
                end else begin
                    // Display invalid on OLED
                    led <= 16'b11111_11111_11111_1;
                    const_valid <= 0;
                    const_confirm_b <= 0;
                end    

                if (const_valid && const_set) begin      // Button Pressed to confirm
                    led <= 16'b10101_01010_10101_0;     // Detect whether it is gg into this if block
                    case(sw)
                        1 : coe = 0;
                        2 : coe = 1;
                        4 : coe = 2;
                        8 : coe = 3;
                        16 : coe = 4;
                        32 : coe = 5;
                        64 : coe = 6;
                        128 : coe = 7;
                        256 : coe = 8;
                        512 : coe = 9; 
                    endcase

                    neg[coe_no] <= sw_neg;                  

                    coe_acc[(coe_no * 4)] <= coe[0];
                    coe_acc[(coe_no * 4) + 1] <= coe[1];
                    coe_acc[(coe_no * 4) + 2] <= coe[2];
                    coe_acc[(coe_no * 4) + 3] <= coe[3];   
                    coe_no <= coe_no + 1;

                    curr_deg <= curr_deg * 2;      
                    const_valid <= 0;
                    const_confirm_b <= 0;  
                    coe <= 0;
                    if (curr_deg == degrees) begin
                        mode_1_disabled <= 1;
                    end     
                end
            end else begin                      // constants inputted for all degrees
                // Display "done setting constants" and "press to calculate"
                led <= 16'b00000_00000_00000_0;
                curr_deg <= 1;
                coe_no <= 0;
                mode_change <= 1;
            end
            
        end 

        else if (mode == 2) begin // Do calculations, to repeat press center button
            // Display calculation
            led <= 16'b00000_00000_00000_0;
        end
    end


    /* Oled Data Display */
    wire [6:0] x, y;
    PItoXY convert0 (pixel_index, x, y);
    wire [15:0] num0_oled, num1_oled, num2_oled, num3_oled, num4_oled, num5_oled, 
                num6_oled, num7_oled, num8_oled, num9_oled, cross_oled;

    cross_display cross0 (clk_6_25Mhz_out, x, y, cross_oled);
    number_0 num0 (clk_6_25Mhz_out, x, y, num0_oled);
    number_1 num1 (clk_6_25Mhz_out, x, y, num1_oled);
    number_2 num2 (clk_6_25Mhz_out, x, y, num2_oled);
    number_3 num3 (clk_6_25Mhz_out, x, y, num3_oled);
    number_4 num4 (clk_6_25Mhz_out, x, y, num4_oled);
    number_5 num5 (clk_6_25Mhz_out, x, y, num5_oled);
    number_6 num6 (clk_6_25Mhz_out, x, y, num6_oled);
    number_7 num7 (clk_6_25Mhz_out, x, y, num7_oled);
    number_8 num8 (clk_6_25Mhz_out, x, y, num8_oled);
    number_9 num9 (clk_6_25Mhz_out, x, y, num9_oled);

    // Different displays for the modes
    wire [15:0] select_degree_oled, degree_confirm_oled, select_constant_oled, constant_confirm_oled;
    select_degree select_degree0 (clk_6_25Mhz_out, x, y, select_degree_oled);
    degree_confirmation degree_confirmation0 (clk_6_25Mhz_out, x, y, degree_confirm_oled, degrees);
    select_constant select_constant0 (clk_6_25Mhz_out,x ,y, select_constant_oled, curr_deg, sw_neg);
    constant_confirmation constant_confirmation0 (clk_6_25Mhz_out, x, y, constant_confirm_oled, coe_acc, degrees, neg);

    // Display for the graph display
    wire [15:0] plot_oled, plot_bg_oled;
    display_plot display_plot0 (clk_6_25Mhz_out, x, y, coe_acc, degrees, plot_oled, neg, sw_scale);
    display_plot_bg display_plot_bg0 (clk_6_25Mhz_out, x, y, plot_bg_oled);

    reg [15:0] num;
    always @(posedge clk_6_25Mhz_out) begin
        if (sw == 1) num <= num0_oled;
        else if (sw == 2) num <= num1_oled;
        else if (sw == 4) num <= num2_oled;
        else if (sw == 8) num <= num3_oled;
        else if (sw == 16) num <= num4_oled;
        else if (sw == 32) num <= num5_oled;
        else if (sw == 64) num <= num6_oled;
        else if (sw == 128) num <= num7_oled;
        else if (sw == 256) num <= num8_oled;
        else if (sw == 512) num <= num9_oled;
        else num <= cross_oled;
    end 

    assign oled_data = (mode == 0 && deg_set == 0) ? (num | select_degree_oled) : (
                        (mode == 0 && mode_0_disabled == 1 && deg_valid == 1 && deg_set == 1) ? (degree_confirm_oled) : (
                        (mode == 1 && mode_1_disabled == 0) ? (num | select_constant_oled) : (
                        (mode == 1 && mode_1_disabled == 1) ? (constant_confirm_oled) : (
                        (mode == 2) ? ((plot_oled == 0) ? plot_bg_oled : plot_oled) : num
                        ))));

    
    /* 7 Segment display */
    reg [6:0] seg_scale = 7'b1111111;
    reg [3:0] an_scale = 4'b1110;
    reg [1:0] seg_count = 0;

    always @(posedge slow_clk) begin
        seg_count <= (seg_count == 3) ? 0 : seg_count + 1;

        case (seg_count)
            0: 
                begin
                    an_scale <=4'b1110;
                    if (sw_scale == 3'b000) begin
                        seg_scale <= 7'b1000000; // 0
                    end else if (sw_scale == 3'b001) begin
                        seg_scale <= 7'b0010010; // 5
                    end else if (sw_scale == 3'b010) begin
                        seg_scale <= 7'b0100100; // 2
                    end else if (sw_scale == 3'b100) begin
                        seg_scale <= 7'b1111001; // 1
                    end else begin
                        seg_scale <= 7'b0111111; // -
                    end
                end
            1:
                begin
                    an_scale <= 4'b1101;
                    if (sw_scale == 3'b000) begin
                        seg_scale <= 7'b1111001; // 1
                    end else if (sw_scale == 3'b001) begin
                        seg_scale <= 7'b1000000; // 0
                    end else if (sw_scale == 3'b010) begin
                        seg_scale <= 7'b1000000; // 0
                    end else if (sw_scale == 3'b100) begin
                        seg_scale <= 7'b1000000; // 0
                    end else begin
                        seg_scale <= 7'b0111111; // -
                    end
                end
            2: 
                begin
                    an_scale <= 4'b1011;
                    seg_scale <= 7'b0111111; // -
                end
            3: 
                begin
                    an_scale <= 4'b0111;
                    if (sw_scale == 3'b000 || sw_scale == 3'b001 || sw_scale == 3'b010 || sw_scale == 3'b100) seg_scale <= 7'b1000000; // 0
                    else seg_scale <= 7'b0111111;
                end   
        endcase
    end
    
    assign seg = (mode == 2) ? seg_scale : 7'b1111111;
    assign an = (mode == 2) ? an_scale : 4'b1111;

endmodule
