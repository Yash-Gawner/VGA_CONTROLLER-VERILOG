module VGA_clk_div(
    input clk,
    input reset,
    output reg pixel_clk = 0
);

always @(posedge clk or posedge reset)begin

    if(reset)
        pixel_clk <= 0;
    
    else 
        pixel_clk <= ~pixel_clk; // 25MHz clk

end
endmodule 