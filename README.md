# 🔬 VLSI School

A collection of Verilog and SystemVerilog designs, testbenches, and assignments created during VLSI training. All designs are simulated using **QuestaSim / ModelSim**.

> **Student:** Nikhil Prince &nbsp;|&nbsp; **Roll No:** 26VS11N120

---

## 📁 Repository Structure

```
VLSI-School/
├── Class Programs/      # In-class design exercises and labs
├── Home Works/          # Graded homework assignments
├── Material/            # Reference documents and standards
└── work/                # QuestaSim workspace files
```

---

## 🏫 Class Programs

| # | Project | Description | HDL |
|---|---------|-------------|-----|
| 1 | **Gates** | Basic logic gate implementations | Verilog |
| 2 | **D FF** | D Flip-Flop design + interview questions | Verilog |
| 3 | **Bin to Grey Conv** | Binary to Gray code converter | Verilog |
| 4 | **Calculator** | Simple calculator module | Verilog |
| 5 | **Parametrized Prior Dtct** | Parameterized priority detector | Verilog |
| 6 | **Test 1** | 8-to-1 MUX, 8-to-3 priority encoder | Verilog |
| 7 | **Test 1 Optimized** | Optimized version of Test 1 | Verilog |
| 8 | **FIFO** | Synchronous FIFO with APB decoder | Verilog |
| 9 | **FIFO V2** | Improved FIFO design | Verilog |
| 10 | **Async FIFO** | Asynchronous FIFO (dual-clock domain) | SystemVerilog |
| 11 | **Round Robin Arbiter** | Round-robin arbitration with priority encoder | Verilog |
| 12 | **RR Arbiter** | Alternate round-robin arbiter implementation | Verilog |
| 13 | **SUV FSM** | Vending machine FSM (state diagram included) | SystemVerilog |
| 14 | **Test 2 – Vending Machine** | Vending machine FSM test | SystemVerilog |

---

## 📝 Homework Assignments

| HW | Topic | Description |
|----|-------|-------------|
| 1 | **NAND/NOR Realization** | All basic gates using only NAND and NOR |
| 3 | **Full Adder using Half Adder** | Hierarchical full adder design |
| 4 | **Ripple Carry Adder** | Multi-bit ripple carry adder |
| 6 | **Large Adder** | Extended-width adder |
| 7 | **Extra Large Adder** | Further scaled adder design |
| 8 | **10 Detection** | Pattern/sequence detection circuit |
| 9 | **3-Input Comparator** | Three-input magnitude comparator |
| 10 | **4×4 Multiplier** | 4-bit by 4-bit multiplier |
| 11 | **Parameterized Designs** | Parameterized 2:1 MUX & parameterized gates |
| 12 | **Encoders** | 8-to-3 and 16-to-4 encoders |
| 13 | **Rising Edge Detector** | Detects rising edges on input signal |
| 14 | **Falling Edge Detector** | Detects falling edges on input signal |
| 15 | **Rise & Fall Edge Detector** | Dual-edge detector |
| 16 | **Mod Counters** | Modulo-N counters |
| 17 | **Frequency Divider** | Clock frequency divider |
| 18 | **Up/Down Counter** | Bidirectional counter |
| 21 | **Traffic Light Controller** | FSM-based traffic light — includes Advanced, Detailed, Manual Override, and Parameterized versions |

---

## 📚 Reference Material

- **IEEE Std 1364-2005** — IEEE Standard for Verilog HDL
- Class reference images and notes

---

## 🛠️ Tools & Setup

- **Simulator:** QuestaSim / ModelSim
- **Languages:** Verilog (`.v`) and SystemVerilog (`.sv`)
- **Run Scripts:** Most projects include a `run.do` macro file

### Running a simulation

```tcl
# Inside QuestaSim
do run.do
```

---

## 📂 Project Layout (per design)

Each project typically contains:

```
project_name/
├── design.v / dut.v      # RTL design source
├── tb.v                   # Testbench
├── run.do                 # QuestaSim run script
├── vsim.wlf              # Waveform log (if generated)
└── work/                  # Compiled library
```

---

## 📄 License

This repository is for educational purposes as part of VLSI coursework.
