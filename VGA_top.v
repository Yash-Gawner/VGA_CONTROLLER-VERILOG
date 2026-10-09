module VGA_top(
    input clk,
    input reset,
    output [3:0]red,
    output [3:0]green,
    output [3:0]blue,
    output Hsynq,
    output Vsynq
);

wire [15:0]horizontal_counter;
wire[9:0]vertical_counter;
wire pixel_clk ,vga_counter_enable;

VGA_hori_count hc(
    .pixel_clk(pixel_clk),
    .vga_counter_enable(vga_counter_enable),
    .horizontal_counter(horizontal_counter) 
);

VGA_ver_counter vc(
    .pixel_clk(pixel_clk),
    .vga_counter_enable(vga_counter_enable),
    .vertical_counter(vertical_counter)
);

VGA_clk_div VC(
    .clk(clk),
    .reset(reset),
    .pixel_clk(pixel_clk)
);

assign Hsynq  = (horizontal_counter < 96) ? 1'b1 : 1'b0;
assign Vsynq  = (vertical_counter < 2) ? 1'b1 : 1'b0;
assign red    = (horizontal_counter >= 144 && horizontal_counter < 784 && vertical_counter >= 35 && vertical_counter < 515) ? 4'hF : 4'h0;
assign green  = (horizontal_counter >= 144 && horizontal_counter < 784 && vertical_counter >= 35 && vertical_counter < 515) ? 4'hF : 4'h0;
assign blue   = (horizontal_counter >= 144 && horizontal_counter < 784 && vertical_counter >= 35 && vertical_counter < 515) ? 4'hF : 4'h0;

endmodule