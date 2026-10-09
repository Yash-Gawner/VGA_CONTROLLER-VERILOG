module VGA_hori_count(
    input pixel_clk,
    output  vga_counter_enable ,
    output reg [15:0]horizontal_counter = 0
);

assign vga_counter_enable = (horizontal_counter == 10'd799);

always @(posedge pixel_clk)begin

    if(horizontal_counter == 14'd799)
        horizontal_counter <= 0;
    
    else 
        horizontal_counter <= horizontal_counter + 1;
end

endmodule