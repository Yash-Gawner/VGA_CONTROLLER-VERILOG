`timescale 1ns/1ps
module VGA_tb;

    reg clk = 0;
    reg reset = 1;
    wire [3:0]red;
    wire [3:0]green;
    wire [3:0]blue;
    wire Hsynq;
    wire Vsynq;

VGA_top uut( 

    .clk(clk),
    .reset(reset),
    .red(red),
    .green(green),
    .blue(blue),
    .Hsynq(Hsynq),
    .Vsynq(Vsynq)
);

 always #10 clk = ~clk;

initial begin
    $dumpfile("VGA_tb.vcd");
    $dumpvars(0, VGA_tb);
    // $dumpvars(1, VGA_tb);
    // $dumpvars(0, VGA_tb.uut.horizontal_counter, VGA_tb.uut.vertical_counter);


    #100 reset = 0;
    #17_000_000;
    $finish;
end

initial begin
    #1_000;     $display("t=1us   pclk=%b h=%0d v=%0d en=%b", uut.pixel_clk, uut.horizontal_counter, uut.vertical_counter, uut.vga_counter_enable);
    #200_000;   $display("t=201us pclk=%b h=%0d v=%0d en=%b", uut.pixel_clk, uut.horizontal_counter, uut.vertical_counter, uut.vga_counter_enable);
    #2_000_000; $display("t=2.2ms pclk=%b h=%0d v=%0d en=%b", uut.pixel_clk, uut.horizontal_counter, uut.vertical_counter, uut.vga_counter_enable);
end

always @(posedge uut.vga_counter_enable)
    $display("%0t  enable pulse, v = %0d", $time, uut.vertical_counter);


//$timeformat(-9, 0, " ns", 10);

// Self-check: measure Hsync period (expect 31.78 us = 800 x 40 ns = 32 us)
    time t_last = 0;
    always @(negedge Hsynq) begin
        if (t_last != 0)
            $display("Hsync period = %0t ns", $time - t_last);
        t_last = $time;
    end


endmodule