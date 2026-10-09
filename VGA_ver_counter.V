module VGA_ver_counter(
    input pixel_clk,
    input vga_counter_enable,
    output reg [9:0]vertical_counter = 0
);

always @(posedge pixel_clk)begin

    if(vga_counter_enable ) begin

        if(vertical_counter == 10'd525)
            vertical_counter <= 0;
        
        else 
            vertical_counter <= vertical_counter +1;
    end
        
end

endmodule