# WealthPole Architecture Demo

Architecture & UI demo for **WealthPole 2** — a grid / hedge–oriented risk engine and recovery system built for **MetaTrader 5 (MQL5)**.

This repository showcases **how the system is structured**, not a “plug-and-play” EA for instant profits.

---

## 🎯 What This Repo Is (and Is Not)

✅ Focuses on:

- Panel / dashboard architecture (MT5 chart UI)
- Clean separation between **UI**, **inputs**, and **core logic**
- Safer handling of grid / hedge parameters
- Readable, maintainable MQL5 code structure

❌ It is **not**:

- A finished commercial EA
- A guarantee of profitability
- A full release of private production logic

Think of it as a **blueprint** for how a complex risk engine can be organized in MQL5.

---

## 🧱 High-Level Architecture

The WealthPole 2 architecture is split into a few clear layers:

- **Main EA (.mq5)**  
  Orchestrates everything: reads inputs, updates the panel, calls core logic.

- **UI Layer (`WP2_UI.mqh` and related)**  
  - Draws the main dashboard on the chart  
  - Handles buttons / modes (Risk, Grid, Hedge, Filters, etc.)  
  - Keeps panel state separate from trade logic

- **Types & Config (`WP2_Types.mqh`, `WP2_Inputs.mqh`)**  
  - Strongly-typed enums & structs  
  - Central place for presets, modes, and risk profiles

- **Core Logic (`WP2_Core.mqh` / similar)**  
  - Hooks where grid / hedge / recovery logic is called  
  - Designed so that different engines can be swapped in without rewriting the UI

This separation lets you iterate on **risk & execution logic** without breaking the UI, و برعکس.

---

## 📂 Planned Folder Structure

> Your local terminal path: `MQL5/` → here we mirror the same idea in Git.

```text
WealthPole-Architecture-Demo/
  Experts/
    WealthPole_2_Demo.mq5          # Main EA entrypoint (demo)
  Include/
    WP2_UI.mqh                      # Dashboard & panel components
    WP2_Types.mqh                   # enums / structs / constants
    WP2_Inputs.mqh                  # input mapping & presets
    WP2_Core.mqh                    # core hooks for logic (stubs / demo)
  presets/
    WP2_Sample_Setfile.set          # example input preset (optional)
  .gitignore
  README.md
```
Some files may still be stubs or partial demos — the goal here is to present the architecture pattern, not your full private production code.


🚀 How to Use This Demo

Clone or download the repository.

Copy files into your MetaTrader 5 data folder:

MQL5/Experts/WealthPole-Architecture-Demo/...
MQL5/Include/WealthPole-Architecture-Demo/...


Open WealthPole_2_Demo.mq5 in MetaEditor.

Compile and attach it to a chart (preferably a demo account).

Interact with the panel:

Switch between modes (Risk / Grid / Hedge / Filters)

Observe how the UI responds, how inputs are structured, and how the code is organized.

⚠️ Trading logic in this demo is intentionally limited / simplified.
It is for architecture review and educational purposes, not live trading.

🧠 Design Principles

WealthPole’s architecture follows a few core principles:

Separation of Concerns
UI, inputs, and trade logic live in different modules.

Preset-Driven Risk
All sensitive parameters (lot sizing, steps, max grid, etc.) are pulled from structured presets instead of being scattered in code.

Extendable Core
The Core layer is written so you can later plug in:

different grid profiles

dual-hedge engines

ML-based guards or regime filters

👤 About the Author

Built and maintained by Hossein Asgari
Algorithmic Trading Architect & Founder of Fintor AI

I design trading systems the way engineers build aircraft —
modular, testable, and resilient.

LinkedIn: https://www.linkedin.com/in/hossein-asgari-3b652416a/

Website: https://fintorai.com

⚠️ Disclaimer

This repository is for educational and architectural demonstration purposes only.
It does not provide financial advice, signals, or guaranteed profitability.
Always test thoroughly on demo before using any trading logic in live environments.
