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

<img width="1107" height="926" alt="Image" src="https://github.com/user-attachments/assets/a2b52f56-5e73-4e00-984a-9137b4781d6b" />

---

## 📂 블록 다이어그램

<img width="1717" height="1093" alt="Image" src="https://github.com/user-attachments/assets/89dd5d68-84bb-4e54-9904-3af1d3488b4b" />

---

## 🔄 FSM (Finite State Machine)

<p align="center">
  <img src="docs/fsm.png" alt="CPU FSM" width="700">
</p>

---
