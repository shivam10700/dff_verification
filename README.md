# 📘 SystemVerilog-Based Verification of D Flip-Flop

## 🚀 Overview
This project demonstrates the design and verification of a synchronous D Flip-Flop (D-FF) using a **class-based SystemVerilog testbench**. The goal is to build a structured verification environment similar to industry practices, including stimulus generation, monitoring, and automated checking.

---

## 🎯 Objectives
- Design a D Flip-Flop using SystemVerilog  
- Develop a modular verification environment  
- Validate sequential behavior with correct clock-cycle timing  
- Implement automated checking using a scoreboard  

---

## 🏗️ Project Structure

dff-verification/
├── README.md
├── docs/
│   └── waveform.png            # (optional screenshot)
│
├── design/
│   └── dff.sv                  # DUT
│
├── tb/
│   ├── interface/
│   │   └── dff_if.sv
│   │
│   ├── components/
│   │   ├── driver.sv
│   │   ├── monitor.sv
│   │   └── scoreboard.sv
│   │
│   └── top/
│       └── tb_top.sv
│
├── sim/
│   └── run.do                  # (optional for ModelSim)
│
└── waves/
    └── dump.vcd                # (optional)

---

## ⚙️ Methodology

### 🔹 Design
- Implemented a **positive-edge triggered D Flip-Flop**
- Asynchronous active-low reset (`rst_n`)

### 🔹 Verification Components

- **Interface**
  - Encapsulates DUT signals
  - Enables clean communication between TB components

- **Driver**
  - Generates randomized input stimulus
  - Controls `d` and `rst_n` signals

- **Monitor**
  - Observes DUT inputs/outputs at every clock edge
  - Logs activity for debugging

- **Scoreboard**
  - Predicts expected output
  - Compares with actual DUT output
  - Reports PASS/ERROR

---

## 🧠 Key Learning

### ⚠️ Problem Faced
Initially, the scoreboard assumed:

q = d (same cycle)


This caused multiple false errors.

### ✅ Solution
Corrected the logic to:

q(t) = d(t-1)


- Introduced `prev_d` to store previous input  
- Enabled **cycle-accurate verification**  
- Eliminated all mismatches  

---

## 📊 Simulation

- Tool: **EDA Playground**
- Language: **SystemVerilog**
- Waveform: **EPWave**

### ✔️ Results
- All test cases passed  
- No functional errors  
- Correct 1-cycle delayed behavior verified  

---

## 💡 Features

- Class-based verification architecture  
- Virtual interface usage  
- Parallel execution using `fork-join`  
- Random stimulus generation  
- Automated checking via scoreboard  

---

## 📈 Outcome

- Achieved **complete functional verification**  
- Built a **mini-UVM style environment**  
- Gained understanding of:
  - Sequential logic timing  
  - Testbench architecture  
  - Debugging methodology  

---

## 🔮 Future Enhancements

- Add **functional coverage**  
- Implement **SystemVerilog Assertions (SVA)**  
- Introduce **transaction-level modeling**  
- Upgrade to **UVM-based verification**  

---

## 👨‍💻 Author
**Shivam Yadav**  
M.Tech (Microelectronics & VLSI)  
Aspiring Design Verification Engineer  

---

## ⭐ Conclusion
This project demonstrates a strong foundation in **SystemVerilog verification concepts**, including structured testbench design, debugging, and timing-aware validation — essential for modern DV roles.
