# 1-to-4 Demultiplexer (Structural Design using 1-to-2 DEMUX)
<br># 🔹 Overview
<br>
<br>This project implements and verifies a 1-to-4 Demultiplexer (DeMux) using a structural hierarchy of 1-to-2 <br>demultiplexers in Verilog.
<br>
<br># The design is built in a modular way:
<br>
<br>A basic 1-to-2 demux (demux1t2)
<br>Used to construct a 1-to-4 demux (demux1t4)
<br>Verified using a testbench (tb_demux1t4)
<br># 🔹 Design Hierarchy
<br>1. demux1t2 (Basic Building Block)
<br>
<br># A 1-bit 1-to-2 demultiplexer implemented using:
<br>
<br>NOT gate
<br>AND gates
<br>Enable control
<br>
<br># Function:
<br>
<br>Routes input din to either dout0 or dout1 based on sel
<br>Output is active only when en = 1
<br>2. demux1t4 (Top Module)
<br>
<br># Built using three instances of demux1t2 in a 2-stage structure:
<br>
<br># First stage:
<br>Splits input into two intermediate signals (dfeed1, dfeed2) using sel[0]
<br># Second stage:
<br>Further splits each feed using sel[1]
<br>Produces final outputs dout[3:0]
<br>
<br># Output mapping:
<br>
<br>sel	Output active
<br>00	dout[0]
<br>01	dout[1]
<br>10	dout[2]
<br>11	dout[3]
<br># 🔹 Features of Design
<br>Fully structural Verilog modeling
<br>Hierarchical design (uses reusable modules)
<br>Enable-controlled operation
<br>Scalable architecture using basic logic gates
<br># 🔹 Testbench Description (tb_demux1t4)
<br>
<br># The testbench verifies:
<br>
<br>Enable functionality (en)
<br>All select combinations (00 to 11)
<br>Various input cases including unknown (x) values
<br># ✔ Stimulus Applied:
<br>Enable signal toggling
<br># din and sel combinations:
<br>Normal binary values
<br>Edge cases with x (unknown states)
<br># ✔ Monitoring:
<br># Uses $monitor to display:
<br>Simulation time
<br>Enable signal
<br>Input
<br>Select lines
<br>Output
<br># ✔ Waveform Generation:
<br>
<br>Dumps simulation data into:
<br>
<br>demux1t4.vcd
<br>Can be viewed using GTKWave
<br># 🔹 How to Run Simulation
<br>
<br># Using Icarus Verilog:
<br>
<br>iverilog -o demux_tb tb_demux1t4.v demux1t4.v
<br>vvp demux_tb
<br>gtkwave demux1t4.vcd
<br># 🔹 Expected Behavior
<br>When en = 1, input is routed to exactly one output based on sel
<br>When en = 0, all outputs remain inactive
<br>Unknown inputs (x) may propagate depending on simulator rules
<br># 🔹 Key Learning Outcomes
<br>Structural Verilog design using primitive gates
<br>Hierarchical module instantiation
<br>Designing complex systems from basic blocks
<br>Writing and analyzing testbenches
<br>Waveform debugging using VCD files
