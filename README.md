# WealthPole — Architecture Demo

A clean, minimal public demonstration of how the WealthPole risk engine and dashboard architecture is structured in MetaTrader 5 (MQL5).

This repository does not contain the full commercial EA.
Instead, it provides a professional-level blueprint showing how a modern grid/hedge system can be organized, separated into layers, and made maintainable.

## 🔍 What This Repo Is

This repository focuses on:

Clean and extensible architecture patterns

Separation of UI, inputs, and core logic

Demonstration of how a structured EA is organized

Readable, maintainable, modular MQL5 design

It is meant to illustrate how WealthPole is built, not to publish the internal logic.


## 🚫 What This Repo Is NOT

Not a complete trading system

Not a guaranteed profitable EA

Not a release of private or production code

Not intended for live trading

This is an architecture / educational demo only.


## 🧱 High-Level Architecture (Conceptual Overview)

WealthPole is designed with several clean layers.
In this demo, the code is simplified, but the architecture remains visible:

### 1. Main EA (.mq5)

Coordinates execution:

reads user inputs

updates UI

calls internal logic layers

Current demo file:
MQL5/Experts/FintorAI_MQL5_Starter.mq5

### 2. UI Layer (Dashboard & Controls)

(Shown conceptually for now — future public-safe modules will be added)

Responsibilities:

Draws dashboard on chart

Handles buttons (Grid, Hedge, Risk modes, Filters, etc.)

Keeps UI state separate from execution logic

### 3. Types & Config Layer

Purpose:

strongly-typed enums & structs

organized presets and modes

safe parameter mapping

(Currently represented in simplified form inside demo files.)

### 4. Core Logic Layer

Responsible for connecting events to logic hooks such as:

grid steps

hedge behaviors

recovery sequences

In this public demo, logic is intentionally minimal and shown only as structural placeholders inside:
MQL5/Include/FintorAI/Core.mqh.

## 📂 Current Folder Structure

```text
WealthPole-Architecture-Demo/
  MQL5/
    Experts/
      FintorAI_MQL5_Starter.mq5     # Main EA entrypoint
    Include/
      FintorAI/
        Core.mqh                    # Demo of structure + architecture hooks
    presets/
      example.set                   # Example inputs
  .gitignore
  LICENSE
  README.md
```

This layout mirrors how a real MT5 project is organized.

## 📈 How to Use This Architecture Demo

Clone or download the repository

Copy into MetaTrader 5 Data Folder structure

Open FintorAI_MQL5_Starter.mq5 in MetaEditor

Compile and attach to any chart (demo recommended)

Inspect:

how UI hooks are structured

how types / inputs are separated

how execution calls are routed

⚠️ Trading logic is intentionally limited — this is for architectural review only.

## 🧠 Design Principles Behind WealthPole

Separation of Concerns
UI, inputs, and logic are modular and replaceable.

Preset-driven risk
No magic numbers inside logic — everything comes from structured presets.

Engine Extensibility
The architecture lets you later plug in:

multiple grid engines

hedge systems

ML-based guards

adaptive risk profiles

without rewriting the EA from scratch.

## 👤 About the Author

Built & maintained by Hossein Asgari
Algorithmic Trading Architect — Founder @ Fintor AI

LinkedIn: https://www.linkedin.com/in/hossein-asgari-3b652416a/

Website: https://fintorai.com

## ⚠️ Disclaimer

This repository is for educational & architectural demonstration only.
It does not include full risk logic or trading engines.
Always test in demo environments.
