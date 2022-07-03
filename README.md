# RISC-V-processor
Implementation of 4 Stage Pipelined RISC V Processor using Verilog

This processor supports addition (add), shift left logical (sll) and Unconditional Jump (J) instructions only. 
The processor contains forwarding unit to resolve data hazards. The processor has Reset, CLK as inputs and no outputs. 
The processor has instruction fetch unit, register file (with eight 8-bit registers), Execution and Writeback unit. 
The processor also contains three pipelined registers IF/ID, ID/EX and EX/WB.
The PC register is 8-bit and Address and Data size is also 8-bits
