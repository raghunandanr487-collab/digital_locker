# Digital Lock / Password Checker (Verilog FSM)

## Project Description
This project implements a simple digital lock system using Verilog.  
The design checks whether the entered password matches a stored password and opens the lock if the password is correct.

The system is implemented using a **Finite State Machine (FSM)**.

## Features
- Password verification using a 4-bit input
- Lock opens only when the correct password is entered
- Implemented using FSM states
- Simulated using ModelSim

## FSM States
The design consists of four states:

1. IDLE  
   System waits for the user to press the enter signal.

2. CHECK_PASSWORD  
   The entered password is compared with the stored password.

3. ERROR  
   If the password is incorrect, the system returns to the idle state.

4. OPEN  
   If the password is correct, the lock opens.

### Stored Password=0011

## there are some waveforms snippet and rtl digram 

<img width="1630" height="1038" alt="Image" src="https://github.com/user-attachments/assets/a4cf7b1f-bb3e-456a-9be8-4c14e209377e" />


## waveform


<img width="1772" height="420" alt="Image" src="https://github.com/user-attachments/assets/4e1ecc11-1163-4ced-be45-990d85bd554f" />

