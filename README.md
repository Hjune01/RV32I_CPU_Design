# RV32I Multi-Cycle CPU Design

## 📌 프로젝트 개요
본 프로젝트는 **RISC-V RV32I Base Instruction Set**을 지원하는  
**멀티사이클(Multi-Cycle) CPU**를 **SystemVerilog**와 **Vivado**를 사용하여 설계한 것입니다.  
CPU의 각 명령어 실행 과정을 **Instruction Fetch → Decode → Execute → Memory → Write-Back** 단계로 분리하여,  
FSM 기반 제어기로 효율적인 동작을 구현하였습니다.

---

## 🛠️ 개발 환경
- **언어**: SystemVerilog  
- **EDA Tool**: Xilinx Vivado  

---

## 📖 Instruction Set
본 CPU는 **RV32I Base Instruction Set**을 지원합니다.  
아래 표는 지원하는 주요 명령어를 요약한 것입니다.  

<p align="center">
  <img src="docs/instruction_set.png" alt="RV32I Instruction Set" width="700">
</p>

---

## 📂 블록 다이어그램
CPU의 전체 구조를 블록 다이어그램으로 표현했습니다.

<p align="center">
  <img src="docs/block_diagram.png" alt="CPU Block Diagram" width="700">
</p>

---

## 🔄 FSM (Finite State Machine)
멀티사이클 CPU의 제어 흐름은 FSM을 통해 구현되었습니다.  

<p align="center">
  <img src="docs/fsm.png" alt="CPU FSM" width="700">
</p>

---
