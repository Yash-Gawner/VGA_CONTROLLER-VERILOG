# VGA_CONTROLLER-VERILOG
Design and simulation of a VGA controller using Verilog HDL, featuring pixel clock division, horizontal and vertical counters, HSync/VSync signal generation, and RGB output generation. Simulated using Icarus Verilog and GTKWave.


# VGA Controller Using Verilog HDL

## 📌 Overview

This project implements a basic **VGA (Video Graphics Array) controller using Verilog HDL**. The design generates horizontal synchronization (HSync) and vertical synchronization (VSync) signals, maintains horizontal and vertical pixel counters, and produces RGB signals for the visible display area.

The project is intended for learning FPGA digital design, video timing, counters, clock division, and VGA signal generation.

## 🎯 Project Objectives

* Generate a 25 MHz pixel clock from a 50 MHz input clock.
* Implement a horizontal counter to track pixel positions.
* Implement a vertical counter to track display lines.
* Generate HSync and VSync signals.
* Generate 4-bit red, green, and blue output signals.
* Simulate and verify the timing behavior using Icarus Verilog and GTKWave.

## 🛠️ Technologies Used

* **HDL:** Verilog
* **Simulator:** Icarus Verilog
* **Waveform Viewer:** GTKWave
* **Testbench:** Verilog simulation testbench

## 🧩 Design Modules

### 1. VGA Clock Divider — `VGA_clk_div`

Divides the 50 MHz input clock by two to generate a 25 MHz pixel clock.

### 2. Horizontal Counter — `VGA_hori_count`

Tracks horizontal pixel positions from 0 to 799. It generates a counter-enable pulse at the end of each horizontal line to advance the vertical counter.

### 3. Vertical Counter — `VGA_ver_counter`

Tracks vertical line positions and advances when the horizontal counter reaches the end of a line.

### 4. VGA Top Module — `VGA_top`

Connects the clock divider and counters. It generates the HSync, VSync, red, green, and blue output signals.

### 5. Testbench — `VGA_tb`

Generates the input clock and reset signals, records simulation waveforms, displays counter checkpoints, and measures the HSync period.

## ⏱️ VGA Timing Parameters

The design uses timing values associated with a 640 × 480 VGA display.

| Parameter                 |                  Value |
| ------------------------- | ---------------------: |
| Input clock               |                 50 MHz |
| Pixel clock               |                 25 MHz |
| Horizontal total          |       800 pixel clocks |
| Vertical total            |              525 lines |
| Horizontal sync interval  |        96 pixel clocks |
| Vertical sync interval    |                2 lines |
| Horizontal visible region | Counter values 144–783 |
| Vertical visible region   |  Counter values 35–514 |
| RGB output width          |     4 bits per channel |

The expected horizontal line period is approximately **32 µs**, based on 800 pixel clocks at 25 MHz.

## 🎨 RGB Output

The current implementation generates a white rectangular region in the active display area.

* **Red:** `4'hF` inside the visible region.
* **Green:** `4'hF` inside the visible region.
* **Blue:** `4'hF` inside the visible region.
* Outside the visible region, all RGB outputs are set to zero.

Combining full-intensity red, green, and blue produces white; setting all three channels to zero produces black.

## 📂 Project Structure

```text
VGA-Controller-Verilog/
├── VGA_clk_div.v
├── VGA_hori_count.v
├── VGA_ver_counter.v
├── VGA_top.v
├── VGA_tb.v
└── README.md
```

## ▶️ How to Run the Simulation

### Step 1: Compile the Verilog files

Open a terminal in the project directory and run:

```bash
iverilog -o VGA VGA_clk_div.v VGA_hori_count.v VGA_ver_counter.v VGA_top.v VGA_tb.v
```

### Step 2: Run the simulation

```bash
vvp VGA
```

The simulation generates a VCD waveform file named `VGA_tb.vcd` and prints checkpoint values and HSync period measurements to the terminal.

### Step 3: View the waveforms

```bash
gtkwave VGA_tb.vcd
```

In GTKWave, inspect the following signals:

* `clk`
* `reset`
* `pixel_clk`
* `horizontal_counter`
* `vertical_counter`
* `vga_counter_enable`
* `Hsynq`
* `Vsynq`
* `red`, `green`, and `blue`

## 📊 Expected Simulation Behavior

* The input clock runs at 50 MHz.
* The pixel clock toggles at half the input frequency.
* The horizontal counter advances through one 800-clock line.
* The vertical counter advances once per completed horizontal line.
* HSync and VSync change according to the configured counter ranges.
* RGB outputs are white in the configured active region and black elsewhere.

## 🚀 Possible Future Improvements

* Correct and verify the horizontal and vertical counter-enable logic.
* Add reset handling to the horizontal and vertical counters.
* Parameterize VGA timing values.
* Implement colored bars, gradients, or simple geometric shapes.
* Add a complete VGA timing verification testbench.
* Test the design on an FPGA board with a compatible VGA output interface.

## 📚 Learning Outcomes

Through this project, I practiced:

* Clock division and sequential logic.
* Counter design and timing control.
* Horizontal and vertical synchronization.
* RGB pixel generation.
* Verilog module integration.
* Testbench development and waveform analysis.

## 👨‍💻 Author :- YASH RAJENDRA GAWNER

Developed as a hands-on project to understand VGA timing and digital video generation using Verilog HDL.
