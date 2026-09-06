# MICROPROCESSOR
# OBJECTIVE:
  To design and implement a simple 8-bit microprocessor using Verilog HDL and verify its functionality through simulation in ModelSim.
# FEATURES:
 1.8-bit data processing
 
 2.Four general-purpose registers (R0–R3).
 
 3.8-bit Program Counter (PC).
 
 4.Instruction and data memory.
 
  5.Supports arithmetic and logical operations.
  
  6.Supports LOAD and STORE operations.
  
  7.Supports MOV, JMP, NOP and HALT instructions.
  
  8.Verilog-based testbench for functional verification.
  
  9.ModelSim simulation and waveform analysis.
  
# ALGORITHM:
  -Initialize the processor and reset all registers.
  
  -Fetch the instruction from instruction memory using the Program Counter (PC).
  
  -Decode the instruction opcode and operands.
  
  -Execute the required operation.
  
  -For memory instructions, read from or write to data memory.
  
  -Update the required register or memory location.
  
  -Increment the PC and fetch the next instruction.
  
  -Continue execution until the HALT instruction is encountered.
  
  -Display and verify the final register and memory values.
# OUTPUT:
   C:\Users\Nimisha\Pictures\Screenshots\MICROPROCESSOR OP.png
# RESULT:
   The 8-bit microprocessor was successfully designed and simulated using Verilog HDL. The processor correctly executed LOAD, ADD, and STORE instructions.
For the given test case:
R0 = 30
R1 = 10
Memory[20H] = 30
Thus, the functionality of the designed microprocessor was successfully verified using ModelSim.


  
